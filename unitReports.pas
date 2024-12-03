unit unitReports;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, frxSmartMemo,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frCoreClasses, frxClass, frxDBSet;

type
  TformReports = class(TForm)
    Button1: TButton;
    frxReport1: TfrxReport;
    tbOrders: TFDTable;
    tbItens: TFDTable;
    dsOrders: TDataSource;
    dsItens: TDataSource;
    cdsOrders: TfrxDBDataset;
    cdsItens: TfrxDBDataset;
    tbOrdersId: TFDAutoIncField;
    tbOrdersIdClient: TIntegerField;
    tbOrdersCreatedAt: TSQLTimeStampField;
    tbOrdersTotal: TFMTBCDField;
    tbItensId: TFDAutoIncField;
    tbItensIdOrder: TIntegerField;
    tbItensIdProduct: TIntegerField;
    tbItensQuantity: TFMTBCDField;
    tbItensUnitPrice: TFMTBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formReports: TformReports;

implementation

{$R *.dfm}

uses ConMinerva;

end.
