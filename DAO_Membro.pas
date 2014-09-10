unit DAO_Membro;

interface

uses PRFWK_DAO, PRFWK_Atributo, DB, Classes, PRFWK_Modelo, SysUtils,
     StrUtils, MD_Membro, PRFWK_Utilidades;

type
  TDAO_Membro = class(TPRFWK_DAO)

  private

  public
    constructor Create(); override;
    destructor  Destroy; override;

    function obterOrdemNome(ordem: String = 'nome'; direcaoOrdem:String = 'ASC'):TList;
  published

  end;

implementation

uses uFrmPrincipal;

{ TGR_Membro }

{**
 * Construtor
 *}
 constructor TDAO_Membro.Create();
begin

  //define conexão e entidade
  conexao    := uFrmPrincipal.gConexao;
  nomeTabela := 'membros';

  //herda construtor
  inherited;

  //adiciona mapeamentos
  adicionarMapeamento('nome');

end;


{**
 * Destrutor
 *}
destructor TDAO_Membro.Destroy;
begin
  inherited;
end;

{**
 * Obtém as entidades pela pesquisa
 *}
function TDAO_Membro.obterOrdemNome(ordem: String = 'nome'; direcaoOrdem:String = 'ASC'):TList;
var
  lParametros   : String;
  lOrdem        : String;
  lDirecaoOrdem : String;
begin
  //cria parâmetros
  lParametros := ' WHERE 1=1 ';

  //cria ordem
  lOrdem        := ' ORDER BY ' + ordem + ' ';
  lDirecaoOrdem := ' ' + direcaoOrdem + ' ';

  //define sql
  defineSql('SELECT * FROM ' + nomeTabela + lParametros + lOrdem + lDirecaoOrdem);

  //percorre o dataSet
  if aClientDataSet.RecordCount > 0 then
  begin
    //cria lista de resultados
    Result := TList.Create;

    while not aClientDataSet.Eof do
    begin
      //monta entidade adicionando na lista
      Result.Add( TMD_Membro.NewInstance );

      //monta entidade apartir do dataSet
      montarEntidade( Result[Result.Count-1] );

      //próximo registro
      aClientDataSet.Next;
    end;

  end

  else
    Result := nil;
end;


end.
