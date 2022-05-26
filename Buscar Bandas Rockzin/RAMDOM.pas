unit RAMDOM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Winapi.ShellAPI;

type
  TForm1 = class(TForm)
    Memo: TMemo;
    Edit1: TEdit;
    btnaleatório: TBitBtn;
    btnYoutube: TBitBtn;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    procedure btnaleatórioClick(Sender: TObject);
    procedure btnYoutubeClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;


implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  if MessageDlg('Deseja Buscar Musica no Spotify ?',mtConfirmation,[MBYES,mbNo],0)= mrYes then
 ShellExecute(Handle, 'open', PWideChar('https://open.spotify.com/search/'+Edit1.text+''),  '', '', 1);
end;

procedure TForm1.btnaleatórioClick(Sender: TObject);
var
  I      : Integer;
   vRandom : Integer;
begin
for I := 0 to Memo.Lines.Count do
vRandom:= Random(Memo.Lines.Count);
Edit1.Text:= Memo.Lines[vRandom];
Label1.Caption:= IntToStr(vRandom);
end;

procedure TForm1.btnYoutubeClick(Sender: TObject);
var vValorStr : string;
    vValorPwideChar : WideChar;

begin
   if MessageDlg('Deseja Buscar Musica no Youtube ?',mtConfirmation,[MBYES,mbNo],0)= mrYes then
 ShellExecute(Handle, 'open', PWideChar('https://www.youtube.com/results?search_query='+Edit1.text+''),  '', '', 1);
end;

end.
