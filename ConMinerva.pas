unit ConMinerva;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, Windows, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef;

type
  TTConMinerva = class(TDataModule)
    FDConnection1: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    function GetConnectionString: string;
    const DB_FILE_NAME = 'Minerva.dll';
    { Private declarations }
  public
    { Public declarations }
  end;

var

  TConMinerva: TTConMinerva;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TTConMinerva.DataModuleCreate(Sender: TObject);
begin
  FDConnection1.ConnectionString := GetConnectionString;

  if FDConnection1.ConnectionString <> '' then
  begin
    try
      FDConnection1.Connected := True;
    except
      on E: Exception do
        raise Exception.Create('Error, Database co');
    end;
  end
  else
    //ShowMessage('N�o foi poss�vel recuperar a string de conex�o da DLL.');

end;

function TTConMinerva.GetConnectionString: string;
var
  DLLHandle: THandle;
  GetConnStr: function: PChar; stdcall;
  FileStream: TFileStream;
  Bytes: TBytes;
  MemoryStream: TMemoryStream;
begin
  if not FileExists(DB_FILE_NAME) then
  begin
    try
      FileStream := TFileStream.Create(DB_FILE_NAME, fmCreate);
      try
        Bytes := TEncoding.UTF8.GetBytes('Database=minerva;User_Name=sa;Password=Minerva2024;SERVER=localhost\SQLExpress;OSAuthent=No;ApplicationName=Enterprise/Architect/Ultimate;Workstation=DELLG15;MARS=yes;DriverID=MSSQL');
        FileStream.WriteBuffer(Bytes[0], Length(Bytes));
      finally
        FileStream.Free;
      end;
    except
      on E: Exception do
    end;
  end;
  
  FileStream := TFileStream.Create(DB_FILE_NAME, fmOpenRead or fmShareDenyWrite);
  try
    MemoryStream := TMemoryStream.Create;
    try
      MemoryStream.CopyFrom(FileStream, FileStream.Size);
      SetLength(Bytes, MemoryStream.Size);
      MemoryStream.Position := 0;
      MemoryStream.ReadBuffer(Bytes[0], MemoryStream.Size);
      Result := TEncoding.Default.GetString(Bytes); // Converte para string usando a codifica��o padr�o
    finally
      MemoryStream.Free;
    end;
  finally
    FileStream.Free;
  end;
end;

end.
