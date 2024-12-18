unit ConnectionString;

interface

type
  TConnectionString = class
  private
    FDriver: string;
    FServer: string;
    FDatabase: string;
    FUserName: string;
    FPassword: string;
    FTrustedConnection: Boolean;
    FPipeName: string;
    function BuildConnectionString: string;
  public
    constructor Create;
    property Driver: string read FDriver write FDriver; // Ex.: SQLNCLI11, ODBC Driver 17
    property Server: string read FServer write FServer; // Nome do servidor ou endere�o IP
    property Database: string read FDatabase write FDatabase; // Nome do banco de dados
    property UserName: string read FUserName write FUserName; // Usu�rio do banco
    property Password: string read FPassword write FPassword; // Senha do banco
    property TrustedConnection: Boolean read FTrustedConnection write FTrustedConnection; // Conex�o integrada
    property PipeName: string read FPipeName write FPipeName; // Caminho do Pipe Nomeado (opcional)

    function ToString: string; override; // Retorna a string de conex�o
  end;

implementation

{ TConnectionString }

constructor TConnectionString.Create;
begin
  FDriver := '';
  FServer := '';
  FDatabase := '';
  FUserName := '';
  FPassword := '';
  FTrustedConnection := False;
  FPipeName := '';
end;

end.
