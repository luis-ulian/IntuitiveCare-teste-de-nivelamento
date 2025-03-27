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
    ROWTERMINATOR = '0x0a', --tentar com os dois SEMPRE
    CODEPAGE = '65001'
)


TRUNCATE TABLE dbo.Demonstracoes_Contabeis;
GO

BULK INSERT dbo.Demonstracoes_Contabeis
FROM "C:\programação\AplicaçõesDeVagas\IntuitiveCare\exercicio3\arquivos\1T2023.csv"
WITH
(
    FORMAT='CSV',
    FIRSTROW = 2,
    FIELDQUOTE='"',
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    CODEPAGE='65001'
)

BULK INSERT dbo.Demonstracoes_Contabeis
FROM "C:\programação\AplicaçõesDeVagas\IntuitiveCare\exercicio3\arquivos\1T2024.csv"
WITH
(
    FORMAT='CSV',
    FIRSTROW = 2,
    FIELDQUOTE='"',
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    CODEPAGE='65001'
)

BULK INSERT dbo.Demonstracoes_Contabeis
FROM "C:\programação\AplicaçõesDeVagas\IntuitiveCare\exercicio3\arquivos\2T2023.csv"
WITH
(
    FORMAT='CSV',
    FIRSTROW = 2,
    FIELDQUOTE='"',
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    CODEPAGE='65001'
)

BULK INSERT dbo.Demonstracoes_Contabeis
FROM "C:\programação\AplicaçõesDeVagas\IntuitiveCare\exercicio3\arquivos\2T2024.csv"
WITH
(
    FORMAT='CSV',
    FIRSTROW = 2,
    FIELDQUOTE='"',
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    CODEPAGE='65001'
)

BULK INSERT dbo.Demonstracoes_Contabeis
FROM "C:\programação\AplicaçõesDeVagas\IntuitiveCare\exercicio3\arquivos\3T2023.csv"
WITH
(
    FORMAT='CSV',
    FIRSTROW = 2,
    FIELDQUOTE='"',
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    CODEPAGE='65001'
)

BULK INSERT dbo.Demonstracoes_Contabeis
FROM "C:\programação\AplicaçõesDeVagas\IntuitiveCare\exercicio3\arquivos\3T2024.csv"
WITH
(
    FORMAT='CSV',
    FIRSTROW = 2,
    FIELDQUOTE='"',
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    CODEPAGE='65001'
)

BULK INSERT dbo.Demonstracoes_Contabeis
FROM "C:\programação\AplicaçõesDeVagas\IntuitiveCare\exercicio3\arquivos\4T2023.csv"
WITH
(
    FORMAT='CSV',
    FIRSTROW = 2,
    FIELDQUOTE='"',
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    CODEPAGE='65001'
)

BULK INSERT dbo.Demonstracoes_Contabeis
FROM "C:\programação\AplicaçõesDeVagas\IntuitiveCare\exercicio3\arquivos\4T2024.csv"
WITH
(
    FORMAT='CSV',
    FIRSTROW = 2,
    FIELDQUOTE='"',
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    CODEPAGE='65001'
)