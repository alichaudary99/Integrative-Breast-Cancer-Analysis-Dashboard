SELECT TOP 20
    gse.Gene_ID AS Verified_Gene_Symbol,
    tcga.gene_id AS Ensembl_ID,
    COUNT(gse.Sample_ID) AS Total_GSE_Samples,
    ROUND(AVG(CAST(gse.Expression_Value AS FLOAT)), 4) AS Mean_Expression,
    -- VAR calculates the statistical variance across all 10.5M rows
    ROUND(VAR(CAST(gse.Expression_Value AS FLOAT)), 4) AS Expression_Variance
FROM dbo.GSE96058_Expression AS gse
INNER JOIN dbo.Gene_Annotations AS tcga 
    ON gse.Gene_ID = tcga.gene_name
GROUP BY gse.Gene_ID, tcga.gene_id
-- Ensures we only look at high-quality genes evaluated across your whole cohort
HAVING COUNT(gse.Sample_ID) > 1000 
ORDER BY Expression_Variance DESC;
