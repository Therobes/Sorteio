unit Unit34;

interface

uses
  Winapi.Windows,System.Math, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TForm34 = class(TForm)
    NumInicial: TEdit;
    NumFinal: TEdit;
    Quantidade: TEdit;
    Button1: TButton;
    Resultados: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure NumInicialKeyPress(Sender: TObject; var Key: Char);
    procedure NumFinalKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form34: TForm34;

implementation

{$R *.dfm}






procedure TForm34.Button1Click(Sender: TObject);
var ini, fin : string;
Rand,i, numeroSorteado :integer;
Resultado : String;
begin
  if (Quantidade.text = '') or (Quantidade.text = '') or (Quantidade.text = '') then
    begin
      Application.MessageBox('Campos em braco.','Sorteador', MB_OK);
      abort
    end;
    if Quantidade.text = '0' then
    begin
      Application.MessageBox('Valor qutidades de números precisa ser maior que zero','Sorteador', MB_OK);
      abort
    end;
    if NumInicial.text = '0' then
    begin
      Application.MessageBox('Valor inicial precisa ser maior que zero','Sorteador', MB_OK);
      abort
    end;
    if NumFinal.text = '0' then
    begin
      Application.MessageBox('Valor final precisa ser maior que zero','Sorteador', MB_OK);
      abort
    end;

    if NumInicial.text > NumFinal.text then

    begin
      Application.MessageBox('Valor inicial maior que o final, será ajustado automaticamente.','Sorteador', MB_OK);
      fin := NumFinal.text;
      ini := NumInicial.text;
      NumFinal.text := ini;
      NumInicial.text :=  fin;
    end;
    if (StrToInt(Quantidade.text) > (StrToInt(NumFinal.text) - StrToInt(NumInicial.text))) then
    begin
      Application.MessageBox('Inpossível calcular informando quantidade menor que valores possivel ser gerado.','Sorteador', MB_OK);
      abort
    end;

    Randomize;
    for i := 1 to StrToInt(Quantidade.text) do
    begin

      numeroSorteado := RandomRange(StrToInt(NumInicial.text),(StrToInt(NumFinal.text)+1));

      Resultado := (resultado) + IntToStr(numeroSorteado)+',';
    end;

    Resultados.caption := Resultado;
end;

procedure TForm34.FormShow(Sender: TObject);
begin
  Quantidade.SetFocus;
end;

procedure TForm34.NumFinalKeyPress(Sender: TObject; var Key: Char);
begin
if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
 key := #0;
end;

procedure TForm34.NumInicialKeyPress(Sender: TObject; var Key: Char);
begin
if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
 key := #0;
end;

procedure TForm34.QuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
 key := #0;
end;

end.

