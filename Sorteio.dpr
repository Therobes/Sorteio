program Sorteio;

uses
  Vcl.Forms,
  Unit34 in '..\..\Documents\Embarcadero\Studio\Projects\Unit34.pas' {Form34};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm34, Form34);
  Application.Run;
end.
