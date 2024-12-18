unit unitClients;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TformClients = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbgRegisteredClients: TDBGrid;
    btnSave: TButton;
    btnNewClient: TButton;
    edtSearchClient: TEdit;
    edtmPhone: TMaskEdit;
    edtEmail: TEdit;
    edtAddress: TEdit;
    edtName: TEdit;
    chkActive: TCheckBox;
    Label5: TLabel;
    Label1: TLabel;
    lblId: TLabel;
    procedure edtSearchClientChange(Sender: TObject);
    procedure dbgRegisteredClientsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgRegisteredClientsCellClick(Column: TColumn);
    procedure dbgRegisteredClientsKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnNewClientClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure edtEmailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Editingclient : Boolean;

    procedure SaveClient;
    procedure NewClient;
    procedure FillFields;
    procedure ClearFields;
    function ValidateFields : string;
  public
    { Public declarations }
  end;

var
  formClients: TformClients;

implementation

{$R *.dfm}

uses unitMain, unitDMClients;

procedure TformClients.SaveClient;
var
  ValidadeResponse : string;
  QuestionAnswer : Integer;
begin
  ValidadeResponse :=  ValidateFields;
  if ValidadeResponse <> '' then
  begin
    ShowMessage('Please complete the following fields:' + ValidadeResponse);
    Exit;
  end;

  QuestionAnswer := MessageDlg('Do you want to save now?', mtConfirmation, [mbYes, mbNo], 0);

    if QuestionAnswer <> mrYes then
      Exit;

  if EditingClient then
    DMClients.tbClients.Edit
  else
    DMClients.tbClients.Append;

  DMClients.tbClients.FieldByName('Name').AsString    := edtName.Text;
  DMClients.tbClients.FieldByName('Address').AsString := edtAddress.Text;
  DMClients.tbClients.FieldByName('Phone').AsString   := edtmPhone.Text;
  DMClients.tbClients.FieldByName('Email').AsString   := edtEmail.Text;
  DMClients.tbClients.FieldByName('Active').AsBoolean := chkActive.Checked;

  DMClients.tbClients.Post;

  ShowMessage('Successfully registered client');
  ClearFields;
  EditingClient := true;
  dbgRegisteredClients.DataSource.DataSet.First;
  FillFields;
end;

function TformClients.ValidateFields : string;
begin
  Result := '';
  if Trim(edtName.Text) = '' then
    Result := Result +  sLineBreak + 'Name';
end;

procedure TformClients.NewClient;
begin
  ClearFields;
  EditingClient := false;
end;

procedure TformClients.btnNewClientClick(Sender: TObject);
begin
  NewClient;
  if edtName.CanFocus then
    edtName.SetFocus;
end;

procedure TformClients.btnSaveClick(Sender: TObject);
begin
  SaveClient;
end;

procedure TformClients.ClearFields;
begin
  lblId.Caption := '0';
  edtName.Clear;
  edtAddress.Clear;
  edtmPhone.Clear;
  edtEmail.Clear;
  chkActive.Checked := true;
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
    lblId.Caption := dbgRegisteredClients.DataSource.DataSet.FieldByName('Id').AsString;
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

procedure TformClients.edtEmailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    SaveClient;
end;

procedure TformClients.edtSearchClientChange(Sender: TObject);
begin
  DMClients.dsClients.DataSet.Filter := 'Name LIKE ' + QuotedStr('%' + UpperCase(edtSearchClient.Text) + '%');
  DMClients.dsClients.DataSet.Filtered := True;
  FillFields;
end;

procedure TformClients.FormShow(Sender: TObject);
begin
  EditingClient := true;
  dbgRegisteredClients.DataSource.DataSet.First;
  FillFields;
end;

end.
