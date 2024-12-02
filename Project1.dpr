program Project1;

uses
  Vcl.Forms,
  unitMain in 'unitMain.pas' {formMain},
  unitClients in 'unitClients.pas' {formClients},
  unitOrders in 'unitOrders.pas' {formOrders},
  unitSettings in 'unitSettings.pas' {formSettings},
  unitReports in 'unitReports.pas' {formReports},
  unitProducts in 'unitProducts.pas' {formProducts},
  ConMinerva in 'ConMinerva.pas' {TConMinerva: TDataModule},
  unitDMClients in 'unitDMClients.pas' {DMclients: TDataModule},
  DMProducts in 'DMProducts.pas' {DataModule2: TDataModule},
  Global in 'Global.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformMain, formMain);
  Application.CreateForm(TformClients, formClients);
  Application.CreateForm(TformOrders, formOrders);
  Application.CreateForm(TformSettings, formSettings);
  Application.CreateForm(TformReports, formReports);
  Application.CreateForm(TformProducts, formProducts);
  Application.CreateForm(TTConMinerva, TConMinerva);
  Application.CreateForm(TDMclients, DMclients);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.Run;
end.