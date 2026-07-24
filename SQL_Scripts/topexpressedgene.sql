SELECT TOP 50
    Gene_ID AS Gene_Symbol,
    ROUND(AVG(CAST(Expression_Value AS FLOAT)), 4) AS Global_Avg_Expression
FROM dbo.GSE96058_Expression
GROUP BY Gene_ID
-- We filter out genes with zero or negative average expression to clean the data
HAVING AVG(CAST(Expression_Value AS FLOAT)) > 0 
ORDER BY Global_Avg_Expression DESC;