use wizard_world;

-- Drop tables if they exist to avoid conflicts
-- DROP TABLE IF EXISTS Character_Loyalty;
-- DROP TABLE IF EXISTS Characters;
-- DROP TABLE IF EXISTS Loyalty;
-- DROP TABLE IF EXISTS House;
-- DROP TABLE IF EXISTS Species;

-- Create House table
CREATE TABLE House (
    House_Id INT AUTO_INCREMENT PRIMARY KEY,
    House_Name VARCHAR(255) NOT NULL
);

-- Create Species table
CREATE TABLE Species (
    Species_Id INT AUTO_INCREMENT PRIMARY KEY,
    Species_Name VARCHAR(255) NOT NULL
);

-- Create Characters table with additional fields
CREATE TABLE Characters (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Gender VARCHAR(50),
    Death varchar(255),
    Slug VARCHAR(50),
    Wiki_URL VARCHAR(255) NOT NULL,
    Blood_status VARCHAR(255) NOT NULL,
    Nationality VARCHAR(255) NOT NULL,
    House_Id INT, -- > FK
    Species_Id INT, -- > FK
    FOREIGN KEY (House_Id) REFERENCES House(House_Id),
    FOREIGN KEY (Species_Id) REFERENCES Species(Species_Id)
);

-- Create Loyalty table with foreign key reference to Characters table
CREATE TABLE Loyalty (
    Loyalty_Id INT AUTO_INCREMENT PRIMARY KEY,
    Loyalty_Name VARCHAR(255) NOT NULL,
	Good_Bad VARCHAR(255)
);

-- Create Character_Loyalty table to establish many-to-many relationship
CREATE TABLE Character_Loyalty (
    Character_Loyalty_Id INT AUTO_INCREMENT PRIMARY KEY,
    Character_Id INT,
    Loyalty_Id INT,
    FOREIGN KEY (Character_Id) REFERENCES Characters(Id),
    FOREIGN KEY (Loyalty_Id) REFERENCES Loyalty(Loyalty_Id)
);


CREATE TABLE `sentence` (
  `Name` text,
  `Sentence` text,
  `sentence_id` int NOT NULL AUTO_INCREMENT,
  `Character_ID` int DEFAULT NULL,
  PRIMARY KEY (`sentence_id`),
  KEY `characters_iD_fk` (`Character_ID`),
  CONSTRAINT `characters_iD_fk` FOREIGN KEY (`Character_ID`) REFERENCES `characters` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1584 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

