SELECT 
    CASE 
        WHEN "Number of Discharges" < 100 THEN "Small (under 100)"
        WHEN "Number of Discharges" < 300 THEN "Medium (100-300)"
        WHEN "Number of Discharges" < 600 THEN "Large (300-600)"
        ELSE "Very Large (600+)"
    END AS Hospital_Size,
    ROUND(AVG("Excess Readmission Ratio"), 3) AS Avg_Excess_Ratio,
    COUNT(*) AS Record_Count,
    ROUND(AVG("Predicted Readmission Rate"), 2) AS Avg_Readmission_Rate
FROM readmissions
GROUP BY Hospital_Size
ORDER BY Avg_Excess_Ratio DESC;