SELECT 
    Gene_ID AS Breast_Cancer_Biomarker,
    COUNT(Sample_ID) AS Total_Samples_Analyzed,
    ROUND(AVG(CAST(Expression_Value AS FLOAT)), 4) AS Average_Expression,
    ROUND(MIN(CAST(Expression_Value AS FLOAT)), 4) AS Minimum_Expression,
    ROUND(MAX(CAST(Expression_Value AS FLOAT)), 4) AS Maximum_Expression
FROM dbo.GSE96058_Expression
WHERE Gene_ID IN ('BRCA1', 'BRCA2', 'TP53', 'ERBB2', 'ESR1', 'PGR')
GROUP BY Gene_ID
ORDER BY Average_Expression DESC;
