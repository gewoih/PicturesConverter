program PicturesConverter;

uses
  Vcl.Forms,
  ufPicturesConverter in 'ufPicturesConverter.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
