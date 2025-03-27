IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Empresas]') AND type in (N'U'))
DROP TABLE [dbo].[Empresas]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Demonstracoes_Contabeis]') AND type in (N'U'))
DROP TABLE [dbo].[Demonstracoes_Contabeis]
GO
