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
    memItensvalue: TCurrencyField;
    memItenstotal: TCurrencyField;
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

uses unitDMOrders, unitDMProducts, unitDMClients, ConMinerva;

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
      DMOrders.qProducts.SQL.Text := SQL;
      DMOrders.qProducts.ParamByName('id').AsInteger := IdProduct;
    end
    else
    begin
      SQL := SQL + 'WHERE UPPER(NAME) LIKE ' + QuotedStr('%') + ' + UPPER(:name) + ' + QuotedStr('%');
      DMOrders.qProducts.SQL.Text := SQL;
      DMOrders.qProducts.ParamByName('name').AsString := edtProduct.Text;
    end;

    DMOrders.qProducts.Open;

    if not DMOrders.qProducts.IsEmpty then
    begin
      edtProduct.Text := DMOrders.qProducts.FieldByName('id').AsString + ' - ' + DMOrders.qProducts.FieldByName('name').AsString;

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
  if (edtQuantity.Text <> '') and not DMOrders.qProducts.IsEmpty then
  begin
    if not DMOrders.qProducts.FieldByName('allowfractionate').AsBoolean then
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
  dsItens.DataSet.FieldByName('id').AsInteger := DMOrders.qProducts.FieldByName('id').AsInteger;
  dsItens.DataSet.FieldByName('name').AsString := DMOrders.qProducts.FieldByName('name').AsString;
  dsItens.DataSet.FieldByName('value').AsCurrency := DMOrders.qProducts.FieldByName('price').AsCurrency;
  dsItens.DataSet.FieldByName('quantity').AsFloat := Quantity;
  dsItens.DataSet.FieldByName('total').AsCurrency := DMOrders.qProducts.FieldByName('price').AsCurrency * Quantity;
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
  OrderTotal : double;
  IdOrder : Integer;
  SQL : string;
begin
  try
    if not dsItens.DataSet.IsEmpty and
      not DMClients.dsClients.DataSet.IsEmpty then
    begin
     MessageDlg('You want to finalize the sale now?', mtConfirmation, [mbYes, mbNo], 0);
      if not QuestionAnswer = mrYes then
        Exit;

      OrderTotal := 0;
      dsItens.DataSet.First;
      while not dsItens.DataSet.Eof do
      begin
        OrderTotal := OrderTotal + dsItens.DataSet.FieldByName('total').AsCurrency;
        dsItens.DataSet.Next;
      end;

      ConMinerva.TConMinerva.FDConnection1.StartTransaction;

      DMOrders.qOrders.SQL.Text := 'INSERT INTO tb_orders(IdClient, Total)' +
                              'VALUES(:IdClient, :Total)';
      DMOrders.qOrders.ParamByName('IdClient').AsInteger := DMclients.dsClients.DataSet.FieldByName('Id').AsInteger;
      DMOrders.qOrders.ParamByName('Total').AsFloat := OrderTotal;
      DMOrders.qOrders.ExecSQL;

      ConMinerva.TConMinerva.FDConnection1.Commit;
      ConMinerva.TConMinerva.FDConnection1.StartTransaction;

      DMOrders.qOrders.SQL.Text := 'SELECT TOP 1 * FROM tb_orders ORDER BY id DESC';
      DMOrders.qOrders.Open;

      if DMOrders.qOrders.IsEmpty then
        IdOrder := 1
      else
        IdOrder := DMOrders.qOrders.FieldByName('id').AsInteger;

      SQL := 'INSERT INTO tb_order_itens (IdOrder, IdProduct, Quantity, UnitPrice)  VALUES ';

      dsItens.DataSet.First;
      while not dsItens.DataSet.Eof do
      begin
        SQL := SQL + Format('(%d, %d, %s, %s), ', [
          IdOrder,
          dsItens.DataSet.FieldByName('Id').AsInteger,
          dsItens.DataSet.FieldByName('Quantity').AsString.Replace(',', '.'),
          dsItens.DataSet.FieldByName('Value').Asstring.Replace(',', '.')
        ]);
        dsItens.DataSet.Next;
      end;

      Delete(SQL, Length(SQL) - 1, 2);

      DMOrders.qOrders.SQL.Text := SQL;
      DMOrders.qOrders.ExecSQL;

      ConMinerva.TConMinerva.FDConnection1.Commit;

      dsItens.DataSet.First;
    end;
    ShowMessage('Order save successfully!');

    except on E: Exception do
    begin
      ConMinerva.TConMinerva.FDConnection1.Rollback;
      ShowMessage('An error occurs during the process of saving data: ' + E.Message);
    end;
  end;
end;

procedure TformOrders.ClearFields;
begin
  edtProduct.Text := '';
  edtQuantity.Text := '1';
  DMOrders.qProducts.EmptyDataSet;

  if edtProduct.CanFocus then
    edtProduct.SetFocus;
end;

end.
