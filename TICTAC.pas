unit TICTAC;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg;

type
  TfrmGameWorld = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnTic1: TButton;
    btnTic2: TButton;
    btnTic3: TButton;
    btnTic4: TButton;
    btnTic5: TButton;
    btnTic8: TButton;
    btnTic7: TButton;
    btnTic6: TButton;
    btnExit: TButton;
    btnTic9: TButton;
    btnReset: TButton;
    btnNew: TButton;
    lblX: TLabel;
    lblY: TLabel;
    lblPlayerX: TLabel;
    lblPlayerY: TLabel;
    Playervsplayer: TLabel;
    lblTictactoe: TLabel;
    Timer1: TTimer;

    procedure scorekeeper;  //determine if either player has won
    procedure Enable_False;  //Disables all the Tic-Tac-Toe grid buttons when one player wins
    procedure ResetandNewGame;
    procedure btnTic1Click(Sender: TObject);
    procedure btnTic2Click(Sender: TObject);
    procedure btnTic3Click(Sender: TObject);
    procedure btnTic4Click(Sender: TObject);
    procedure btnTic5Click(Sender: TObject);
    procedure btnTic6Click(Sender: TObject);
    procedure btnTic7Click(Sender: TObject);
    procedure btnTic8Click(Sender: TObject);
    procedure btnTic9Click(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations } checker: boolean;
  end;

var
  frmGameWorld: TfrmGameWorld;

implementation

{$R *.dfm}
{ TForm1 }

procedure TfrmGameWorld.btnExitClick(Sender: TObject);
begin
  if MessageDlg('Do you want to Exit the Game?', mtConfirmation, [mbYes, mbNo],
    0, mbYes) = mrYes then
                        begin
                          Application.Terminate;
                        end;
end;

procedure TfrmGameWorld.btnNewClick(Sender: TObject);
begin
  ResetandNewGame;
end;

procedure TfrmGameWorld.btnResetClick(Sender: TObject);
begin
  ResetandNewGame;

  lblPlayerx.Caption := '0';
  lblplayery.Caption := '0';
end;

procedure TfrmGameWorld.btnTic1Click(Sender: TObject);
begin
  if checker = false then  // checker tracks whose turn it is:
  begin
    btnTic1.Caption := 'X';
    checker := True;  //if true playerx turn
  end
  else if checker = True then
  begin
    btnTic1.Caption := 'O';
    checker := false;   //if false playery turn
  end;
  scorekeeper;
end;

procedure TfrmGameWorld.btnTic2Click(Sender: TObject);
begin
  if checker = false then
  begin
    btnTic2.Caption := 'X';
    checker := True;
  end
  else if checker = True then
  begin
    btnTic2.Caption := 'O';
    checker := false;
  end;
  scorekeeper;
end;

procedure TfrmGameWorld.btnTic3Click(Sender: TObject);
begin
  if checker = false then
  begin
    btnTic3.Caption := 'X';
    checker := True;
  end
  else if checker = True then
  begin
    btnTic3.Caption := 'O';
    checker := false;
  end;
  scorekeeper;
end;

procedure TfrmGameWorld.btnTic4Click(Sender: TObject);
begin
  if checker = false then
  begin
    btnTic4.Caption := 'X';
    checker := True;
  end
  else if checker = True then
  begin
    btnTic4.Caption := 'O';
    checker := false;
  end;
  scorekeeper;
end;

procedure TfrmGameWorld.btnTic5Click(Sender: TObject);
begin
  if checker = false then
  begin
    btnTic5.Caption := 'X';
    checker := True;
  end
  else if checker = True then
  begin
    btnTic5.Caption := 'O';
    checker := false;
  end;
  scorekeeper;
end;

procedure TfrmGameWorld.btnTic6Click(Sender: TObject);
begin
  if checker = false then
  begin
    btnTic6.Caption := 'X';
    checker := True;
  end
  else if checker = True then
  begin
    btnTic6.Caption := 'O';
    checker := false;
  end;
  scorekeeper;
end;

procedure TfrmGameWorld.btnTic7Click(Sender: TObject);
begin
  if checker = false then
  begin
    btnTic7.Caption := 'X';
    checker := True;
  end
  else if checker = True then
  begin
    btnTic7.Caption := 'O';
    checker := false;
  end;
  scorekeeper;
