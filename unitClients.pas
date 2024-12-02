unit unitClients;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TformClients = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbgRegisteredClients: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    edtSearchClient: TEdit;
    edtmPhone: TMaskEdit;
    edtEmail: TEdit;
    edtAddress: TEdit;
    edtName: TEdit;
    chkActive: TCheckBox;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtSearchClientChange(Sender: TObject);
    procedure dbgRegisteredClientsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgRegisteredClientsCellClick(Column: TColumn);
    procedure dbgRegisteredClientsKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    Editingclient : Boolean;

    procedure SaveClient;
    procedure NewClient;
    procedure FillFields;
  public
    { Public declarations }
  end;

var
  formClients: TformClients;

implementation

{$R *.dfm}

uses unitMain, unitDMClients;

procedure TformClients.SaveClient;
begin

end;

procedure TformClients.NewClient;
begin

end;

procedure TformClients.FillFields;
var
  QuestionAnswer : Integer;
begin
  if not EditingClient then
  begin
    QuestionAnswer := MessageDlg('Creating a new Client, you want to cancel?', mtConfirmation, [mbYes, mbNo], 0);

    if not QuestionAnswer = mrYes then
      Exit;
  end;

  if not dbgRegisteredClients.DataSource.DataSet.IsEmpty then
  begin
    EditingClient := true;
    edtName.Text := dbgRegisteredClients.DataSource.DataSet.FieldByName('Name').AsString;
    edtAddress.Text := dbgRegisteredClients.DataSource.DataSet.FieldByName('Address').AsString;
    edtmPhone.Text := dbgRegisteredClients.DataSource.DataSet.FieldByName('Phone').AsString;
    edtEmail.Text := dbgRegisteredClients.DataSource.DataSet.FieldByName('Email').AsString;
    chkActive.Checked := dbgRegisteredClients.DataSource.DataSet.FieldByName('Active').AsBoolean;
  end;
end;

procedure TformClients.dbgRegisteredClientsCellClick(Column: TColumn);
begin
  FillFields;
end;

procedure TformClients.dbgRegisteredClientsKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key in [VK_RETURN, VK_F2] then
  begin
    Key := 0;
  end;
end;

procedure TformClients.dbgRegisteredClientsKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key in [VK_UP, VK_LEFT, VK_RIGHT, VK_DOWN] then
  begin
    FillFields;
  end;
end;

procedure TformClients.edtSearchClientChange(Sender: TObject);
begin
  //DMClients.tbClients.Locate('name', edtSearchClient.Text, [loPartialKey]);
  DMClients.dsClients.DataSet.Filter := 'Name LIKE ' + QuotedStr('%' + edtSearchClient.Text + '%');
  DMClients.dsClients.DataSet.Filtered := True;
  FillFields;
end;

procedure TformClients.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F2 then
  begin

  end;

  if Key = VK_F7 then
  begin

  end;

end;

procedure TformClients.FormShow(Sender: TObject);
begin
  EditingClient := true;
  dbgRegisteredClients.DataSource.DataSet.First;
  FillFields;
end;

end.