TRUNCATE TABLE dbo.Empresas;
GO

BULK INSERT dbo.Empresas
FROM "C:\programação\AplicaçõesDeVagas\IntuitiveCare\exercicio3\arquivos\Relatorio_cadop.csv"
WITH
(
    FORMAT='CSV',
    DATAFILETYPE='char',
    FIRSTROW = 2,
    FIELDQUOTE='"',
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '0x0a', 
    CODEPAGE = '65001'
)

TRUNCATE TABLE dbo.Demonstracoes_Contabeis;
GO

CREATE TABLE ##tmp(
    [DTA] DATETIME,
    [COD_REGISTRO_ANS] INT NOT NULL,
    [CD_CONTA_CONTABIL] VARCHAR(15),
    [DESCRICAO] VARCHAR(255),
    [VLR_SALDO_INICIAL] VARCHAR(30),
    [VLR_SALDO_FINAL] VARCHAR(30)
)

GO

CREATE FUNCTION InserirBulk(@path NVARCHAR(1000)) 
RETURNS NVARCHAR(1000)
AS
    BEGIN
        declare @func NVARCHAR(1000)
        set @func = N'BULK INSERT ##tmp
        FROM '''+@path+'''
        WITH
        (
            FORMAT=''CSV'',
            FIRSTROW = 2,
            FIELDQUOTE=''"'',
            FIELDTERMINATOR = '';'',
            ROWTERMINATOR = ''\n'',
            CODEPAGE=''65001''
        )'
        
        RETURN @func
    END
GO

DECLARE @path1  NVARCHAR(100) = 'C:\programação\AplicaçõesDeVagas\IntuitiveCare\exercicio3\arquivos\1T2023.csv'
DECLARE @path2  NVARCHAR(100) = 'C:\programação\AplicaçõesDeVagas\IntuitiveCare\exercicio3\arquivos\1T2024.csv'
DECLARE @path3  NVARCHAR(100) = 'C:\programação\AplicaçõesDeVagas\IntuitiveCare\exercicio3\arquivos\2t2023.csv'
DECLARE @path4  NVARCHAR(100) = 'C:\programação\AplicaçõesDeVagas\IntuitiveCare\exercicio3\arquivos\2T2024.csv'
DECLARE @path5  NVARCHAR(100) = 'C:\programação\AplicaçõesDeVagas\IntuitiveCare\exercicio3\arquivos\3T2023.csv'
DECLARE @path6  NVARCHAR(100) = 'C:\programação\AplicaçõesDeVagas\IntuitiveCare\exercicio3\arquivos\3T2024.csv'
DECLARE @path7  NVARCHAR(100) = 'C:\programação\AplicaçõesDeVagas\IntuitiveCare\exercicio3\arquivos\4T2023.csv'
DECLARE @path8  NVARCHAR(100) = 'C:\programação\AplicaçõesDeVagas\IntuitiveCare\exercicio3\arquivos\4T2024.csv'

declare @sql NVARCHAR(1000)

SET @sql = (SELECT dbo.InserirBulk(@path1))
EXEC master.sys.sp_executesql @sql

SET @sql = (SELECT dbo.InserirBulk(@path2))
EXEC master.sys.sp_executesql @sql

SET @sql = (SELECT dbo.InserirBulk(@path3))
EXEC master.sys.sp_executesql @sql

SET @sql = (SELECT dbo.InserirBulk(@path4))
EXEC master.sys.sp_executesql @sql

SET @sql = (SELECT dbo.InserirBulk(@path5))
EXEC master.sys.sp_executesql @sql

SET @sql = (SELECT dbo.InserirBulk(@path6))
EXEC master.sys.sp_executesql @sql

SET @sql = (SELECT dbo.InserirBulk(@path7))
EXEC master.sys.sp_executesql @sql

SET @sql = (SELECT dbo.InserirBulk(@path8))
EXEC master.sys.sp_executesql @sql

INSERT INTO dbo.Demonstracoes_Contabeis SELECT t.DTA,
                                               t.COD_REGISTRO_ANS,
                                               t.CD_CONTA_CONTABIL,
                                               t.DESCRICAO,
                                               CAST(REPLACE(trim(t.VLR_SALDO_INICIAL), ',', '.') AS MONEY),
                                               CAST(REPLACE(trim(t.VLR_SALDO_FINAL), ',', '.') AS MONEY)
                                                  FROM ##tmp t

drop table ##tmp

drop function dbo.InserirBulk

SELECT * from dbo.Demonstracoes_Contabeis