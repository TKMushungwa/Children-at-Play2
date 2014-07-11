program CAP_p;

uses
  Forms,
  windows,
  CAP_u in 'CAP_u.pas' {frmMain},
  SplashScreen_u in 'SplashScreen_u.pas' {SplashScreen},
  Database_u in 'Database_u.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  {SplashScreen := TSplashScreen.Create(Application);
      Try
            SplashScreen.Show;
            Application.Initialize;
            SplashScreen.Update;
            Sleep(5000);
            Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDataModule1, DataModule1);
  //Application.CreateForm(TForm1, Form1);
  AnimateWindow(frmMain.Handle,200, AW_SLIDE);
  SplashScreen.Hide;
      Finally
            SplashScreen.Free;
      End;    }
      Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
