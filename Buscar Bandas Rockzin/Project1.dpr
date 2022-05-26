program Project1;

uses
  Vcl.Forms,
  RAMDOM in 'RAMDOM.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Obsidian');
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
