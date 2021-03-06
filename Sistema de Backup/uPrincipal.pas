unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  dxBar, dxRibbon, dxRibbonForm, dxRibbonSkins, cxGraphics, cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters, cxClasses, dxRibbonBackstageView, cxBarEditItem,
  dxSkinsCore, dxSkinBlack, dxRibbonCustomizationForm, cxTextEdit, cxContainer,
  cxEdit, dxSkinsForm, dxStatusBar, dxRibbonStatusBar, cxLabel, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxMaskEdit, cxSpinEdit, cxDBEdit,
  AdvGlassButton, Vcl.ExtCtrls, Datasnap.DBClient, dxGDIPlusClasses, Vcl.Mask,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.Components, Data.Bind.DBScope, cxStyles,
  cxCustomData, cxDBData, cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog,
  cxGridCustomTableView, cxGridCardView, cxGridDBCardView,
  cxGridCustomLayoutView, cxGridChartView, cxGridDBChartView, cxGridCustomView,
  cxGridLevel, cxGrid, AdvSmoothGauge, Vcl.Buttons, frxClass, frxDBSet,
  frxTableObject, frxDesgn, frxExportBaseDialog, frxExportPDF, RLReport,
  System.Notification, AdvMetroTaskDialog, Data.FMTBcd, Data.SqlExpr,
  FireDAC.Stan.Def, FireDAC.Phys.IBWrapper, FireDAC.Phys.FBDef, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Phys,
  FireDAC.Phys.IBBase, FireDAC.Phys.FB, FireDAC.Stan.Intf;

type
  TForm1 = class(TdxRibbonForm)
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxRibbon1: TdxRibbon;
    dxRibbonBackstageView1: TdxRibbonBackstageView;
    dxRibbonStatusBar1: TdxRibbonStatusBar;
    dxSkinController1: TdxSkinController;
    dxBarManager1Bar2: TdxBar;
    cxBarEditItem1: TcxBarEditItem;
    dxBarButton1: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    dxRibbonBackstageViewTabSheet2: TdxRibbonBackstageViewTabSheet;
    dxRibbonBackstageViewTabSheet3: TdxRibbonBackstageViewTabSheet;
    NotificationCenter: TNotificationCenter;
    AdvMetroTaskDialog1: TAdvMetroTaskDialog;
    dxRibbonBackstageViewTabSheet1: TdxRibbonBackstageViewTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtNomeBanco: TEdit;
    SpeedButton1: TSpeedButton;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    edtLocalBanco: TEdit;
    SpeedButton3: TSpeedButton;
    Memo2: TMemo;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    GroupBox3: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    FDIBBackup1: TFDIBBackup;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDTransaction1: TFDTransaction;
    procedure FormCreate(Sender: TObject);
    procedure notificacao(Nome, Titulo, Alerta:string);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  uDM_Conexao;

{$R *.dfm}
{ TForm1 }

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if MetroTaskMessageDlg('Deseja Realamente Sair', '', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
  begin
    Application.Terminate
  end
  else
    Abort;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  notificacao('Backup & Restore','Backup & Restore','Seja Bem-Vindo');
  DisableAero := True;

end;

procedure TForm1.notificacao(Nome, Titulo, Alerta: string);
Var Notificacao: TNotification;
begin
try
  Notificacao:= NotificationCenter.CreateNotification;
  Notificacao.Name:= Nome;
  Notificacao.Title:= Titulo;
  Notificacao.AlertBody:= Alerta;
  NotificationCenter.ScheduleNotification(Notificacao);
  NotificationCenter.PresentNotification(Notificacao);
finally
  Notificacao.Free;
end;

end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
if OpenDialog.Execute then
begin
 edtNomeBanco.Text:=OpenDialog.FileName;
end;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
if SaveDialog.Execute then
begin
 edtNomeBanco.Text:=SaveDialog.FileName;
end;
end;

end.
