
WITH GeneStats AS (
    -- Step 1: Calculate the baseline statistics for the BRCA1 gene across the whole cohort
    SELECT 
        Gene_ID,
        AVG(CAST(Expression_Value AS FLOAT)) AS Mean_Exp,
        STDEV(CAST(Expression_Value AS FLOAT)) AS StdDev_Exp
    FROM dbo.GSE96058_Expression
    WHERE Gene_ID = 'BRCA1'
    GROUP BY Gene_ID
)
-- Step 2: Compare every individual patient to that baseline
SELECT 
    e.Sample_ID,
    e.Gene_ID AS Target_Gene,
    ROUND(CAST(e.Expression_Value AS FLOAT), 4) AS Patient_Expression_Level,
    ROUND(s.Mean_Exp, 4) AS Cohort_Average,
    -- Z-Score Formula: (Value - Mean) / Standard Deviation
    ROUND((CAST(e.Expression_Value AS FLOAT) - s.Mean_Exp) / s.StdDev_Exp, 2) AS Z_Score,
    -- Classify the patient based on clinical thresholds
    CASE 
        WHEN CAST(e.Expression_Value AS FLOAT) > (s.Mean_Exp + 2 * s.StdDev_Exp) THEN 'Critical Over-Expression'
        WHEN CAST(e.Expression_Value AS FLOAT) < (s.Mean_Exp - 2 * s.StdDev_Exp) THEN 'Critical Under-Expression'
        ELSE 'Normal Range'
    END AS Clinical_Classification
FROM dbo.GSE96058_Expression e
INNER JOIN GeneStats s ON e.Gene_ID = s.Gene_ID
ORDER BY Z_Score DESC;