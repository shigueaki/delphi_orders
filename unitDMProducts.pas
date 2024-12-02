unit unitDMProducts;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDMProducts = class(TDataModule)
    tbProduct: TFDTable;
    dsProduct: TDataSource;
    tbProductId: TFDAutoIncField;
    tbProductName: TStringField;
    tbProductDescription: TStringField;
    tbProductPrice: TFMTBCDField;
    tbProductAllowFractionate: TBooleanField;
    tbProductActive: TBooleanField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMProducts: TDMProducts;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses ConMinerva;

{$R *.dfm}

end.
