unit CAP_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, ComCtrls, pngimage, StdCtrls,Buttons,
  GIFImg, DB, ADODB;
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
    conCaP: TADOConnection;
    ADOTbls: TADOTable;
    DataSource1: TDataSource;
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
    cmbUsertype : TComboBox;
    btnLogin1, btnRegister1: TSpeedButton;
    procedure LoginUser(Sender: TObject);
    procedure regUser(Sender: Tobject);
    procedure FreeDynamics;
    Function ValPassword(pPassword:string):boolean;
    const
      arrAdmin : array[1..6]of integer = (0,1,2,3,4,5);
      arrDonor : array[1..6]of integer = (0,1,2,3,4,5);
      arrStaff : array[1..6]of integer = (0,1,2,3,4,5);
    var
      bLogin : Boolean;
      sUserType: string;

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
    OnClick:= LoginUser; //Click to attempt login
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
   cmbUsertype := TComboBox.Create(WelcomePage);
   cmbUsertype.Parent := WelcomePage;
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
   with cmbUsertype do
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
    OnClick := regUser; //Click to attempt register
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

procedure TfrmMain.FreeDynamics;
begin
  lblUsername.Free;
  lblUser.Free;
  lblPassword.Free;
  edtUsername.Free;
  edtPassword.Free;
  cmbUsertype.Free;
  btnRegister1.Free;
  btnLogin1.Free;
end;

procedure TfrmMain.LoginUser(Sender: TObject);
var
 sUser,sPassword,sDBPassword : string;
begin
  //Input
  sUser:= edtUsername.Text;
  sPassword:= edtPassword.Text;
  //Checking database to see if user exsists and validate
  with ADOTbls do
  begin Filtered:= false;
   Filter:= 'UserID = '+QuotedStr(sUser);
   Filtered:= true;
   Open;
   sDBPassword:= VarToStr(ADOTbls.FieldByName('Password').Value);
   if ADOTbls.RecordCount = 0 then //NO user
      begin
       ShowMessage('User does not exsist');
       edtUsername.Clear;
       edtPassword.Clear;
       edtUsername.SetFocus;
      end
    else //User exsists, checking password
      if (ADOTbls.RecordCount > 0) AND (NOT (sDBPassword = sPassword)) then
         begin
           ShowMessage('Password is incorrect');
           edtPassword.Clear;
         end
        else
           begin
            ShowMessage('Login successful!');
            bLogin:= true;
            sUserType:= FieldByName('UserType').Value;
            FreeDynamics;
            if NOT (sUserType='Donor') then
              PageControl1.ActivePageIndex:= 1;
             end;
  end;
end;
procedure  TfrmMain.regUser(Sender: TObject);
  var
    sUser,sPassword,sUsertype : string;
    bAccept : boolean;
    I : integer;
  begin
    sUser := edtUsername.Text;
    sPassword:= edtPassword.Text;
    sUsertype:= cmbUsertype.Items[cmbUsertype.ItemIndex];
    with ADOTbls do
      begin
        Filter := 'UserID = '+QuotedStr(sUser);
        Filtered := true;
        Open;
        if RecordCount > 0 then //If records exist grom the filter
          begin
           ShowMessage('Username already taken');//Deny registration
           edtUsername.Clear;
           edtPassword.Clear;
          end
        else
          bAccept:= ValPassword(sPassword);//Validate password has a digit
          if NOT bAccept then
             begin
              ShowMessage('Password must be at least 8 characters long');
              edtPassword.Clear;
             end
          else
             begin
              Insert;//Allow registration, insert a new record
               begin
                 FieldByName('UserID').Value:= sUser;
                 FieldByName('UserType').Value := sUserType;
                 FieldByName('Password').Value:= sPassword;
               end;
              Post;
              ShowMessage('Registration successful! Please proceed to login.');
              FreeDynamics;
              btnLogin.Visible:= true;
              btnRegister.Enabled:= false;
              btnRegister.Visible:= true;
             end;
      close;
      end;


end;


function TfrmMain.ValPassword(pPassword: string): boolean;//Validate registering password
var
 bValid:boolean;
begin
   bValid:= false;
     if Length(pPassword) >= 8 then
         bValid := true;
   result:= bValid;
end;

procedure TfrmMain.pnlDropMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    //A movable object handling (the form in this case)
    ReleaseCapture;
    SendMessage(frmMain.Handle, WM_SYSCOMMAND, $F012, 0);
end;

end.
