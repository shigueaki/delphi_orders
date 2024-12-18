unit unitMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxBarBuiltInMenu, cxGraphics,
  dxUIAClasses, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinBasic, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinOffice2019Black, dxSkinOffice2019Colorful,
  dxSkinOffice2019DarkGray, dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringtime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinTheBezier, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinWXI, dxSkinXmas2008Blue, System.ImageList,
  Vcl.ImgList, cxImageList, cxPC, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TformMain = class(TForm)
    tabMain: TcxTabControl;
    cxImageList1: TcxImageList;
    FDConnection1: TFDConnection;
    qTest: TFDQuery;
    DataSource1: TDataSource;
    procedure tabMainChange(Sender: TObject);
    procedure OpenForm(AFormClass: TFormClass; AOwner: TComponent; ATabControl : TcxTabControl);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formMain: TformMain;

implementation

{$R *.dfm}

uses unitClients, unitOrders, unitReports, unitSettings, unitProducts;

procedure TformMain.tabMainChange(Sender: TObject);
var
  FormClients : TformClients;
begin

  case tabMain.TabIndex of
    0: begin
      OpenForm(TformOrders, Self, tabMain);
    end;
    1: begin
      OpenForm(TformClients, Self, tabMain);
    end;
    2: begin
      OpenForm(TformProducts, Self, tabMain);
    end;
    3: begin
     OpenForm(TformReports, Self, tabMain);
    end;
    4: begin
     OpenForm(TformSettings, Self, tabMain);
    end;
  end;
end;

procedure TformMain.FormCreate(Sender: TObject);
begin
  OpenForm(TformOrders, Self, tabMain);
end;

procedure TformMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  QuestionAnswer : Integer;
begin
  if Key = VK_ESCAPE then
  begin
    QuestionAnswer := MessageDlg('You want to Exit?', mtConfirmation, [mbYes, mbNo], 0);
    if QuestionAnswer = mrYes then
      Application.Terminate;
  end;

end;

procedure TformMain.OpenForm(AFormClass: TFormClass; AOwner: TComponent; ATabControl : TcxTabControl);
var
   NewInstance : TForm;
begin
  NewInstance := AFormClass.Create(AOwner);
  NewInstance.Parent := ATabControl;
  NewInstance.BorderStyle := bsNone;
  NewInstance.Align := alClient;
  NewInstance.Show;
end;

end.
