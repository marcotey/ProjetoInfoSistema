unit UCliente;

interface

  uses UEndereco, System.Generics.Collections, System.sysutils;



type


  TCliente = class

  private
    FNome: String;
    FEmail: String;
    FCPF: String;
    FIdentidade: String;
    FEndereco: TList<TEndereco>;
    FTelefone: String;
    FID: integer;
    procedure SetNome(const Value: String);
    procedure SetCPF(const Value: String);
    procedure SetEmail(const Value: String);
    procedure SetEndereco(const Value: TList<TEndereco>);
    procedure SetIdentidade(const Value: String);
    procedure SetTelefone(const Value: String);
    procedure SetID(const Value: integer);

  public
    constructor Create;
    destructor Destroy; override;
    property ID:integer read FID write SetID;
    property Nome: String read FNome write SetNome;
    property Identidade: String read FIdentidade write SetIdentidade;
    property CPF: String read FCPF write SetCPF;
    property Telefone: String read FTelefone write SetTelefone;
    property Email: String read FEmail write SetEmail;
    property Endereco: TList<TEndereco> read FEndereco write SetEndereco;

end;

implementation

{ TCliente }



constructor TCliente.Create;
begin
  FEmail := '';
  FCPF := '';
  FId := 0;
  FIdentidade := '';
  FNome := '';
  FTelefone := '';
  FEndereco := TList<TEndereco>.Create;
end;
destructor TCliente.Destroy;
begin
  FEndereco.Free;
  inherited;
end;

procedure TCliente.SetCPF(const Value: String);
begin
  FCPF := Value;
end;

procedure TCliente.SetEmail(const Value: String);
begin
  FEmail := Value;
end;

procedure TCliente.SetEndereco(const Value: TList<TEndereco>);
begin
  FEndereco := Value;
end;

procedure TCliente.SetID(const Value: integer);
begin
  FID := Value;
end;

procedure TCliente.SetIdentidade(const Value: String);
begin
  FIdentidade := Value;
end;

procedure TCliente.SetNome(const Value: String);
begin
  FNome := Value;
    if Value.Equals(EmptyStr) then
      raise Exception.Create('Nome do Cliente não pode ser branco.');
end;

procedure TCliente.SetTelefone(const Value: String);
begin
  FTelefone := Value;
end;

end.
