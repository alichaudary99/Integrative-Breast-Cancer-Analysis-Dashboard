SELECT 
    COALESCE(gse.Gene_ID, tcga.gene_name) AS Gene_Name,
    CASE WHEN gse.Gene_ID IS NOT NULL THEN 'Yes' ELSE 'No' END AS Present_In_GSE96058,
    CASE WHEN tcga.gene_name IS NOT NULL THEN 'Yes' ELSE 'No' END AS Present_In_TCGA_BRCA,
    tcga.gene_id AS Standardized_Ensembl_ID
FROM (SELECT DISTINCT Gene_ID FROM dbo.GSE96058_Expression) AS gse
FULL OUTER JOIN dbo.Gene_Annotations AS tcga 
    ON gse.Gene_ID = tcga.gene_name
ORDER BY Present_In_GSE96058 DESC, Present_In_TCGA_BRCA DESC;