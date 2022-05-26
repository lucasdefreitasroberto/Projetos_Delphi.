unit uDM_Conexao;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Datasnap.Provider,
  Datasnap.DBClient, Data.DB, Data.SqlExpr, Data.DBXFirebird,AdvMetroTaskDialog;

type
  TDM_Conexao = class(TDataModule)
    Conexao: TSQLConnection;
    SQLDSCliente: TSQLDataSet;
    CDSCliente: TClientDataSet;
    DSProviderCliente: TDataSetProvider;
    SQLDSExecuteScalar: TSQLDataSet;
    CDSClienteCODIGO_CLIENTE: TIntegerField;
    CDSClienteIMAGEM_CLIENTE: TStringField;
    CDSClienteNOME_CLIENTE: TStringField;
    CDSClienteSTATUS_CLIENTE: TStringField;
    SQLDSClienteCODIGO_CLIENTE: TIntegerField;
    SQLDSClienteIMAGEM_CLIENTE: TStringField;
    SQLDSClienteNOME_CLIENTE: TStringField;
    SQLDSClienteSTATUS_CLIENTE: TStringField;
    CDSEndereco: TClientDataSet;
    SQLDSEndereco: TSQLDataSet;
    DSLinkEndereco: TDataSource;
    DSLinkTelefone: TDataSource;
    SQLDSTelefone: TSQLDataSet;
    CDSTelefone: TClientDataSet;
    SQLDSTelefoneCODIGO_TELEFONE: TIntegerField;
    SQLDSTelefoneNUMERO_TELEFONE: TStringField;
    SQLDSTelefoneTIPO_TELEFONE: TStringField;
    SQLDSEnderecoCODIGO_ENDERECO: TIntegerField;
    SQLDSEnderecoBAIRRO_ENDERECO: TStringField;
    SQLDSEnderecoCIDADE_ENDERECO: TStringField;
    SQLDSEnderecoNUMERO_ENDERECO: TStringField;
    SQLDSEnderecoRUA_ENDERECO: TStringField;
    SQLDSEnderecoUF_ENDERECO: TStringField;
    CDSClienteSQLDSTelefone: TDataSetField;
    CDSClienteSQLDSEndereco: TDataSetField;
    SQLDSEnderecoID_ENDERECO_CLIENTE: TIntegerField;
    SQLDSTelefoneID_TELEFONE_CLIENTE: TIntegerField;
    CDSTelefoneClone: TClientDataSet;
    procedure DataModuleCreate(Sender: TObject);
    procedure CDSClienteAfterOpen(DataSet: TDataSet);
    procedure CDSClientePostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure CDSClienteReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure CDSTelefoneAfterOpen(DataSet: TDataSet);
    procedure CDSEnderecoAfterOpen(DataSet: TDataSet);
    procedure CDSTelefoneNewRecord(DataSet: TDataSet);
    procedure CDSEnderecoNewRecord(DataSet: TDataSet);
    procedure CDSClienteNewRecord(DataSet: TDataSet);
    procedure CDSClienteBeforePost(DataSet: TDataSet);
    procedure CDSTelefoneCloneAfterInsert(DataSet: TDataSet);
    procedure CDSTelefoneBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    procedure OnGet_Tel(sender: TField;var Text: string; DisplayText: Boolean);
    procedure OnSet_Tel(sender: TField;const Text: string);
    function ExecuteScalar(SQL: String): Variant;
    function ObterProximoCodigo(GENERETOR_NAME:string): Integer;
    function ProximoCodigo(CampoTabela, Tabela: string): Integer;
    procedure CriarParametroInteiro(ASQLDS:TSQLDataSet; ANOME:string);
    procedure AbrirRegistro(ID_Codigo: Integer);
    procedure AbrirPrimeiroRegistro;
    procedure AbrirUltimoRegistro;
    procedure AbrirRegistroAnterior;
    procedure AbrirProximoRegistro;


    { Public declarations }
  end;

var
  DM_Conexao: TDM_Conexao;

implementation

uses
  uClassCadCliente,uClassCadTelefone,uClassCadEndereco, uPrincipal,
   Windows, Messages, Variants, Graphics, Controls, Forms,
  Dialogs;

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TDM_Conexao.AbrirPrimeiroRegistro;
var
  CodigoPrimeiroRegistro: Integer;

const
  SQL = 'select min(CLIENTE.CODIGO_CLIENTE) from CLIENTE';

begin
  CodigoPrimeiroRegistro:= ExecuteScalar(SQL);
  AbrirRegistro(CodigoPrimeiroRegistro +1);
end;

procedure TDM_Conexao.AbrirProximoRegistro;
var
  CodigoProximoRegistro: Integer;
  CodigoAtual: Integer;
  const
    SQL = ' select min(CLIENTE.CODIGO_CLIENTE)' + #13 +
          ' from CLIENTE                      ' + #13 +
          ' where CLIENTE.CODIGO_CLIENTE  > ';
  begin
    CodigoAtual:= CDSCliente.FieldByName('CODIGO_CLIENTE').AsInteger;
    CodigoProximoRegistro:= ExecuteScalar(SQL + IntToStr(CodigoAtual));

    if CodigoProximoRegistro > 0 then
      AbrirRegistro(CodigoProximoRegistro);
  end;

