SELECT TOP 100
    gse.Gene_ID AS Gene_Symbol,
    tcga.gene_id AS TCGA_Ensembl_ID,
    ROUND(AVG(CAST(gse.Expression_Value AS FLOAT)), 4) AS GSE_Average_Expression
FROM dbo.GSE96058_Expression AS gse
INNER JOIN dbo.Gene_Annotations AS tcga 
    ON gse.Gene_ID = tcga.gene_name
GROUP BY gse.Gene_ID, tcga.gene_id
ORDER BY GSE_Average_Expression DESC;