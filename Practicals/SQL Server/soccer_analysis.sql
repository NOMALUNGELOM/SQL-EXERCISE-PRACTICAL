SELECT TOP (1000) [player_name]
      ,[team]
      ,[date_of_birth]
      ,[age]
      ,[marital_status]
      ,[number_of_kids]
      ,[nationality]
      ,[country_of_birth]
      ,[position]
      ,[preferred_foot]
      ,[height_cm]
      ,[weight_kg]
      ,[jersey_number]
      ,[injury_status]
      ,[agent]
      ,[matches_played]
      ,[minutes_played]
      ,[goals]
      ,[assists]
      ,[tackles]
      ,[interceptions]
      ,[saves]
      ,[clean_sheets]
      ,[yellow_cards]
      ,[red_cards]
      ,[passing_accuracy]
      ,[shot_accuracy]
      ,[previous_club]
      ,[years_at_club]
      ,[contract_end_year]
      ,[average_salary_zar]
      ,[market_value_zar]
      ,[signing_bonus_zar]
      ,[release_clause_zar]
  FROM [Soccer_Analysis].[dbo].[ketro_sa_soccer_dataset_advanced]


-- FOOTBALL PLAYERS DATA ANALYSIS

-- 1. View the first 100 rows
SELECT TOP 100 *
FROM [Soccer_Analysis].[dbo].[ketro_sa_soccer_dataset_advanced];
GO

-- 2. Count total number of players
SELECT COUNT(*) AS Total_Players
FROM [Soccer_Analysis].[dbo].[ketro_sa_soccer_dataset_advanced];
GO

-- 3. List all unique teams
SELECT DISTINCT Team
FROM [Soccer_Analysis].[dbo].[ketro_sa_soccer_dataset_advanced];
GO

-- 4. Count players in each team
SELECT Team, COUNT(*) AS Players_Per_Team
FROM [Soccer_Analysis].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY Team;
GO

-- 5. Top 10 players with most goals
SELECT TOP 10 Player_Name, Goals
FROM [Soccer_Analysis].[dbo].[ketro_sa_soccer_dataset_advanced]
ORDER BY Goals DESC;
GO

-- 6. Average salary per team
SELECT Team, 
average_salary_zar
FROM [Soccer_Analysis].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY Team;
GO

-- 7. Top 10 players by market value
SELECT TOP 10 Player_Name, market_value_zar
FROM [Soccer_Analysis].[dbo].[ketro_sa_soccer_dataset_advanced]
ORDER BY market_value_zar DESC;
GO

-- 8. Average passing accuracy per position
SELECT Position, AVG(passing_accuracy) AS Avg_Passing_Accuracy
FROM [Soccer_Analysis].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY Position;
GO

-- 9. Compare shot accuracy with goals (for correlation)
SELECT Player_Name, Goals, Shot_Accuracy
FROM [Soccer_Analysis].[dbo].[ketro_sa_soccer_dataset_advanced]
ORDER BY Goals DESC;
GO


-- 10. Total goals and assists per team
SELECT Team, 
       SUM(goals) AS Total_Goals,
       SUM(assists) AS Total_Assists
FROM [Soccer_Analysis].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY Team;
GO

-- 11. Count players by marital status
SELECT Marital_Status, COUNT(*) AS Players_Count
FROM [Soccer_Analysis].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY Marital_Status;
GO

-- 12. Count players by nationality
SELECT Nationality, COUNT(*) AS Players_Per_Nationality
FROM [Soccer_Analysis].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY Nationality;
GO

-- 13. Average market value by nationality
SELECT Nationality, AVG(market_value_zar) AS Avg_Market_Value
FROM [Soccer_Analysis].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY Nationality;
GO

-- 14. Players’ contracts ending per year
SELECT contract_end_year,
COUNT(*) AS Players_Count
FROM [Soccer_Analysis].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY contract_end_year;
GO

-- 15. Players whose contracts end next year
SELECT Player_Name, contract_end_year
FROM [Soccer_Analysis].[dbo].[ketro_sa_soccer_dataset_advanced]
WHERE contract_end_year = YEAR(GETDATE()) + 1;
GO

-- 16. Number of players by injury status
SELECT Injury_Status, 
COUNT(*) AS Players_Count
FROM [Soccer_Analysis].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY Injury_Status;
GO

-- 17. Goals per match ratio per player
SELECT Player_Name, 
       Goals, 
       Matches_Played, 
       CAST(Goals AS FLOAT)/NULLIF(Matches_Played, 0) AS Goals_Per_Match
FROM [Soccer_Analysis].[dbo].[ketro_sa_soccer_dataset_advanced];
GO

-- 18. Count players managed by each agent
SELECT agent,
COUNT(*) AS Players_Count
FROM [Soccer_Analysis].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY agent;
GO

-- 19. Average height and weight by position
SELECT Position, 
       AVG(height_cm) AS Avg_Height, 
       AVG(weight_kg) AS Avg_Weight
FROM [Soccer_Analysis].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY Position;
GO

-- 20. Players with highest combined goals + assists
SELECT TOP 10 Player_Name, 
(Goals + Assists) AS Total_Contributions
FROM [Soccer_Analysis].[dbo].[ketro_sa_soccer_dataset_advanced]
ORDER BY Total_Contributions DESC;
GO