procedure TDM_Conexao.AbrirRegistro(ID_Codigo: Integer);
begin
  CDSCliente.Close;
  SQLDSCliente.ParamByName('COD').AsInteger:= ID_Codigo;
  CDSCliente.FetchParams();
  try
    CDSCliente.Open;
  except
    on E: Exception do
      raise Exception.Create('Erro ao abrir o registro.' + #13 +
        'Erro original: ' + E.Message);
  end;
end;

procedure TDM_Conexao.AbrirRegistroAnterior;
var
  CodigoRegistroAnterior: Integer;
  CodigoAtual: Integer;
const
    SQL = ' select max(CLIENTE.CODIGO_CLIENTE)' + #13 +
          ' from CLIENTE                      ' + #13 +
          ' where CLIENTE.CODIGO_CLIENTE  < ';
  begin
    CodigoAtual:= CDSCliente.FieldByName('CODIGO_CLIENTE').AsInteger;
    CodigoRegistroAnterior:= ExecuteScalar(SQL + IntToStr(CodigoAtual));

    if CodigoRegistroAnterior > 0 then
      AbrirRegistro(CodigoRegistroAnterior);
  end;


procedure TDM_Conexao.AbrirUltimoRegistro;
var
  CodigoUltimoRegistro: Integer;
const
  SQL = 'select max(CLIENTE.CODIGO_CLIENTE) from CLIENTE';

begin
  CodigoUltimoRegistro := DM_Conexao.ExecuteScalar(SQL);
  AbrirRegistro(CodigoUltimoRegistro);
end;


procedure TDM_Conexao.CDSClienteAfterOpen(DataSet: TDataSet);
begin
TClassCadCliente.ConfigurarCampos(CDSCliente.Fields);
CDSTelefone.DataSetField:= TDataSetField(CDSCliente.FieldByName(SQLDSTelefone.Name));
CDSEndereco.DataSetField:= TDataSetField(CDSCliente.FieldByName(SQLDSEndereco.Name));
CDSEndereco.Open;
CDSTelefone.Open;
end;

procedure TDM_Conexao.CDSClienteBeforePost(DataSet: TDataSet);
//var CDSTelefoneClone : TClientDataSet;
begin
// CDSTelefoneClone:= TClientDataSet.Create(self);

    //CDSTelefoneClone.CloneCursor(CDSTelefone,False,False);
    //CDSTelefoneClone.Data:=CDSTelefone.Data;

end;

{
   try
    CDSTelefoneClone.First;
    while not CDSTelefoneClone.Eof do
        begin  if (CDSTelefoneClone.FieldByName('NUMERO_TELEFONE').Value = CDSTelefone.FieldByName('NUMERO_TELEFONE').Value) then
            begin
               MetroTaskMessageDlg('Numero( '+ CDSTelefone.FieldByName('NUMERO_TELEFONE').AsString +' )Já Cadastrado', '', mtConfirmation,[mbOK], 0);
             // abort
            end;
            CDSTelefoneClone.Next;

        end;
  finally
  FreeAndNil(CDSTelefoneClone);
  end;
       }
procedure TDM_Conexao.CDSClienteNewRecord(DataSet: TDataSet);
begin
if CDSCliente.FieldByName('CODIGO_CLIENTE').AsInteger <= 1 then  //buguei nesse treco
CDSCliente.FieldByName('CODIGO_CLIENTE').AsInteger:= ObterProximoCodigo('GEN_CLIENTE');
end;

procedure TDM_Conexao.CDSClientePostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
raise Exception.Create('Erro no cadastro: ' + E.Message);
end;

procedure TDM_Conexao.CDSClienteReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
 Action:= raCancel;                                                         // assim que a mensagem for mostrada.
  raise Exception.Create('Erro no cadastro: ' + E.Message);
end;

procedure TDM_Conexao.CDSEnderecoAfterOpen(DataSet: TDataSet);
begin
TClassCadEndereco.ConfigurarCampos(CDSEndereco.Fields);

end;

procedure TDM_Conexao.CDSEnderecoNewRecord(DataSet: TDataSet);
begin
CDSEndereco.FieldByName('CODIGO_ENDERECO').AsInteger:= ObterProximoCodigo('GEN_ENDERECO');
CDSEndereco.FieldByName('ID_ENDERECO_CLIENTE').AsInteger:= CDSCliente.FieldByName('CODIGO_CLIENTE').AsInteger;
end;

procedure TDM_Conexao.CDSTelefoneAfterOpen(DataSet: TDataSet);
begin
TClassCadTelefone.ConfigurarCampos(CDSTelefone.Fields);
//DataSet.FieldByName().ProviderFlags:= [];
CDSTelefone.FieldByName('TIPO_TELEFONE').OnSetText:= OnSet_Tel;
CDSTelefone.FieldByName('TIPO_TELEFONE').OnGetText:= OnGet_Tel;
CDSTelefoneClone.Data:= CDSTelefone.Data;


end;

