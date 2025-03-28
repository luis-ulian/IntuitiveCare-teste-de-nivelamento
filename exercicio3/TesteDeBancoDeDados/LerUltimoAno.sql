WITH DataMax AS (
    SELECT 
        MAX(DTA) AS DataMaxima
    FROM 
        Demonstracoes_Contabeis
),
FiltradasUltimoAno AS (
    SELECT 
        dc.COD_REGISTRO_ANS,
        e.DES_RAZAO,
        dc.VLR_SALDO_FINAL,
        dc.VLR_SALDO_INICIAL
    FROM 
        Demonstracoes_Contabeis dc
    INNER JOIN 
        Empresas e ON dc.COD_REGISTRO_ANS = e.COD_REGISTRO_ANS
    WHERE 
        DC.DESCRICAO = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR'
        AND dc.DTA >= DATEADD(YEAR, -1, (SELECT DataMaxima from DataMax))
)
SELECT
    COD_REGISTRO_ANS,
    DES_RAZAO,
    SUM(VLR_SALDO_FINAL - VLR_SALDO_INICIAL) AS TotalDespesas
FROM 
    FiltradasUltimoAno
WHERE 
    VLR_SALDO_FINAL < VLR_SALDO_INICIAL
GROUP BY 
    COD_REGISTRO_ANS, DES_RAZAO
ORDER BY 
    TotalDespesas ASC