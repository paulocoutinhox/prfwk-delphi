unit PRFWK_Classe;

interface

{$M+}

type
  TPRFWK_Classe = class(TObject)

  private

  public
    constructor Create; virtual;
    destructor  Destroy; override;
  published

  end;

implementation

{**
 * Construtor
 *}
constructor TPRFWK_Classe.Create;
begin
//
end;

{**
 * Destrutor
 *}
destructor TPRFWK_Classe.Destroy;
begin
  inherited;
end;

end.
