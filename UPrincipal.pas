unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB, Vcl.Mask,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, System.UITypes, Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc,UClienteControle, UCliente, UEndereco,
  Vcl.Samples.Spin, FireDAC.Stan.StorageBin;

type
    TipoOper = (TInsereCliente,TInsereEndereco);
  
type
  TFPrincipal = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    LISTAGEM: TPanel;
    dsEncedero: TDataSource;
    cdsEndereco: TFDMemTable;
    cdsEnderecocep: TStringField;
    cdsEnderecoLogradouro: TStringField;
    cdsEnderecoBairro: TStringField;
    cdsEnderecoComplemento: TStringField;
    cdsEnderecoCidade: TStringField;
    cdsEnderecoEstado: TStringField;
    txtNome: TEdit;
    txtIndentidade: TEdit;
    txtCpf: TEdit;
    txtTelefone: TEdit;
    txtEmail: TEdit;
    txtCep: TEdit;
    txtLogradouro: TEdit;
    txtComplemento: TEdit;
    txtCidade: TEdit;
    txtPais: TEdit;
    txtNumero: TEdit;
    txtEstado: TEdit;
    txtBairro: TEdit;
    BtnInserirEndereco: TButton;
    cdsCliente: TFDMemTable;
    cdsClienteNome: TStringField;
    cdsClienteidentidade: TStringField;
    cdsClientecpf: TStringField;
    cdsClientetelefone: TStringField;
    cdsClienteemail: TStringField;
    dsCliente: TDataSource;
    cdsEnderecoIdCliente: TIntegerField;
    cdsClienteid: TIntegerField;
    XMLDocument1: TXMLDocument;
    Panel1: TPanel;
    btnInserirCliente: TButton;
    DBGrid2: TDBGrid;
    DBGrid1: TDBGrid;
    cdsEnderecoNumero: TStringField;
    TabSheet2: TTabSheet;
    Label2: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    txtHost: TEdit;
    txtRemetente: TEdit;
    txtSenha: TEdit;
    txtNomeRemetente: TEdit;
    txtDestinatario: TEdit;
    txtPorta: TSpinEdit;
    btnEnviaEmail: TButton;
    procedure btnInserirClienteClick(Sender: TObject);
    procedure BtnInserirEnderecoClick(Sender: TObject);
    procedure txtCepExit(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btnEnviaEmailClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure RecarregarDados(DataSet: TFDMemTable; Origem: IFDDataSetReference);
    procedure LimpaCampos;

  public
    { Public declarations }
    procedure InserirCliente(vTipoOp: TipoOper);
    procedure PreencherObjCliente(oCliente: TCliente; oEndereco: TEndereco);
    procedure RetornaDados(vTipoOp: TipoOper; oClienteControle  : TClienteControle); overload;
    procedure RetornaDados; overload;
    procedure RetornaDadosParaTela;
    function  GeraXMLCliente: String;

  end;

var
  FPrincipal: TFPrincipal;

implementation

{$R *.dfm}

uses UClienteXML, uEmail, uEnvioEmail;



procedure TFPrincipal.btnEnviaEmailClick(Sender: TObject);
Var
   oEmail : TEmail;
begin
   if cdsCliente.IsEmpty then
   begin
      MessageDlg('Não é possível enviar e-mail sem cliente selecionado' ,mtError,[mbOK],0);
      exit;
   end;
   if not MessageDlg('Enviar e-mail com os dados cadastrais do cliente: ' + cdsClienteNome.AsString + '?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
      exit;

   oEmail := TEmail.Create;
   try
     oEmail.NomeRemetente := txtNomeRemetente.Text;
     oEmail.Porta         := txtPorta.Value;
     oEmail.Host          := txtHost.Text;
     oEmail.SenhaEmail    := txtSenha.Text;
     oEmail.Remetente     := txtRemetente.Text;
     oEmail.UsuarioEmail  := txtRemetente.Text;
     oEmail.Destinatarios.Add(txtDestinatario.Text);
     oEmail.Assunto       := 'Infosistema Cadastro Cliente';
     oEmail.TipoConteudo  := 'text/plain; charset=iso-8859-1';
     oEmail.CorpoEmail.Add('Em anexo segue o XML contendo as informações do cadastro do Cliente: ' + cdsClienteNome.AsString);
     oEmail.CaminhosAnexos.Add(GeraXMLCliente);
     TEnvioEmail.FEnviaEmail(oEmail);
   finally
     oEmail.Free;
   end;
end;

procedure TFPrincipal.btnInserirClienteClick(Sender: TObject);
begin
  inserirCliente(TInsereCliente);
end;

procedure TFPrincipal.BtnInserirEnderecoClick(Sender: TObject);
begin
  if cdsCliente.IsEmpty then
  begin
    MessageDlg('Não é possível inserir um endereço sem um cliente cadastrado.' ,mtError,[mbOK],0);
      exit;
  end;

  if Trim(txtCep.Text) = '' then
  begin
    MessageDlg('Não é possível inserir um endereço Sem informar o CEP' ,mtError,[mbOK],0);
      exit;
  end;


  if MessageDlg('Incluir endereço para o cliente: ' + cdsClienteNome.AsString + '?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    if String(txtNome.Text).IsEmpty then
      RetornaDadosParaTela;

      inserirCliente(TInsereEndereco);
      LimpaCampos;
  end;
end;

procedure TFPrincipal.RetornaDadosParaTela;
begin
  txtNome.Text        := cdsClientenome.AsString;
  txtIndentidade.Text := cdsClienteidentidade.AsString;
  txtCpf.Text         := cdsClientecpf.AsString;
  txtTelefone.Text    := cdsClientetelefone.AsString;
  txtEmail.Text       := cdsClienteemail.AsString;
end;

procedure TFPrincipal.DBGrid1CellClick(Column: TColumn);
begin
  RetornaDadosParaTela;
end;

procedure TFPrincipal.FormShow(Sender: TObject);
begin
  RetornaDados;
  RetornaDadosParaTela;
end;

function TFPrincipal.GeraXMLCliente: String;
begin
  XMLDocument1.Active := False;
  XMLDocument1.Active := True;
  Result := TClienteXML.CriaXMLCliente(XMLDocument1,cdsCliente,cdsEndereco,ExtractFilePath(Application.ExeName) + '\Cliente'+ cdsClienteNome.AsString + '.XML');
end;

procedure TFPrincipal.InserirCliente(vTipoOp: TipoOper);
var
  oClienteControle  : TClienteControle;
  oCliente          : TCliente;
  oEndereco         : TEndereco;
begin
  oCliente          := TCliente.Create;
  oClienteControle  := TClienteControle.Create;
  oEndereco         := TEndereco.Create;
  PreencherObjCliente(oCliente,oEndereco);
  try
    case vTipoOp of
      TInsereCliente:
          oClienteControle.InserirCliente(oCliente);

      TInsereEndereco:
          oClienteControle.InserirEndereco(oCliente);
    end;
  finally
    LimpaCampos;
    RetornaDados(vTipoOp,oClienteControle);
    FreeAndNil(oCliente);
    FreeAndNil(oClienteControle);
    FreeAndNil(oEndereco);
    RetornaDadosParaTela;
  end;    
end;

procedure TFPrincipal.PreencherObjCliente(oCliente: TCliente; oEndereco: TEndereco);
var
  oClienteControle          : TClienteControle;
begin
  oClienteControle          := TClienteControle.Create;
  try
    with oCliente do
    begin
      ID                    := cdsClienteid.AsInteger;
      Nome                  := txtNome.Text;
      Identidade            := txtIndentidade.Text;
      CPF                   := txtCpf.Text;
      Telefone              := txtTelefone.Text;
      Email                 := txtEmail.Text;

      oEndereco.IdCliente   := ID;
      oEndereco.Cep         := txtCep.Text;
      oEndereco.Logradouro  := txtLogradouro.Text;
      oEndereco.Numero      := txtnumero.Text;
      oEndereco.Complemento := txtComplemento.Text;
      oEndereco.Bairro      := txtBairro.Text;
      oEndereco.Localidade  := txtCidade.Text;
      oEndereco.Uf          := txtEstado.Text;
      oEndereco.Pais        := txtPais.Text;
      oCliente.Endereco.Add(oEndereco);
    end;
  finally
    FreeAndNil(oClienteControle);
  end;

end;

procedure TFPrincipal.RetornaDados;
var
  oClienteControle: TClienteControle;
begin
  oClienteControle:= TClienteControle.Create;
  try
    RecarregarDados(cdsCliente, oClienteControle.RetornaDadosCliente);
  finally
    FreeAndNil(oClienteControle);
  end;
end;

procedure TFPrincipal.RetornaDados(vTipoOp: TipoOper; oClienteControle  : TClienteControle);
begin
  case vTipoOp of
      TInsereCliente:
        RecarregarDados(cdsCliente, oClienteControle.RetornaDadosCliente);

      TInsereEndereco:
        RecarregarDados(cdsEndereco, oClienteControle.RetornaDadosEndereco);
    end;
end;

procedure TFPrincipal.txtCepExit(Sender: TObject);
var
  oEndereco : TEndereco;
begin
  oEndereco := TEndereco.Create();
  try
    oEndereco.Cep        := txtCep.Text;

    txtLogradouro.Text   := oEndereco.Logradouro;
    txtComplemento.Text  := oEndereco.Complemento;
    txtBairro.Text       := oEndereco.Bairro;
    txtCidade.Text       := oEndereco.Localidade;
    txtEstado.Text       := oEndereco.Uf;
  finally
    oEndereco.Free;
  end;
end;

procedure TFPrincipal.RecarregarDados(DataSet: TFDMemTable; Origem: IFDDataSetReference);
begin
  DataSet.Close;
  DataSet.Data := Origem;
  DataSet.Open;
end;


procedure TFPrincipal.LimpaCampos;
var
  I:Integer;
begin
  for  I := 0 to  Self.ComponentCount -1 do
  begin
    if (Self.Components[I] Is TEdit) and (Self.Components[I].Tag <> 10) then
      TEdit(Self.Components[I]).clear;
  end;
end;

end.
