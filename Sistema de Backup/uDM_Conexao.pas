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
  private
    { Private declarations }
  public


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


end.
