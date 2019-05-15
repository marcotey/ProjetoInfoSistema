object FPrincipal: TFPrincipal
  Left = 0
  Top = 0
  Caption = 'Cadastro e Visualiza'#231#227'o de Cliente'
  ClientHeight = 713
  ClientWidth = 1302
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1302
    Height = 713
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Cadastro'
      object Label6: TLabel
        Left = 628
        Top = 34
        Width = 32
        Height = 13
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 628
        Top = 74
        Width = 62
        Height = 13
        Caption = 'Identidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 898
        Top = 74
        Width = 20
        Height = 13
        Caption = 'CPF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 628
        Top = 122
        Width = 49
        Height = 13
        Caption = 'Telefone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 898
        Top = 122
        Width = 30
        Height = 13
        Caption = 'Email'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GroupBox1: TGroupBox
        Left = 628
        Top = 175
        Width = 663
        Height = 435
        Caption = 'Endere'#231'o'
        TabOrder = 5
        object Label1: TLabel
          Left = 15
          Top = 16
          Width = 20
          Height = 13
          Caption = 'CEP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 143
          Top = 16
          Width = 65
          Height = 13
          Caption = 'Logradouro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 398
          Top = 16
          Width = 44
          Height = 13
          Caption = 'N'#250'mero'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 14
          Top = 56
          Width = 79
          Height = 13
          Caption = 'Complemento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 478
          Top = 16
          Width = 34
          Height = 13
          Caption = 'Bairro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 223
          Top = 56
          Width = 38
          Height = 13
          Caption = 'Cidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 478
          Top = 56
          Width = 38
          Height = 13
          Caption = 'Estado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 14
          Top = 96
          Width = 23
          Height = 13
          Caption = 'Pa'#237's'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object txtCep: TEdit
          Left = 15
          Top = 29
          Width = 122
          Height = 21
          TabOrder = 0
          OnExit = txtCepExit
        end
        object txtLogradouro: TEdit
          Left = 143
          Top = 29
          Width = 249
          Height = 21
          TabOrder = 1
        end
        object txtComplemento: TEdit
          Left = 14
          Top = 75
          Width = 203
          Height = 21
          TabOrder = 4
        end
        object txtCidade: TEdit
          Left = 223
          Top = 75
          Width = 249
          Height = 21
          TabOrder = 5
        end
        object txtPais: TEdit
          Left = 14
          Top = 115
          Width = 453
          Height = 21
          TabOrder = 7
        end
        object txtNumero: TEdit
          Left = 397
          Top = 29
          Width = 75
          Height = 21
          TabOrder = 2
        end
        object txtEstado: TEdit
          Left = 478
          Top = 75
          Width = 163
          Height = 21
          TabOrder = 6
        end
        object txtBairro: TEdit
          Left = 478
          Top = 29
          Width = 163
          Height = 21
          TabOrder = 3
        end
        object BtnInserirEndereco: TButton
          Left = 473
          Top = 102
          Width = 179
          Height = 75
          Caption = 'Inserir Endere'#231'o'
          TabOrder = 8
          OnClick = BtnInserirEnderecoClick
        end
        object DBGrid2: TDBGrid
          Left = 3
          Top = 183
          Width = 649
          Height = 249
          DataSource = dsEncedero
          TabOrder = 9
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
      end
      object LISTAGEM: TPanel
        Left = 0
        Top = 0
        Width = 622
        Height = 41
        Caption = 'LISTAGEM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -43
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
      end
      object txtNome: TEdit
        Left = 628
        Top = 47
        Width = 547
        Height = 21
        TabOrder = 0
      end
      object txtIndentidade: TEdit
        Left = 628
        Top = 93
        Width = 249
        Height = 21
        TabOrder = 1
      end
      object txtCpf: TEdit
        Left = 901
        Top = 95
        Width = 274
        Height = 21
        TabOrder = 2
      end
      object txtTelefone: TEdit
        Left = 628
        Top = 138
        Width = 249
        Height = 21
        TabOrder = 3
      end
      object txtEmail: TEdit
        Left = 898
        Top = 141
        Width = 277
        Height = 21
        TabOrder = 4
      end
      object Panel1: TPanel
        Left = 664
        Top = -1
        Width = 627
        Height = 42
        Caption = 'CADASTRO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -43
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
      end
      object btnInserirCliente: TButton
        Left = 1181
        Top = 47
        Width = 109
        Height = 122
        Caption = 'Inserir Cliente'
        TabOrder = 8
        OnClick = btnInserirClienteClick
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 47
        Width = 622
        Height = 563
        DataSource = dsCliente
        TabOrder = 9
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = DBGrid1CellClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Configura'#231#245'es de E-mail'
      ImageIndex = 1
      object Label2: TLabel
        Left = 5
        Top = 6
        Width = 31
        Height = 13
        Caption = 'Porta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 136
        Top = 6
        Width = 26
        Height = 13
        Caption = 'Host'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 5
        Top = 46
        Width = 64
        Height = 13
        Caption = 'Remetente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 197
        Top = 46
        Width = 73
        Height = 13
        Caption = 'Senha E-mail'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label19: TLabel
        Left = 5
        Top = 88
        Width = 99
        Height = 13
        Caption = 'Nome Remetente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label20: TLabel
        Left = 3
        Top = 130
        Width = 70
        Height = 13
        Caption = 'Destinat'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object txtHost: TEdit
        Tag = 10
        Left = 136
        Top = 19
        Width = 241
        Height = 21
        TabOrder = 0
        Text = 'smtp.gmail.com'
      end
      object txtRemetente: TEdit
        Tag = 10
        Left = 5
        Top = 61
        Width = 180
        Height = 21
        TabOrder = 1
        Text = 'marco.antonio1233@gmail.com'
      end
      object txtSenha: TEdit
        Tag = 10
        Left = 197
        Top = 61
        Width = 180
        Height = 21
        PasswordChar = '*'
        TabOrder = 2
      end
      object txtNomeRemetente: TEdit
        Tag = 10
        Left = 5
        Top = 104
        Width = 372
        Height = 21
        TabOrder = 3
        Text = 'Marco Ant'#244'nio'
      end
      object txtDestinatario: TEdit
        Tag = 10
        Left = 3
        Top = 145
        Width = 374
        Height = 21
        TabOrder = 4
        Text = 'marco.antonio1233@gmail.com'
      end
      object txtPorta: TSpinEdit
        Left = 3
        Top = 18
        Width = 118
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 5
        Value = 465
      end
      object btnEnviaEmail: TButton
        Left = 3
        Top = 172
        Width = 75
        Height = 25
        Caption = 'Enviar E-mail'
        TabOrder = 6
        OnClick = btnEnviaEmailClick
      end
    end
  end
  object dsEncedero: TDataSource
    DataSet = cdsEndereco
    Left = 768
    Top = 440
  end
  object cdsEndereco: TFDMemTable
    Active = True
    FieldDefs = <>
    IndexDefs = <>
    IndexFieldNames = 'IdCliente'
    MasterSource = dsCliente
    MasterFields = 'id'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 716
    Top = 448
    object cdsEnderecocep: TStringField
      FieldName = 'cep'
    end
    object cdsEnderecoLogradouro: TStringField
      FieldName = 'Logradouro'
    end
    object cdsEnderecoBairro: TStringField
      FieldName = 'Bairro'
    end
    object cdsEnderecoNumero: TStringField
      FieldName = 'Numero'
    end
    object cdsEnderecoComplemento: TStringField
      FieldName = 'Complemento'
    end
    object cdsEnderecoCidade: TStringField
      FieldName = 'Cidade'
    end
    object cdsEnderecoEstado: TStringField
      FieldName = 'Estado'
    end
    object cdsEnderecoIdCliente: TIntegerField
      FieldName = 'IdCliente'
    end
  end
  object cdsCliente: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 75
      end
      item
        Name = 'identidade'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'cpf'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'telefone'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'email'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    IndexFieldNames = 'id'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 764
    Top = 16
    Content = {
      414442530F00FB2391020000FF00010001FF02FF030400140000006300640073
      0043006C00690065006E007400650005000A0000005400610062006C00650006
      0000000000070000080032000000090000FF0AFF0B0400040000006900640005
      0004000000690064000C00010000000E000D000F000110000111000112000113
      000114000115000400000069006400FEFF0B0400080000004E006F006D006500
      0500080000004E006F006D0065000C00020000000E00160017004B0000000F00
      011000011100011200011300011400011500080000004E006F006D0065001800
      4B000000FEFF0B0400140000006900640065006E007400690064006100640065
      000500140000006900640065006E007400690064006100640065000C00030000
      000E0016001700140000000F0001100001110001120001130001140001150014
      0000006900640065006E00740069006400610064006500180014000000FEFF0B
      0400060000006300700066000500060000006300700066000C00040000000E00
      16001700140000000F0001100001110001120001130001140001150006000000
      630070006600180014000000FEFF0B040010000000740065006C00650066006F
      006E006500050010000000740065006C00650066006F006E0065000C00050000
      000E0016001700140000000F0001100001110001120001130001140001150010
      000000740065006C00650066006F006E006500180014000000FEFF0B04000A00
      000065006D00610069006C0005000A00000065006D00610069006C000C000600
      00000E0016001700140000000F00011000011100011200011300011400011500
      0A00000065006D00610069006C00180014000000FEFEFF19FEFF1AFEFF1BFEFE
      FEFF1CFEFF1D1E0004000000FF1FFEFEFE0E004D0061006E0061006700650072
      001E005500700064006100740065007300520065006700690073007400720079
      0012005400610062006C0065004C006900730074000A005400610062006C0065
      0008004E0061006D006500140053006F0075007200630065004E0061006D0065
      000A0054006100620049004400240045006E0066006F0072006300650043006F
      006E00730074007200610069006E00740073001E004D0069006E0069006D0075
      006D0043006100700061006300690074007900180043006800650063006B004E
      006F0074004E0075006C006C00140043006F006C0075006D006E004C00690073
      0074000C0043006F006C0075006D006E00100053006F00750072006300650049
      0044000E006400740049006E0074003300320010004400610074006100540079
      00700065001400530065006100720063006800610062006C006500120041006C
      006C006F0077004E0075006C006C000800420061007300650014004F0041006C
      006C006F0077004E0075006C006C0012004F0049006E00550070006400610074
      00650010004F0049006E00570068006500720065001A004F0072006900670069
      006E0043006F006C004E0061006D00650018006400740041006E007300690053
      007400720069006E0067000800530069007A006500140053006F007500720063
      006500530069007A0065001C0043006F006E00730074007200610069006E0074
      004C00690073007400100056006900650077004C006900730074000E0052006F
      0077004C006900730074001800520065006C006100740069006F006E004C0069
      00730074001C0055007000640061007400650073004A006F00750072006E0061
      006C001200530061007600650050006F0069006E0074000E004300680061006E
      00670065007300}
    object cdsClienteid: TIntegerField
      DisplayWidth = 10
      FieldName = 'id'
    end
    object cdsClienteNome: TStringField
      DisplayWidth = 44
      FieldName = 'Nome'
      Size = 75
    end
    object cdsClienteidentidade: TStringField
      DisplayWidth = 20
      FieldName = 'identidade'
    end
    object cdsClientecpf: TStringField
      DisplayWidth = 20
      FieldName = 'cpf'
    end
    object cdsClientetelefone: TStringField
      DisplayWidth = 20
      FieldName = 'telefone'
    end
    object cdsClienteemail: TStringField
      DisplayWidth = 20
      FieldName = 'email'
    end
  end
  object dsCliente: TDataSource
    DataSet = cdsCliente
    Left = 812
    Top = 16
  end
  object XMLDocument1: TXMLDocument
    Active = True
    Left = 1172
    Top = 24
  end
end
