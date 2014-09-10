program TestePRFWK;

uses
  Forms,
  UFrmPrincipal in 'UFrmPrincipal.pas' {FrmPrincipal},
  DAO_Membro in 'DAO_Membro.pas',
  MD_Membro in 'MD_Membro.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
