
use wizard_world;

INSERT INTO House (House_Name)
SELECT DISTINCT House
FROM wizard_df
WHERE House IS NOT NULL;

INSERT INTO Species (Species_Name)
SELECT DISTINCT Species
FROM wizard_df
WHERE Species IS NOT NULL;

Select * from characters;


INSERT INTO Characters (Name, Gender, Death, Slug, Wiki_URL, Blood_status, Nationality, House_Id, Species_Id)
SELECT 
    Name,
    Gender,
    Death,
    Slug,
    Wiki AS Wiki_URL,
    `Categorized Blood status` AS Blood_status,
    `Simplified Nationality` AS Nationality,
    (SELECT House_Id FROM House WHERE House_Name = wizard_df.House),
    (SELECT Species_Id FROM Species WHERE Species_Name = wizard_df.Species)
FROM wizard_df;

Select * from Loyalty;


INSERT INTO Loyalty (Loyalty_Name, Good_Bad)
SELECT DISTINCT 
Loyalty
,`Good/Bad`
FROM wizard_df
WHERE Loyalty IS NOT NULL;

UPDATE sentence
SET Character_ID = (
    SELECT c.ID 
    FROM characters c
    WHERE c.name = sentence.name
);
