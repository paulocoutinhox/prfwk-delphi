unit PRFWK_Modelo;

interface

uses PRFWK_Classe, PRFWK_Utilidades;

type
  TPRFWK_Modelo = class(TPRFWK_Classe)

  private
    aID: LongInt;
  public
    constructor Create(); override;
    destructor  Destroy; override;
  published
    property ID:LongInt read aID write aID;
  end;

implementation

{ TEntidade }

{**
 * Construtor
 *}
 constructor TPRFWK_Modelo.Create();
begin
  inherited;
end;


{**
 * Destrutor
 *}
destructor TPRFWK_Modelo.Destroy;
begin
  inherited;
end;

end.

