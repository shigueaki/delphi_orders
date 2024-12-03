unit unitDMOrders;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  Data.DB, FireDAC.Comp.DataSet;

type
  TDMOrders = class(TDataModule)
    qProducts: TFDQuery;
    dsProducts: TDataSource;
    qOrders: TFDQuery;
    dsOrders: TDataSource;
    qOrdersId: TFDAutoIncField;
    qProductsId: TFDAutoIncField;
    qProductsName: TStringField;
    qProductsDescription: TStringField;
    qProductsPrice: TFMTBCDField;
    qProductsAllowFractionate: TBooleanField;
    qProductsActive: TBooleanField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMOrders: TDMOrders;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses ConMinerva;

{$R *.dfm}

end.
