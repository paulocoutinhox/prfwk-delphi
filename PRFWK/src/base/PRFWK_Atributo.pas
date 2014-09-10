unit PRFWK_Atributo;

interface

uses PRFWK_Classe, DB;

type
  TTipoAtributo = (tpString, tpInteiro, tpReal, tpDataHora) ;

type
  TPRFWK_Atributo = class(TPRFWK_Classe)

  private
    aNome             : String;
    aRequerido        : Boolean;
    aTipo             : TTipoAtributo;
    aTipoCampo        : TFieldKind;
    aTamanho          : Integer;
    aPrecisao         : Integer;
    aSqlIndice        : Boolean;
    aSqlUpdate        : Boolean;
    aSqlWhere         : Boolean;
  public
    property nome:String                   read aNome             write aNome;
    property requerido:Boolean             read aRequerido        write aRequerido;
    property tipo:TTipoAtributo            read aTipo             write aTipo;
    property tipoCampo:TFieldKind          read aTipoCampo        write aTipoCampo;
    property tamanho:Integer               read aTamanho          write aTamanho;
    property precisao:Integer              read aPrecisao         write aPrecisao;
    property sqlIndice:Boolean             read aSqlIndice        write aSqlIndice;
    property sqlUpdate:Boolean             read aSqlUpdate        write aSqlUpdate;
    property sqlWhere:Boolean              read aSqlWhere         write aSqlWhere;

    constructor Create; override;
    destructor Destroy; override;
  published

  end;

implementation

{**
 * Construtor
 *}
constructor TPRFWK_Atributo.Create;
begin
  inherited;
end;

{**
 * Destrutor
 *}
destructor TPRFWK_Atributo.Destroy;
begin
  inherited;
end;

end.
