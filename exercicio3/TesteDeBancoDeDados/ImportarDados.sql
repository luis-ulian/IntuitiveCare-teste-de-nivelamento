TRUNCATE TABLE dbo.Empresas;
GO

BULK INSERT dbo.Empresas
FROM "C:\programação\AplicaçõesDeVagas\IntuitiveCare\exercicio3\arquivos\Relatorio_cadop.csv"
WITH
(
    DATAFILETYPE='char',
    FIRSTROW = 2,
    FIELDQUOTE= '"' ,
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '0x0a', --tentar com os dois SEMPRE
    CODEPAGE = '65001'
)
GO