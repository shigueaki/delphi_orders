unit unitDMClients;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDMclients = class(TDataModule)
    tbClients: TFDTable;
    dsClients: TDataSource;
    tbClientsid: TFDAutoIncField;
    tbClientsname: TStringField;
    tbClientsaddress: TStringField;
    tbClientsphone: TStringField;
    tbClientsemail: TStringField;
    tbClientsactive: TBooleanField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMclients: TDMclients;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses ConMinerva;

{$R *.dfm}

end.