procedure TDM_Conexao.CDSTelefoneBeforePost(DataSet: TDataSet);
begin
    CDSTelefoneClone.First;
    while not CDSTelefoneClone.Eof do
        begin

            if  (CDSTelefoneClone.FieldByName('NUMERO_TELEFONE').Value = CDSTelefone.FieldByName('NUMERO_TELEFONE').Value) then
            begin
               MetroTaskMessageDlg('Numero( '+ CDSTelefone.FieldByName('NUMERO_TELEFONE').AsString +' )Já Cadastrado', '', mtConfirmation,[mbOK], 0);
              Abort

            end
            else
            CDSTelefoneClone.Next;

        end;


end;

procedure TDM_Conexao.CDSTelefoneCloneAfterInsert(DataSet: TDataSet);
begin
//CDSTelefoneClone.CloneCursor(CDSTelefone,False,False);
//CDSTelefoneClone.Data:= CDSTelefone.Data;
end;

procedure TDM_Conexao.CDSTelefoneNewRecord(DataSet: TDataSet);
begin
CDSTelefone.FieldByName('TIPO_TELEFONE').AsString:= Form1.edtTipo.Text;
CDSTelefone.FieldByName('CODIGO_TELEFONE').AsInteger:= ObterProximoCodigo('GEN_TELEFONE');
DataSet.FieldByName('ID_TELEFONE_CLIENTE').AsInteger:= CDSCliente.FieldByName('CODIGO_CLIENTE').AsInteger;
end;

procedure TDM_Conexao.CriarParametroInteiro(ASQLDS: TSQLDataSet; ANOME: string);
begin
  ASQLDS.Params.Clear;
  ASQLDS.Params.CreateParam(ftInteger, ANOME, ptInput);
end;

procedure TDM_Conexao.DataModuleCreate(Sender: TObject);
begin

  with Conexao do

  begin
    Connected := False;
    DriverName := 'Firebird';
    LoginPrompt := False;
    Params.Add('DataBase=C:\Users\HAHA\Desktop\Sistema de Cadastro\Dados\DADOS.FDB');
    Params.Add('User_Name=SYSDBA');
    Params.Add('Password=masterkey');
    try
      Connected := True;
    except
      raise Exception.Create('Banco de Dados Não Emcontrado');
    end;
 end;

 // SQLDSCliente.CommandText:=  TClassCadCliente.sqldsCadastroCliente;
 // SQLDSTelefone.CommandText:= TClassCadTelefone.sqldsCadastroTelefone;
 // SQLDSEndereco.CommandText:= TClassCadEndereco.sqldsCadastroEndereco;
    SQLDSCliente.SQLConnection:=  Conexao;
    SQLDSTelefone.SQLConnection:= Conexao;
    SQLDSEndereco.SQLConnection:= Conexao;

    SQLDSTelefone.DataSource:= DSLinkTelefone;
    SQLDSEndereco.DataSource:= DSLinkEndereco;

    CriarParametroInteiro(SQLDSCliente,'COD');
    CriarParametroInteiro(SQLDSTelefone,'CODIGO_CLIENTE');
    CriarParametroInteiro(SQLDSEndereco,'CODIGO_CLIENTE');


    DSProviderCliente.DataSet:=   SQLDSCliente;
    CDSCliente.ProviderName:= 'DSProviderCliente';
    AbrirRegistro(1);
   // CDSTelefone.Open;
   // CDSEndereco.Open;
end;

function TDM_Conexao.ExecuteScalar(SQL: String): Variant;
begin
  SQLDSExecuteScalar.Close;
  SQLDSExecuteScalar.SQLConnection:= Conexao;
  SQLDSExecuteScalar.CommandText := SQL;
  SQLDSExecuteScalar.Open;
  case SQLDSExecuteScalar.Fields[0].DataType of
      ftLargeint, ftInteger: Result:=SQLDSExecuteScalar.Fields[0].AsInteger;
      ftString:  Result:= SQLDSExecuteScalar.Fields[0].AsString;
  end;
end;



function TDM_Conexao.ObterProximoCodigo(GENERETOR_NAME:string): Integer;
Var SQL:string;
begin
    SQL :='select gen_id(' +GENERETOR_NAME+ ', 1) from RDB$DATABASE';

    Result:= DM_Conexao.ExecuteScalar(SQL);
end;





procedure TDM_Conexao.OnGet_Tel(sender: TField; var Text: string;
  DisplayText: Boolean);
begin
     if sender.AsString = 'T' then
             Text:= 'TELEFONE'

     else
     if sender.AsString = 'C' then
             Text:= 'CELULAR'

     else
      if sender.AsString = 'F' then
             Text:= 'FAX'

     else
     if sender.AsString = 'O' then
            Text:= 'OUTROS';
end;

procedure TDM_Conexao.OnSet_Tel(sender: TField;const Text: string);
begin
sender.AsString:= Copy(Text,1,1);
end;

function TDM_Conexao.ProximoCodigo(CampoTabela, Tabela: string): Integer;
begin
 Result := ExecuteScalar('Select max(' + CampoTabela + '+1) from ' + Tabela);
end;

end.
