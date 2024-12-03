unit unitOrders;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  TformOrders = class(TForm)
    DBGrid1: TDBGrid;
    edtProduct: TEdit;
    edtQuantity: TEdit;
    Label1: TLabel;
    btnAddItem: TButton;
    btnRemoveItem: TButton;
    btnCancel: TButton;
    dsItens: TDataSource;
    memItens: TFDMemTable;
    memItensid: TIntegerField;
    memItensname: TStringField;
    memItensquantity: TFloatField;
    edtSearchClient: TEdit;
    dbgRegisteredClients: TDBGrid;
    btnSave: TButton;
    procedure edtProductKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtProductEnter(Sender: TObject);
    procedure edtQuantityEnter(Sender: TObject);
    procedure edtQuantityKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAddItemClick(Sender: TObject);
    procedure btnRemoveItemClick(Sender: TObject);
    procedure edtSearchClientChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
    procedure SearchProduct;
    procedure AddItem;
    procedure InsertItem(Quantity : double);
    procedure ClearFields;
  public
    { Public declarations }
  end;

var
  formOrders: TformOrders;

implementation

{$R *.dfm}

uses unitDMOrders, unitDMProducts, unitDMClients;

procedure TformOrders.edtProductEnter(Sender: TObject);
begin
  edtProduct.Text := '';
end;

procedure TformOrders.edtProductKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    SearchProduct;
  end;
end;

procedure TformOrders.edtQuantityEnter(Sender: TObject);
begin
  edtQuantity.Text := '1';
end;

procedure TformOrders.edtQuantityKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    AddItem;
  end;
end;

procedure TformOrders.edtSearchClientChange(Sender: TObject);
begin
  DMClients.dsClients.DataSet.Filter := 'Active = true AND UPPER(Name) LIKE ' + QuotedStr('%' + UpperCase(edtSearchClient.Text) + '%');
  DMClients.dsClients.DataSet.Filtered := True;
end;

procedure TformOrders.FormShow(Sender: TObject);
begin
  DMClients.dsClients.DataSet.Filter := 'Active = true';
  DMClients.dsClients.DataSet.Filtered := True;
end;

procedure TformOrders.SearchProduct;
var
  IdProduct : Integer;
  SQL : string;
begin
  if edtProduct.Text <> '' then
  begin
    SQL := 'SELECT * FROM tb_products ';
    if TryStrToInt(edtProduct.Text, IdProduct) then
    begin
      SQL := SQL + 'WHERE id = :id';
      DMOrders.qSearchProducts.SQL.Text := SQL;
      DMOrders.qSearchProducts.ParamByName('id').AsInteger := IdProduct;
    end
    else
    begin
      SQL := SQL + 'WHERE UPPER(NAME) LIKE ' + QuotedStr('%') + ' + UPPER(:name) + ' + QuotedStr('%');
      DMOrders.qSearchProducts.SQL.Text := SQL;
      DMOrders.qSearchProducts.ParamByName('name').AsString := edtProduct.Text;
    end;

    DMOrders.qSearchProducts.Open;

    if not DMOrders.qSearchProducts.IsEmpty then
    begin
      edtProduct.Text := DMOrders.qSearchProducts.FieldByName('id').AsString + ' - ' + DMOrders.qSearchProducts.FieldByName('name').AsString;

      if edtQuantity.CanFocus then
      begin
        edtQuantity.SetFocus;
        edtQuantity.SelStart := Length(edtQuantity.Text);
      end;
    end;
  end;
end;

procedure TformOrders.AddItem;
var
  Quantity : Integer;
  QuantityFractionate : double;
begin
  if (edtQuantity.Text <> '') and not DMOrders.qSearchProducts.IsEmpty then
  begin
    if not DMOrders.qSearchProducts.FieldByName('allowfractionate').AsBoolean then
    begin
      if TryStrToInt(edtQuantity.Text, Quantity) then
        InsertItem(Quantity);
    end
    else
    begin
      if TryStrToFloat(edtQuantity.Text, QuantityFractionate) then
      begin
        InsertItem(QuantityFractionate);
      end;
    end;
    ClearFields;
  end
  else
    ClearFields;
end;

procedure TformOrders.InsertItem(Quantity : double);
begin
  if not dsItens.DataSet.Active then
    dsItens.DataSet.Open;

  dsItens.DataSet.Append;
  dsItens.DataSet.FieldByName('id').AsInteger := DMOrders.qSearchProducts.FieldByName('id').AsInteger;
  dsItens.DataSet.FieldByName('name').AsString := DMOrders.qSearchProducts.FieldByName('name').AsString;
  dsItens.DataSet.FieldByName('quantity').AsFloat := Quantity;
  dsItens.DataSet.Post;
end;
procedure TformOrders.btnAddItemClick(Sender: TObject);
begin
  AddItem;
end;

procedure TformOrders.btnRemoveItemClick(Sender: TObject);
begin
  if not dsItens.DataSet.IsEmpty then
    dsItens.DataSet.Delete;

  ClearFields;
end;

procedure TformOrders.btnSaveClick(Sender: TObject);
var
  QuestionAnswer : Integer;
begin
  if not dsItens.DataSet.IsEmpty and
    not DMClients.dsClients.DataSet.IsEmpty then
  begin
    MessageDlg('You want to finalize the sale now?', mtConfirmation, [mbYes, mbNo], 0);
    if not QuestionAnswer = mrYes then
      Exit;

    dsItens.DataSet.First;
    while not dsItens.DataSet.Eof do
    begin
      ShowMessage('Id: ' + dsItens.DataSet.FieldByName('Id').AsString +
                  ', Name: ' + dsItens.DataSet.FieldByName('Name').AsString +
                  ', Quantity: ' + dsItens.DataSet.FieldByName('Quantity').AsString);

      dsItens.DataSet.Next;
    end;
    
  end;

end;

procedure TformOrders.ClearFields;
begin
  edtProduct.Text := '';
  edtQuantity.Text := '1';
  DMOrders.qSearchProducts.EmptyDataSet;

  if edtProduct.CanFocus then
    edtProduct.SetFocus;
end;

end.
