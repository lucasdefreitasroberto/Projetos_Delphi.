program Project1;

uses
  Forms,
  ServerModule
    in '..\..\Documents\RAD Studio\Projects\Project1\ServerModule.pas' {UniServerModule: TUniGUIServerModule} ,
  MainModule
    in '..\..\Documents\RAD Studio\Projects\Project1\MainModule.pas' {UniMainModule: TUniGUIMainModule} ,
  Main in '..\..\Documents\RAD Studio\Projects\Project1\Main.pas' {GAME: TUniForm};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  TUniServerModule.Create(Application);
  Application.Run;

end.