end;

procedure TfrmGameWorld.btnTic8Click(Sender: TObject);
begin
  if checker = false then
  begin
    btnTic8.Caption := 'X';
    checker := True;
  end
  else if checker = True then
  begin
    btnTic8.Caption := 'O';
    checker := false;
  end;
  scorekeeper;
end;

procedure TfrmGameWorld.btnTic9Click(Sender: TObject);
begin
  if checker = false then
  begin
    btnTic9.Caption := 'X';

    checker := True;
  end
  else if checker = True then
  begin
    btnTic9.Caption := 'O';

    checker := false;
  end;
  scorekeeper;
end;

procedure TfrmGameWorld.Enable_False;
begin
  btnTic1.Enabled := false;
  btnTic2.Enabled := false;
  btnTic3.Enabled := false;
  btnTic4.Enabled := false;
  btnTic5.Enabled := false;
  btnTic6.Enabled := false;
  btnTic7.Enabled := false;
  btnTic8.Enabled := false;
  btnTic9.Enabled := false;

end;

procedure TfrmGameWorld.FormCreate(Sender: TObject);
begin
lblTictactoe.Left := 0;  // Start position for X (horizontal)
  lblTictactoe.Top := 50;  // Start position for Y (vertical)

  // Enable the timer to start the animation
  Timer1.Enabled := True;

end;

procedure TfrmGameWorld.FormShow(Sender: TObject);
var
splayerx,splayery : String;
begin
//player 1's name
  splayerx :=InputBox('Player Name', 'What is the Name of First Player?','Deb');
  lblX.Caption :=splayerx;

  //player 2's name
  splayery :=InputBox('Player Name', 'What is the Name of Second Player?','Mike');
  lblY.Caption :=splayery;

  Playervsplayer.Caption :=splayerx+ ' '  + 'VS' +' ' + splayery;

end;

procedure TfrmGameWorld.ResetandNewGame; //reenables all the buttons in the grid and also resets the players marks back to 0
begin
  btnTic1.Enabled := True;
  btnTic2.Enabled := True;
  btnTic3.Enabled := True;
  btnTic4.Enabled := True;
  btnTic5.Enabled := True;
  btnTic6.Enabled := True;
  btnTic7.Enabled := True;
  btnTic8.Enabled := True;
  btnTic9.Enabled := True;

  btnTic1.Caption := ' ';
  btnTic2.Caption := ' ';
  btnTic3.Caption := ' ';
  btnTic4.Caption := ' ';
  btnTic5.Caption := ' ';
  btnTic6.Caption := ' ';
  btnTic7.Caption := ' ';
  btnTic8.Caption := ' ';
  btnTic9.Caption := ' ';

end;

procedure TfrmGameWorld.scorekeeper;
var
  x, y: integer;
