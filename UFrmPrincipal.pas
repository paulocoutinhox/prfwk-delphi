unit UFrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, PRFWK_Utilidades, PRFWK_Conexao, PRFWK_Modelo,
  MD_Membro, DAO_Membro;

type
  TFrmPrincipal = class(TForm)
    lvItens: TListView;
    Label1: TLabel;
    edNome: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure inicializar();
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure carregarGrid();
    procedure adicionarItem();
    procedure alterarItem();
    procedure excluirItem();
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    gDAO_Membro  : TDAO_Membro;
    gMembro      : TMD_Membro;
  end;

var
  FrmPrincipal: TFrmPrincipal;
  gConexao    : TPRFWK_Conexao;

implementation

{$R *.dfm}

procedure TFrmPrincipal.adicionarItem;
begin
  gMembro := TMD_Membro.Create;

  try
    gMembro.nome := edNome.Text;

    gConexao.beginTransaction;

    gDAO_Membro.inserir(gMembro);

    gConexao.commit;
  except on E: Exception do
    gConexao.rollback;
  end;

  gMembro.Free;
  carregarGrid;
end;

procedure TFrmPrincipal.alterarItem;
begin
  if (lvItens.ItemIndex > -1) then
  begin
    gMembro := TMD_Membro.Create;

    gMembro.ID := StrToInt(lvItens.Items[lvItens.ItemIndex].Caption);
    gMembro := gDAO_Membro.obter(gMembro) as TMD_Membro;

    if (gMembro <> nil) then
    begin
      gMembro.nome := edNome.Text;

      gConexao.beginTransaction;

      gDAO_Membro.alterar(gMembro);

      gConexao.commit;

      gMembro.Free;
    end;

    carregarGrid();
  end;
end;

procedure TFrmPrincipal.Button1Click(Sender: TObject);
begin
  adicionarItem();
end;

procedure TFrmPrincipal.Button2Click(Sender: TObject);
begin
  excluirItem();
end;

procedure TFrmPrincipal.Button3Click(Sender: TObject);
begin
  alterarItem();
end;

procedure TFrmPrincipal.carregarGrid;
var
  lMembroAUX : TList;
  x          : Integer;
  lMembro    : TMD_Membro;
  lListItem  : TListItem;
begin

  lMembroAUX := gDAO_Membro.obterOrdemNome();

  lvItens.Clear();

  if lMembroAUX <> nil then
  begin

    for x := 0 to lMembroAUX.Count - 1 do
    begin

      lMembro := lMembroAUX[x];

      //adiciona produto ao grid de produtos
      lListItem := lvItens.Items.Add();

      lListItem.Caption       := IntToStr(lMembro.ID);
      lListItem.SubItems.Text := lMembro.nome;

      lMembro.Free;

    end;

  end;

end;

procedure TFrmPrincipal.excluirItem;
begin
  if (lvItens.ItemIndex > -1) then
  begin
    gMembro := TMD_Membro.Create;

    gMembro.ID := StrToInt(lvItens.Items[lvItens.ItemIndex].Caption);
    gMembro := gDAO_Membro.obter(gMembro) as TMD_Membro;

    if (gMembro <> nil) then
    begin
      gConexao.beginTransaction;

      gDAO_Membro.excluir(gMembro);

      gConexao.commit;

      gMembro.Free;
    end;

    carregarGrid();
  end;
end;

procedure TFrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  gDAO_Membro.Free;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  inicializar();

  gDAO_Membro := TDAO_Membro.Create;
  
  carregarGrid();
end;

procedure TFrmPrincipal.inicializar;
var
  lTemp  : String;
begin
  //título
  lTemp := PRFWK_Utilidades.TPRFWK_Utilidades.obterInstancia().obterConfiguracao('APLICACAO', 'titulo', '');
  self.Caption := lTemp;

  //conexão
  //TSqlConnection ou TAdoConnection
  gConexao := TPRFWK_Conexao.Create;
  gConexao.vendorlib   := PRFWK_Utilidades.TPRFWK_Utilidades.obterInstancia().obterConfiguracao('CONEXAO', 'vendorlib', '');
  gConexao.libraryName := PRFWK_Utilidades.TPRFWK_Utilidades.obterInstancia().obterConfiguracao('CONEXAO', 'libraryname', '');
  gConexao.criarConexao( PRFWK_Utilidades.TPRFWK_Utilidades.obterInstancia().obterConfiguracao('CONEXAO', 'driver', ''),
                         PRFWK_Utilidades.TPRFWK_Utilidades.obterInstancia().obterConfiguracao('CONEXAO', 'nomeconexao', '')
                         );
  gConexao.conectar;
end;

end.
