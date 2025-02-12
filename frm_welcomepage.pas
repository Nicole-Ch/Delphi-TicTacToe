unit frm_welcomepage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls,TICTAC;

type
  TfrmPlay = class(TForm)
    lblWelcome: TLabel;
    Button1: TButton;
    Image2: TImage;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPlay: TfrmPlay;

implementation

{$R *.dfm}

procedure TfrmPlay.Button1Click(Sender: TObject);
begin

     frmGameWorld.Show;
     Self.Hide;
end;



end.
