program Project1;

uses
  Vcl.Forms,
  uDM_Conexao in 'uDM_Conexao.pas' {DM_Conexao: TDataModule},
  uClassCadCliente in 'uClassCadCliente.pas',
  uClassCadTelefone in 'uClassCadTelefone.pas',
  uClassCadEndereco in 'uClassCadEndereco.pas',
  uPrincipal in 'uPrincipal.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM_Conexao, DM_Conexao);
  Application.CreateForm(TForm1, Form1);
  Application.Run;

end.
