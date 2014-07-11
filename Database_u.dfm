object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 192
  Width = 284
  object conCAP: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.ACE.OLEDB.12.0;Data Source=D:\TeeKay\PAT 2014' +
      '\Phase 3\Sample\C@P_Database.accdb;Mode=ReadWrite;Persist Securi' +
      'ty Info=False'
    Mode = cmReadWrite
    Provider = 'Microsoft.ACE.OLEDB.12.0'
    Left = 48
    Top = 32
  end
  object ADOTbls: TADOTable
    Active = True
    Connection = conCAP
    CursorType = ctStatic
    TableName = 'Login'
    Left = 136
    Top = 40
  end
  object dsrTables: TDataSource
    DataSet = ADOTbls
    Left = 120
    Top = 112
  end
end
