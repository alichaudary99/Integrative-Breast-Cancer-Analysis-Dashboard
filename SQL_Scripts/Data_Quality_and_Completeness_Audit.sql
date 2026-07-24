create view vw_Data_Quality_and_Completeness_Audit AS
SELECT 
    'GSE96058_Expression' AS Dataset_Name,
    COUNT(*) AS Total_Records,
    SUM(CASE WHEN Gene_ID IS NULL OR Gene_ID = '' THEN 1 ELSE 0 END) AS Missing_Gene_IDs,
    SUM(CASE WHEN Expression_Value IS NULL THEN 1 ELSE 0 END) AS Missing_Expression_Values
FROM dbo.GSE96058_Expression

UNION ALL

SELECT 
    'TCGA_BRCA_Matrix' AS Dataset_Name,
    COUNT(*) AS Total_Records,
    SUM(CASE WHEN gene_id IS NULL OR gene_id = '' THEN 1 ELSE 0 END) AS Missing_Gene_IDs,
    SUM(CASE WHEN gene_name IS NULL OR gene_name = '' THEN 1 ELSE 0 END) AS Missing_Gene_Names
FROM dbo.Gene_Annotations;