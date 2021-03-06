object DM_Conexao: TDM_Conexao
  OldCreateOrder = True
  Height = 351
  Width = 733
  object Conexao: TSQLConnection
    DriverName = 'Firebird'
    KeepConnection = False
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver260.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver260.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=24.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      
        'Database=C:\Users\HAHA\Desktop\Sistema de Cadastro\Dados\DADOS.F' +
        'DB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'SQLDialect=3'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'TrimChar=False'
      'BlobSize=-1'
      'ErrorResourceFile='
      'RoleName=RoleName'
      'ServerCharSet='
      'Trim Char=False')
    Left = 280
    Top = 18
  end
  object SQLDSCliente: TSQLDataSet
    CommandText = 
      'select CODIGO_CLIENTE, IMAGEM_CLIENTE, NOME_CLIENTE, STATUS_CLIE' +
      'NTE from CLIENTE'#13#10'where CLIENTE.CODIGO_CLIENTE=:COD'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD'
        ParamType = ptInput
      end>
    SQLConnection = Conexao
    Left = 44
    Top = 107
    object SQLDSClienteCODIGO_CLIENTE: TIntegerField
      FieldName = 'CODIGO_CLIENTE'
      Required = True
    end
    object SQLDSClienteIMAGEM_CLIENTE: TStringField
      FieldName = 'IMAGEM_CLIENTE'
      Size = 50
    end
    object SQLDSClienteNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 40
    end
    object SQLDSClienteSTATUS_CLIENTE: TStringField
      FieldName = 'STATUS_CLIENTE'
      Size = 10
    end
  end
  object CDSCliente: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'COD'
        ParamType = ptInput
      end>
    ProviderName = 'DSProviderCliente'
    Left = 43
    Top = 257
    object CDSClienteCODIGO_CLIENTE: TIntegerField
      FieldName = 'CODIGO_CLIENTE'
      Required = True
    end
    object CDSClienteNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 40
    end
    object CDSClienteSTATUS_CLIENTE: TStringField
      FieldName = 'STATUS_CLIENTE'
      Size = 10
    end
    object CDSClienteIMAGEM_CLIENTE: TStringField
      FieldName = 'IMAGEM_CLIENTE'
      Size = 50
    end
    object CDSClienteSQLDSTelefone: TDataSetField
      FieldName = 'SQLDSTelefone'
    end
    object CDSClienteSQLDSEndereco: TDataSetField
      FieldName = 'SQLDSEndereco'
    end
  end
  object DSProviderCliente: TDataSetProvider
    DataSet = SQLDSCliente
    Left = 43
    Top = 187
  end
  object SQLDSExecuteScalar: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 358
    Top = 18
  end
  object CDSEndereco: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 664
    Top = 271
  end
  object SQLDSEndereco: TSQLDataSet
    CommandText = 
      'select CODIGO_ENDERECO, BAIRRO_ENDERECO, ID_ENDERECO_CLIENTE, CI' +
      'DADE_ENDERECO, NUMERO_ENDERECO, RUA_ENDERECO, UF_ENDERECO from E' +
      'NDERECO'#13#10'WHERE ID_ENDERECO_CLIENTE = :CODIGO_CLIENTE'
    DataSource = DSLinkTelefone
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO_CLIENTE'
        ParamType = ptInput
      end>
    SQLConnection = Conexao
    Left = 661
    Top = 104
    object SQLDSEnderecoCODIGO_ENDERECO: TIntegerField
      FieldName = 'CODIGO_ENDERECO'
      Required = True
    end
    object SQLDSEnderecoBAIRRO_ENDERECO: TStringField
      FieldName = 'BAIRRO_ENDERECO'
      Size = 30
    end
    object SQLDSEnderecoCIDADE_ENDERECO: TStringField
      FieldName = 'CIDADE_ENDERECO'
      Size = 30
    end
    object SQLDSEnderecoNUMERO_ENDERECO: TStringField
      FieldName = 'NUMERO_ENDERECO'
      Size = 10
    end
    object SQLDSEnderecoRUA_ENDERECO: TStringField
      FieldName = 'RUA_ENDERECO'
      Size = 30
    end
    object SQLDSEnderecoUF_ENDERECO: TStringField
      FieldName = 'UF_ENDERECO'
      Size = 10
    end
    object SQLDSEnderecoID_ENDERECO_CLIENTE: TIntegerField
      FieldName = 'ID_ENDERECO_CLIENTE'
    end
  end
  object DSLinkEndereco: TDataSource
    DataSet = SQLDSCliente
    Left = 572
    Top = 107
  end
  object DSLinkTelefone: TDataSource
    DataSet = SQLDSCliente
    Left = 277
    Top = 123
  end
  object SQLDSTelefone: TSQLDataSet
    CommandText = 
      'select CODIGO_TELEFONE, NUMERO_TELEFONE, TIPO_TELEFONE, ID_TELEF' +
      'ONE_CLIENTE from TELEFONE '#13#10'WHERE ID_TELEFONE_CLIENTE = :CODIGO_' +
      'CLIENTE'
    DataSource = DSLinkTelefone
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO_CLIENTE'
        ParamType = ptInput
      end>
    SQLConnection = Conexao
    Left = 371
    Top = 122
    object SQLDSTelefoneCODIGO_TELEFONE: TIntegerField
      FieldName = 'CODIGO_TELEFONE'
      Required = True
    end
    object SQLDSTelefoneNUMERO_TELEFONE: TStringField
      FieldName = 'NUMERO_TELEFONE'
      Size = 12
    end
    object SQLDSTelefoneTIPO_TELEFONE: TStringField
      FieldName = 'TIPO_TELEFONE'
      Size = 1
    end
    object SQLDSTelefoneID_TELEFONE_CLIENTE: TIntegerField
      FieldName = 'ID_TELEFONE_CLIENTE'
    end
  end
  object CDSTelefone: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'IndexNumero_Telefone'
        Fields = 'NUMERO_TELEFONE'
      end>
    IndexName = 'IndexNumero_Telefone'
    Params = <>
    StoreDefs = True
    Left = 370
    Top = 260
  end
  object CDSTelefoneClone: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 434
    Top = 21
  end
end