begin
  x := strtoint(lblPlayerx.Caption);
  y := strtoint(lblplayery.Caption);
  // player x straight
  if (btnTic1.Caption = 'X') and (btnTic2.Caption = 'X') and
    (btnTic3.Caption = 'X') then
  begin
    lblPlayerX.Caption := inttostr(x + 1);
    showMessage('The winner is'+ ' ' +lblX.Caption);
    Enable_False; //prevent any further interaction with the grid.
  end
  else

    if (btnTic4.Caption = 'X') and (btnTic5.Caption = 'X') and
    (btnTic6.Caption = 'X') then
  begin
    lblPlayerX.Caption := inttostr(x + 1);
    showMessage('The winner is'+ ' ' +lblX.Caption);
    Enable_False;
  end
  else if (btnTic7.Caption = 'X') and (btnTic8.Caption = 'X') and
    (btnTic9.Caption = 'X') then
  begin
    lblPlayerX.Caption := inttostr(x + 1);
    showMessage('The winner is'+ ' ' +lblX.Caption);
    Enable_False;
  end


     //player x vertical
  else if (btnTic1.Caption = 'X') and (btnTic4.Caption = 'X') and
    (btnTic7.Caption = 'X') then
  begin
    lblPlayerX.Caption := inttostr(x + 1);
    showMessage('The winner is'+ ' ' +lblX.Caption);
    Enable_False;
  end

  else if (btnTic2.Caption = 'X') and (btnTic5.Caption = 'X') and
    (btnTic8.Caption = 'X') then
  begin
    lblPlayerX.Caption := inttostr(x + 1);
    showMessage('The winner is'+ ' ' +lblX.Caption);
    Enable_False;
  end

  else if (btnTic3.Caption = 'X') and (btnTic6.Caption = 'X') and
    (btnTic9.Caption = 'X') then
  begin
    lblPlayerX.Caption := inttostr(x + 1);
   showMessage('The winner is'+ ' ' +lblX.Caption);
    Enable_False;
  end

  //player x across
  else if (btnTic1.Caption = 'X') and (btnTic5.Caption = 'X') and
    (btnTic9.Caption = 'X') then
  begin
    lblPlayerX.Caption := inttostr(x + 1);
    showMessage('The winner is'+ ' ' +lblX.Caption);
    Enable_False;
  end
  else if (btnTic3.Caption = 'X') and (btnTic5.Caption = 'X') and
    (btnTic7.Caption = 'X') then
  begin
    lblPlayerX.Caption := inttostr(x + 1);
   showMessage('The winner is'+ ' ' +lblX.Caption);
    Enable_False;
  end
  else


    // player y *************

    if (btnTic1.Caption = 'O') and (btnTic2.Caption = 'O') and
      (btnTic3.Caption = 'O') then
    begin
      lblPlayerY.Caption := inttostr(x + 1);
      showMessage('The winner is'+ ' ' +lblY.Caption);
      Enable_False;
    end
    else

      if (btnTic4.Caption = 'O') and (btnTic5.Caption = 'O') and
      (btnTic6.Caption = 'O') then
    begin
     lblPlayerY.Caption := inttostr(x + 1);
      showMessage('The winner is'+ ' ' +lblY.Caption);
      Enable_False;
    end
    else if (btnTic7.Caption = 'O') and (btnTic8.Caption = 'O') and
      (btnTic9.Caption ='O') then
    begin
      lblPlayerY.Caption := inttostr(x + 1);
     showMessage('The winner is'+ ' ' +lblY.Caption);
      Enable_False;
    end

    //Player y vertical
    else if (btnTic1.Caption = 'O') and (btnTic4.Caption = 'O') and
      (btnTic7.Caption = 'O') then
    begin
      lblPlayerY.Caption := inttostr(x + 1);
      showMessage('The winner is'+ ' ' +lblY.Caption);
      Enable_False;
    end

    else if (btnTic2.Caption = 'O') and (btnTic5.Caption = 'O') and
      (btnTic8.Caption = 'O') then
    begin
     lblPlayerY.Caption := inttostr(x + 1);
      showMessage('The winner is'+ ' ' +lblY.Caption);
      Enable_False;
    end

    else if (btnTic3.Caption = 'O') and (btnTic6.Caption = 'O') and
      (btnTic9.Caption = 'O') then
    begin
     lblPlayerY.Caption := inttostr(x + 1);
     showMessage('The winner is'+ ' ' +lblY.Caption);
      Enable_False;
    end

    //Player y across
    else if (btnTic1.Caption = 'O') and (btnTic5.Caption = 'O') and
      (btnTic9.Caption = 'O') then
    begin
      lblPlayerY.Caption := inttostr(x + 1);
      showMessage('The winner is'+ ' ' +lblY.Caption);
      Enable_False;
    end
    else if (btnTic3.Caption = 'O') and (btnTic5.Caption = 'O') and
      (btnTic7.Caption = 'O') then
    begin
      lblPlayerY.Caption := inttostr(x + 1);
      showMessage('The winner is'+ ' ' +lblY.Caption);
      Enable_False;
    end

end;

procedure TfrmGameWorld.Timer1Timer(Sender: TObject);

begin
    lblTictactoe.Left := lblTictactoe.Left + 5;  // Adjust this value for speed

  // If the label goes off the form, move it back to the left side
  if lblTictactoe.Left > Self.ClientWidth then
    lblTictactoe.Left := 0;
end;

end.
