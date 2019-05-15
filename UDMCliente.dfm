object DMCliente: TDMCliente
  OldCreateOrder = False
  Height = 246
  Width = 674
  object cdsEndereco: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'cep'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Logradouro'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Bairro'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Complemento'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Cidade'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Estado'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'pais'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'IDCliente'
        DataType = ftInteger
      end
      item
        Name = 'Numero'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 440
    Top = 80
    object cdsEnderecocep: TStringField
      FieldName = 'cep'
    end
    object cdsEnderecoLogradouro: TStringField
      FieldName = 'Logradouro'
    end
    object cdsEnderecoBairro: TStringField
      FieldName = 'Bairro'
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
    object cdsEnderecopais: TStringField
      FieldName = 'pais'
    end
    object cdsEnderecoIDCliente: TIntegerField
      FieldName = 'IDCliente'
    end
    object cdsEnderecoNumero: TStringField
      FieldName = 'Numero'
    end
  end
  object cdsCliente: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'nome'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Identidade'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CPF'
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
      end
      item
        Name = 'id'
        DataType = ftInteger
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 442
    Top = 8
    Content = {
      414442530F007726F5020000FF00010001FF02FF030400140000006300640073
      0043006C00690065006E007400650005000A0000005400610062006C00650006
      0000000000070000080032000000090000FF0AFF0B0400080000006E006F006D
      0065000500080000006E006F006D0065000C00010000000E000D000F00140000
      001000011100011200011300011400011500011600080000006E006F006D0065
      00170014000000FEFF0B0400140000004900640065006E007400690064006100
      640065000500140000004900640065006E007400690064006100640065000C00
      020000000E000D000F0014000000100001110001120001130001140001150001
      1600140000004900640065006E00740069006400610064006500170014000000
      FEFF0B0400060000004300500046000500060000004300500046000C00030000
      000E000D000F0014000000100001110001120001130001140001150001160006
      000000430050004600170014000000FEFF0B040010000000740065006C006500
      66006F006E006500050010000000740065006C00650066006F006E0065000C00
      040000000E000D000F0014000000100001110001120001130001140001150001
      160010000000740065006C00650066006F006E006500170014000000FEFF0B04
      000A00000065006D00610069006C0005000A00000065006D00610069006C000C
      00050000000E000D000F00140000001000011100011200011300011400011500
      0116000A00000065006D00610069006C00170014000000FEFF0B040004000000
      69006400050004000000690064000C00060000000E0018001000011100011200
      0113000114000115000116000400000069006400FEFEFF19FEFF1AFEFF1BFF1C
      1D0000000000FF1E00000D0000004D6172636F20416E746F6E696F0100070000
      003136353438393602000A000000353534383132333639380300070000003334
      353635383904000F0000004D6172636F40676D61696C2E636F6D050001000000
      FEFEFEFEFEFF1FFEFF20210001000000FF22FEFEFE0E004D0061006E00610067
      00650072001E0055007000640061007400650073005200650067006900730074
      007200790012005400610062006C0065004C006900730074000A005400610062
      006C00650008004E0061006D006500140053006F0075007200630065004E0061
      006D0065000A0054006100620049004400240045006E0066006F007200630065
      0043006F006E00730074007200610069006E00740073001E004D0069006E0069
      006D0075006D0043006100700061006300690074007900180043006800650063
      006B004E006F0074004E0075006C006C00140043006F006C0075006D006E004C
      006900730074000C0043006F006C0075006D006E00100053006F007500720063
      0065004900440018006400740041006E007300690053007400720069006E0067
      001000440061007400610054007900700065000800530069007A006500140053
      0065006100720063006800610062006C006500120041006C006C006F0077004E
      0075006C006C000800420061007300650014004F0041006C006C006F0077004E
      0075006C006C0012004F0049006E0055007000640061007400650010004F0049
      006E00570068006500720065001A004F0072006900670069006E0043006F006C
      004E0061006D006500140053006F007500720063006500530069007A0065000E
      006400740049006E007400330032001C0043006F006E00730074007200610069
      006E0074004C00690073007400100056006900650077004C006900730074000E
      0052006F0077004C00690073007400060052006F0077000A0052006F00770049
      00440010004F0072006900670069006E0061006C001800520065006C00610074
      0069006F006E004C006900730074001C0055007000640061007400650073004A
      006F00750072006E0061006C001200530061007600650050006F0069006E0074
      000E004300680061006E00670065007300}
    object cdsClientenome: TStringField
      DisplayWidth = 75
      FieldName = 'nome'
    end
    object cdsClienteIdentidade: TStringField
      FieldName = 'Identidade'
    end
    object cdsClienteCPF: TStringField
      FieldName = 'CPF'
    end
    object cdsClientetelefone: TStringField
      FieldName = 'telefone'
    end
    object cdsClienteemail: TStringField
      FieldName = 'email'
    end
    object cdsClienteid: TIntegerField
      FieldName = 'id'
    end
  end
end
