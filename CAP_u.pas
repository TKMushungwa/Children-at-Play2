unit CAP_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, ComCtrls, pngimage, StdCtrls,Buttons,Database_u,
  GIFImg;
type
  TfrmMain = class(TForm)
    PageControl1: TPageControl;
    WelcomePage: TTabSheet;
    Activites: TTabSheet;
    Donations: TTabSheet;
    Events: TTabSheet;
    pnlDrop: TPanel;
    imgWelcome: TImage;
    btnLogin: TButton;
    btnRegister: TButton;
    ActChurch: TImage;
    ActSport: TImage;
    ActCommunicate: TImage;
    ActHealth: TImage;
    ActEducation: TImage;
    ActFood: TImage;
    Panel1: TPanel;
    btnHelp: TButton;
    Button1: TButton;
    Button2: TButton;
    Panel2: TPanel;
    edtMoney: TEdit;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    ListBox1: TListBox;
    Label4: TLabel;
    Image1: TImage;
    Image2: TImage;
    Button3: TButton;
    Button4: TButton;
    Panel3: TPanel;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    Memo2: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure pnlDropMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure btnRegisterClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
  private
    lblUsername, lblUser, lblPassword: TLabel;
    edtUsername, edtPassword: TEdit;
    smbUsertype : TComboBox;
    btnLogin1, btnRegister1: TSpeedbutton;
    procedure LoginUser(Sender: TObject);
    procedure regUser(Sender: Tobject);
    var
      bLogin : Boolean;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnLoginClick(Sender: TObject);
begin
   //Assigning dynamic objects
   btnLogin.Visible:= false;
   btnRegister.Visible:= false;
   lblUsername := TLabel.Create(WelcomePage);
   lblUsername.Parent := WelcomePage;
   lblPassword := TLabel.Create(WelcomePage);
   lblPassword.Parent := WelcomePage;
   edtUsername := TEdit.Create(WelcomePage);
   edtUsername.parent := WelcomePage;
   edtPassword := TEdit.Create(WelcomePage);
   edtPassword.parent := WelcomePage;
   btnLogin1 := TSpeedbutton.Create(WelcomePage);
   btnLogin1.Parent := WelcomePage;
   //Set properties of dynamic objects
   with lblUsername do
    begin
    Visible:= true;
    Top:= 100;
    left:= 75;
    Caption := 'Username';
    end;
   with lblPassword do
    begin
    Visible:= true;
    Top:= 150;
    left:= 75;
    Caption := 'Password';
    end;
   with edtUsername do
    begin
     Visible:= true;
    Top:= 100;
    left:= 150;
    end;
   with edtPassword do
    begin
     Visible:= true;
    Top:= 150;
    left:= 150;
    end;
   with btnLogin1 do
    begin
    Visible:= true;
    Top:= 200;
    left:= 75;
    width:= 200;
    caption:= 'Login';
    OnClick:= LoginUser;
    end;
end;

procedure TfrmMain.btnRegisterClick(Sender: TObject);
begin
   //Assigning dynamic objects
   btnLogin.Visible:= false;
   btnRegister.Visible:= false;
   lblUsername := TLabel.Create(WelcomePage);
   lblUsername.Parent := WelcomePage;
   lblUser := TLabel.Create(WelcomePage);
   lblUser.Parent := WelcomePage;
   lblPassword := TLabel.Create(WelcomePage);
   lblPassword.Parent := WelcomePage;
   edtUsername := TEdit.Create(WelcomePage);
   edtUsername.parent := WelcomePage;
   smbUsertype := TComboBox.Create(WelcomePage);
   smbUsertype.Parent := WelcomePage;
   edtPassword := TEdit.Create(WelcomePage);
   edtPassword.parent := WelcomePage;
   btnRegister1 := TSpeedbutton.Create(WelcomePage);
   btnRegister1.Parent := WelcomePage;
   //Set properties of dynamic objects
   with lblUsername do
    begin
    Visible:= true;
    Top:= 100;
    left:= 75;
    Caption := 'Username';
    end;
   with lblUser do
    begin
    Visible:= true;
    Top:= 150;
    left:= 75;
    Caption := 'UserType';
    end;
   with lblPassword do
    begin
    Visible:= true;
    Top:= 200;
    left:= 75;
    Caption := 'Password';
    end;
   with edtUsername do
    begin
     Visible:= true;
    Top:= 100;
    left:= 150;
    end;
   with smbUsertype do
    begin
      Visible:= true;
      items.Add('Donor');
      items.Add('Stuff');
      Top:= 150;
      left:= 150;
      width := 120;
    end;
   with edtPassword do
    begin
     Visible:= true;
    Top:= 200;
    left:= 150;
    end;
   with btnRegister1 do
    begin
    Visible:= true;
    Top:= 250;
    left:= 75;
    width:= 200;
    caption:= 'Register';
    OnClick := regUser;
    end;
end;

procedure TfrmMain.Button2Click(Sender: TObject);
begin
 lblUsername.Free;
 close;
end;

procedure TfrmMain.Button3Click(Sender: TObject);
begin
   PageControl1.ActivePageIndex:= PageControl1.ActivePageIndex - 1 ;
end;

procedure TfrmMain.Button4Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex:= PageControl1.ActivePageIndex + 1;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  pnlDrop.Color:= RGB(87,130,181);
  bLogin:= false;
end;

procedure TfrmMain.LoginUser(Sender: TObject);
var
 sUser,sPassword : string;
begin
  sUser:= edtUsername.Text;
  {Database_u.DataModule1.ADOTbls.Filtered:= false;
  DataModule1.ADOTbls.Filter:= 'UserID = '+QuotedStr(sUser);
  DataModule1.ADOTbls.Filtered:= true;
  DataModule1.ADOTbls.Open;
  if DataModule1.ADOTbls.MaxRecords = 0 then
     begin
      ShowMessage('User does not exsist');
      edtUsername.Clear;
      edtPassword.Clear;
     end
   else
     if DataModule1.ADOTbls.MaxRecords > 0 then
       if NOT (DataModule1.ADOTbls.FieldByName('Password').Value = sPassword) then
        begin
          ShowMessage('Password is incorrect');
          edtPassword.Clear;
        end
       else
          ShowMessage('Login successful!');
          bLogin:= true;}

end;
procedure  TfrmMain.regUser(Sender: TObject);
  var
    sUser : string;
  begin
    sUser := edtUsername.Text;
    with Database_u.DataModule1.ADOTbls do
      begin
        Filter := sUser;
        Filtered := true;

       // if MaxRecords > 0 then
         // begin

          //end;

      end;


end;


procedure TfrmMain.pnlDropMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    ReleaseCapture;
    SendMessage(frmMain.Handle, WM_SYSCOMMAND, $F012, 0);
end;

end.
