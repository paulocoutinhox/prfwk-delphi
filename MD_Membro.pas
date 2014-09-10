unit MD_Membro;

interface

uses PRFWK_Modelo, TypInfo;

type
  TMD_Membro = class(TPRFWK_Modelo)

  private
    aNome : String;
  public
    constructor Create; override;
    destructor  Destroy; override;
  published

    property nome:String read aNome write aNome;

  end;

implementation

{ TMembro }

{**
 * Construtor
 *}
constructor TMD_Membro.Create;
begin
  inherited;
end;

{**
 * Destrutor
 *}
destructor TMD_Membro.Destroy;
begin
  inherited;
end;

end.
