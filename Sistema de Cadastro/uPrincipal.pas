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
  System.Notification, AdvMetroTaskDialog, Data.FMTBcd, Data.SqlExpr;

type
  TForm1 = class(TdxRibbonForm)
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxRibbon1: TdxRibbon;
    dxRibbonBackstageView1: TdxRibbonBackstageView;
    dxRibbonBackstageViewTabSheet1: TdxRibbonBackstageViewTabSheet;
    dxRibbonStatusBar1: TdxRibbonStatusBar;
    dxSkinController1: TdxSkinController;
    dxBarManager1Bar2: TdxBar;
    cxBarEditItem1: TcxBarEditItem;
    dxBarButton1: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    dxRibbonBackstageViewTabSheet2: TdxRibbonBackstageViewTabSheet;
    dxRibbonBackstageViewTabSheet3: TdxRibbonBackstageViewTabSheet;
    dxRibbonBackstageViewTabSheet4: TdxRibbonBackstageViewTabSheet;
    lblTitulo: TLabel;
    DBGridCliente: TDBGrid;
    DBGridTelefone: TDBGrid;
    DBGridEndereco: TDBGrid;
    DSCliente: TDataSource;
    DSTelefone: TDataSource;
    DSEndereco: TDataSource;
    Label2: TLabel;
    cxDBSpinEdit1: TcxDBSpinEdit;
    Label3: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label4: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    btnAnterior: TAdvGlassButton;
    btnPrimeiro: TAdvGlassButton;
    btnUltimo: TAdvGlassButton;
    btnProximo: TAdvGlassButton;
    Panel1: TPanel;
    btnInserir: TAdvGlassButton;
    btnCancelar: TAdvGlassButton;
    btnSalvar: TAdvGlassButton;
    lbl2: TLabel;
    lbl4: TLabel;
    edtStatus: TComboBox;
    Panel2: TPanel;
    btnEditar: TAdvGlassButton;
    btnExcluir: TAdvGlassButton;
    edtNome: TcxDBTextEdit;
    edtCodigo: TcxDBSpinEdit;
    lbl1: TLabel;
    lbl3: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    edtBairro: TcxDBTextEdit;
    lbl8: TLabel;
    edtCidade: TcxDBTextEdit;
    lbl7: TLabel;
    edtRua: TcxDBTextEdit;
    lbl9: TLabel;
    edtUF: TcxDBTextEdit;
    Label14: TLabel;
    cxDBTextEdit10: TcxDBTextEdit;
    Label15: TLabel;
    cxDBTextEdit11: TcxDBTextEdit;
    Label16: TLabel;
    cxDBTextEdit12: TcxDBTextEdit;
    cxDBTextEdit13: TcxDBTextEdit;
    Label17: TLabel;
    Label18: TLabel;
    cxDBTextEdit14: TcxDBTextEdit;
    cxDBTextEdit15: TcxDBTextEdit;
    Label19: TLabel;
    Label20: TLabel;
    cxDBTextEdit16: TcxDBTextEdit;
    cxDBTextEdit17: TcxDBTextEdit;
    Label21: TLabel;
    AdvGlassButton1: TAdvGlassButton;
    AdvGlassButton2: TAdvGlassButton;
    AdvGlassButton3: TAdvGlassButton;
    AdvGlassButton4: TAdvGlassButton;
    AdvGlassButton5: TAdvGlassButton;
    AdvGlassButton6: TAdvGlassButton;
    AdvGlassButton7: TAdvGlassButton;
    AdvGlassButton8: TAdvGlassButton;
    Imagem: TImage;
    Panel3: TPanel;
    btnEditar2: TAdvGlassButton;
    btnExcluir2: TAdvGlassButton;
    Panel4: TPanel;
    btnEditar3: TAdvGlassButton;
    btnExcluir3: TAdvGlassButton;
    lbl10: TLabel;
    edtNumeroCasa: TcxDBTextEdit;
    edtTipo: TComboBox;
    edtNumero: TcxDBTextEdit;
    NotificationCenter: TNotificationCenter;
    AdvMetroTaskDialog1: TAdvMetroTaskDialog;
    btnSalvar2: TAdvGlassButton;
    btnSalvar4: TAdvGlassButton;
    btnSalvar3: TAdvGlassButton;
    btnCancelar2: TAdvGlassButton;
    btnCancelar3: TAdvGlassButton;
    btnCancelar4: TAdvGlassButton;
    procedure FormCreate(Sender: TObject);
    procedure cxDBSpinEdit1Exit(Sender: TObject);
    procedure cxDBSpinEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure DSClienteStateChange(Sender: TObject);
    procedure btnExcluirTelefoneClick(Sender: TObject);
    procedure btnEditar2Click(Sender: TObject);
    procedure btnExcluir2Click(Sender: TObject);
    procedure btnEditar3Click(Sender: TObject);
    procedure btnExcluir3Click(Sender: TObject);
    procedure edtNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure edtNumeroCasaKeyPress(Sender: TObject; var Key: Char);
    procedure notificacao(Nome, Titulo, Alerta:string);
    procedure EditarDBGrid(DataSource: TDataSource; sender: TDBGrid;
  state: TGridDrawState; rect: TRect; Color: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEnderecoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGridTelefoneDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGridClienteDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtNumeroExit(Sender: TObject);
    procedure btnSalvar4Click(Sender: TObject);
    procedure btnSalvar3Click(Sender: TObject);
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

procedure TForm1.btnEditarClick(Sender: TObject);
begin
dxRibbonBackstageViewTabSheet1.Active:= True;
DSCliente.DataSet.Edit;
end;

procedure TForm1.btnExcluirClick(Sender: TObject);
begin
  if MetroTaskMessageDlg('Deseja Realmente Exclu?r este Cliente ?', '', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
  begin
    try
      TClientDataSet(DSCliente.DataSet).Delete;
      TClientDataSet(DSCliente.DataSet).ApplyUpdates(-1);
      Application.MessageBox('Registro Exclu?do com Sucesso', '',
        MB_OK + MB_ICONINFORMATION);
     notificacao('','Registro Exclu?do!','');
    except
      on E: Exception do
        raise Exception.Create('Error ao Exclu?r o Registro' + #13 + #13 +
          E.Message);
    end;
  end;
end;


procedure TForm1.btnExcluirTelefoneClick(Sender: TObject);
begin
ShowMessage('aa');
end;

procedure TForm1.btnExcluir2Click(Sender: TObject);
begin
  if MetroTaskMessageDlg('Deseja Realmente Exclu?r este Telefone ?', '', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
  begin
    try
      TClientDataSet(DSTelefone.DataSet).Delete;
      TClientDataSet(DSTelefone.DataSet).ApplyUpdates(-1);
      Application.MessageBox('Registro Exclu?do com Sucesso', '',
        MB_OK + MB_ICONINFORMATION);

    except
      on E: Exception do
        raise Exception.Create('Error ao Exclu?r o Registro' + #13 + #13 +
          E.Message);
    end;
  end;
end;

procedure TForm1.btnEditar3Click(Sender: TObject);
begin
dxRibbonBackstageViewTabSheet1.Active:= True;
DSEndereco.DataSet.Edit;
end;

procedure TForm1.btnExcluir3Click(Sender: TObject);
begin
  if MetroTaskMessageDlg('Deseja Realmente Exclu?r Endere?o ?', '', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
  begin
    try
      TClientDataSet(DSEndereco.DataSet).Delete;
      TClientDataSet(DSEndereco.DataSet).ApplyUpdates(-1);
      Application.MessageBox('Registro Exclu?do com Sucesso', '',
        MB_OK + MB_ICONINFORMATION);

    except
      on E: Exception do
        raise Exception.Create('Error ao Exclu?r o Registro' + #13 + #13 +
          E.Message);
    end;
  end;
end;

procedure TForm1.btnEditar2Click(Sender: TObject);
begin
dxRibbonBackstageViewTabSheet1.Active:= True;
DSTelefone.DataSet.Edit;

end;

procedure TForm1.btnAnteriorClick(Sender: TObject);
begin
DM_Conexao.AbrirRegistroAnterior();
end;

procedure TForm1.btnCancelarClick(Sender: TObject);
begin
DSCliente.DataSet.Cancel;
dxRibbonBackstageViewTabSheet2.Active:= True;
end;

procedure TForm1.btnInserirClick(Sender: TObject);
begin
DSCliente.DataSet.Insert;
end;

procedure TForm1.btnPrimeiroClick(Sender: TObject);
begin
DM_Conexao.AbrirPrimeiroRegistro();
end;

procedure TForm1.btnProximoClick(Sender: TObject);
begin
DM_Conexao.AbrirProximoRegistro();
end;

procedure TForm1.btnSalvar3Click(Sender: TObject);
begin
  // DSCliente.DataSet.FieldByName('STATUS_CLIENTE').AsString:= edtStatus.Text;
   DSTelefone.DataSet.Post;
   TClientDataSet(DSTelefone.DataSet).ApplyUpdates(0);
   DM_Conexao.AbrirUltimoRegistro();
   dxRibbonBackstageViewTabSheet2.Active:= True;
   notificacao('','Registro Salvo com Sucesso !','');
end;

procedure TForm1.btnSalvar4Click(Sender: TObject);
begin
   //DSCliente.DataSet.FieldByName('STATUS_CLIENTE').AsString:= edtStatus.Text;
   DSEndereco.DataSet.Post;
   TClientDataSet(DSEndereco.DataSet).ApplyUpdates(0);
   DM_Conexao.AbrirUltimoRegistro();
   dxRibbonBackstageViewTabSheet2.Active:= True;
   notificacao('','Registro Salvo com Sucesso !','');
end;

procedure TForm1.btnSalvarClick(Sender: TObject);

begin
   DSCliente.DataSet.FieldByName('STATUS_CLIENTE').AsString:= edtStatus.Text;
   DSCliente.DataSet.Post;
   TClientDataSet(DSCliente.DataSet).ApplyUpdates(0);
   DM_Conexao.AbrirUltimoRegistro();
   dxRibbonBackstageViewTabSheet2.Active:= True;
   notificacao('','Registro Salvo com Sucesso !','');
end;

procedure TForm1.btnUltimoClick(Sender: TObject);
begin
DM_Conexao.AbrirUltimoRegistro();
end;

procedure TForm1.cxDBSpinEdit1Exit(Sender: TObject);
begin
DM_Conexao.AbrirRegistro(StrToInt(cxDBSpinEdit1.Text));
end;

procedure TForm1.cxDBSpinEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  cxDBTextEdit1.SetFocus;
end;

procedure TForm1.edtNumeroCasaKeyPress(Sender: TObject; var Key: Char);
begin
 if  not ( Key in ['0'..'9'] ) then
     Key := #0
end;

procedure TForm1.edtNumeroExit(Sender: TObject);
begin
{DM_Conexao.CDSTelefone.IndexName:= 'IndexNumero_Telefone';
if DM_Conexao.CDSTelefone.Locate('Numero_Telefone',edtNumero.Text,[] ) then
begin
  ShowMessage('N?mero ' +DM_Conexao.CDSTelefone.FieldByName('Numero_Telefone').Value+ ' j? Cadastrado !');
  Abort
end;  }

{
 DM_Conexao.SQLDSTelefone2.CommandText:= 'SELECT TELEFONE.NUMERO_TELEFONE FROM TELEFONE WHERE TELEFONE.NUMERO_TELEFONE = :VERIFICAR';
 DM_Conexao.SQLDSTelefone2.Params.CreateParam(ftString,'VERIFICAR',ptInput);
 DM_Conexao.SQLDSTelefone2.ParamByName('VERIFICAR').AsString:= edtNumero.Text;
 DM_Conexao.SQLDSTelefone2.Open;
 if DM_Conexao.SQLDSTelefone2.RecordCount > 0 then
  begin
   ShowMessage('N?mero J? Cadastrado');
  exit
  end; }

end;

procedure TForm1.edtNumeroKeyPress(Sender: TObject; var Key: Char);
begin
 if  not ( Key in ['0'..'9', Chr(8)] ) then
     Key := #0
end;

procedure TForm1.DBGridClienteDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
EditarDBGrid(DSCliente, DBGridCliente, State, Rect, Column);
end;

procedure TForm1.DBGridEnderecoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
EditarDBGrid(DSEndereco, DBGridEndereco, State, Rect, Column);
end;

procedure TForm1.DBGridTelefoneDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
EditarDBGrid(DSTelefone, DBGridTelefone, State, Rect, Column);
end;

procedure TForm1.DSClienteStateChange(Sender: TObject);
begin
btnInserir.Enabled     := not(DM_Conexao.CDSCliente.State in  [dsInsert, dsEdit]);
btnSalvar.Enabled      := DM_Conexao.CDSCliente.State in [dsInsert, dsEdit];
btnCancelar.Enabled    := DM_Conexao.CDSCliente.State in [dsInsert, dsEdit];
btnEditar.Enabled      := not (DM_Conexao.CDSCliente.State in [dsInsert, dsEdit]);
btnExcluir.Enabled     := DM_Conexao.CDSCliente.State in [dsBrowse];
btnProximo.Enabled     :=  btnInserir.Enabled;
btnPrimeiro.Enabled    := btnInserir.Enabled;
btnUltimo.Enabled      := btnInserir.Enabled;
btnAnterior.Enabled    := btnInserir.Enabled;
btnCancelar2.Enabled   := btnCancelar.Enabled;
btnCancelar3.Enabled   := btnCancelar.Enabled;
btnCancelar4.Enabled   := btnCancelar.Enabled;
btnExcluir2.Enabled    := btnExcluir.Enabled;
btnExcluir3.Enabled    := btnExcluir.Enabled;
btnSalvar2.Enabled     := btnSalvar.Enabled;
btnSalvar3.Enabled     := btnSalvar.Enabled;
btnSalvar4.Enabled     := btnSalvar.Enabled;
btnEditar2.Enabled     := btnEditar.Enabled;
btnEditar3.Enabled     := btnEditar.Enabled;


edtTipo.Visible        := not btnInserir.Enabled;
edtUF.Visible          := not btnInserir.Enabled;
edtRua.Visible         := not btnInserir.Enabled;
edtStatus.Visible      := not btnInserir.Enabled;
edtNome.Visible        := not btnInserir.Enabled;
edtNumero.Visible      := not btnInserir.Enabled;
edtBairro.Visible      := not btnInserir.Enabled;
edtCidade.Visible      := not btnInserir.Enabled;
edtCodigo.Visible      := not btnInserir.Enabled;
edtNumeroCasa.Visible  := not btnInserir.Enabled;


lbl1.Visible           := not btnInserir.Enabled;
lbl2.Visible           := not btnInserir.Enabled;
lbl3.Visible           := not btnInserir.Enabled;
lbl4.Visible           := not btnInserir.Enabled;
lbl5.Visible           := not btnInserir.Enabled;
lbl6.Visible           := not btnInserir.Enabled;
lbl7.Visible           := not btnInserir.Enabled;
lbl8.Visible           := not btnInserir.Enabled;
lbl9.Visible           := not btnInserir.Enabled;
lbl10.Visible          := not btnInserir.Enabled;
lblTitulo.Visible      := not btnInserir.Enabled;

Imagem.Visible         := btnInserir.Enabled;

end;

procedure TForm1.EditarDBGrid(DataSource: TDataSource; sender: TDBGrid;
  state: TGridDrawState; rect: TRect; Color: TColumn);
begin
  if not Odd(DataSource.DataSet.recNO) then
  begin
    if not(gdSelected in state) then
    begin
      sender.Canvas.Brush.Color := $FFA07A; // $89c089;//$00FFEFDF;
      sender.Canvas.FillRect(rect);
      sender.DefaultDrawDataCell(rect, Color.Field, state);
    end;
end;
end;

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
  notificacao('Sistema de Cadastro','Sistema de Cadastro','Seja Bem-Vindo');
  DisableAero := True;
  DSCliente.DataSet:= DM_Conexao.CDSCliente;
  DBGridCliente.DataSource:= DSCliente;
  DM_Conexao.CDSCliente.FieldByName('IMAGEM_CLIENTE').Visible:= False;
  DBGridTelefone.Columns.Items[2].PickList.Add('T - Telefone');
  DBGridTelefone.Columns.Items[2].PickList.Add('C - Celular');
  DBGridTelefone.Columns.Items[2].PickList.Add('F - Fax');
  DBGridTelefone.Columns.Items[2].PickList.Add('O - Outros');
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

end.
