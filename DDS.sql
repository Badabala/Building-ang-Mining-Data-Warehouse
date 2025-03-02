Use master
GO
CREATE DATABASE DDS
GO
USE DDS
GO


CREATE TABLE DateDimension 
(
	DateSK INT NOT NULL IDENTITY(1,1),
	Day INT,
	Month INT,
	Quater INT,
	Year INT,
	DaylightSaving INT,
	CreatedDate DATETIME DEFAULT GETDATE(),
	UpdatedDate DATETIME DEFAULT GETDATE(),
	SourceID INT,
	CONSTRAINT PK_DateDim
	PRIMARY KEY (DateSK)
)
go

CREATE TABLE DefiningParaDim
(
	DefParamSK INT,
	ParamName NVARCHAR(50),
	CreatedTime  DATETIME DEFAULT GETDATE(),
	UpdatedTime  DATETIME DEFAULT GETDATE(),
	SourceID INT,
	CONSTRAINT PK_DefiningParaDim
	PRIMARY KEY (DefParamSK)
)
go


CREATE TABLE StateDimension 
(
	StateSK INT,
	StateName NVARCHAR(50),
	StateID NVARCHAR(5),
	CreatedTime  DATETIME DEFAULT GETDATE(),
	UpdatedTime  DATETIME DEFAULT GETDATE(),
	SourceID INT,
	CONSTRAINT PK_StateDim
	PRIMARY KEY (StateSK)
)
go

CREATE TABLE CountyDimension 
(
	CountySK INT,
	CountyCode INT,
	CountyName NVARCHAR(50),
	CountyFull NVARCHAR(50),
	CountyFips INT,
	Latitude FLOAT,
	Longtitud FLOAT,
	Population INT,
	CreatedTime  DATETIME DEFAULT GETDATE(),
	UpdatedTime  DATETIME DEFAULT GETDATE(),
	StateSK INT,
	SourceID INT,
	CONSTRAINT PK_CountyDim
	PRIMARY KEY (CountySK),
	CONSTRAINT FK_CountyDim_StateDim
	FOREIGN KEY (StateSK)
	REFERENCES StateDimension(StateSK)
)
go

CREATE TABLE AQICategoryDim
(
	CategorySK INT,
	LevelsOfConcern NVARCHAR (50),
	Description NVARCHAR(255), 
	ValuesOfIndex NVARCHAR(50),
	DailyAQIColor NVARCHAR(50), 
	CreatedTime  DATETIME DEFAULT GETDATE(), 
	UpdatedTime  DATETIME DEFAULT GETDATE(),
	SourceID INT, CONSTRAINT PK_AQICategoryDim
	PRIMARY KEY (CategorySK)
)
go

CREATE TABLE AQIFactTable

(
	AQISK INT NOT NULL IDENTITY (1,1),
	DateSK INT,
	CountySK INT,
	CategorySK INT,
	DefParamSK INT,
	AQI INT,
	CreatedDate  DATETIME DEFAULT GETDATE(),
	UpdatedDate  DATETIME DEFAULT GETDATE(),
	SourceID INT,
	CONSTRAINT PK_AQIFactTable
	PRIMARY KEY (AQISK),
	CONSTRAINT FK_AQI_DateDim
	FOREIGN KEY (DateSK)
	REFERENCES DateDimension(DateSK),
	CONSTRAINT FK_AQI_CountyDim
	FOREIGN KEY (CountySK)
	REFERENCES CountyDimension (CountySK),
	CONSTRAINT FK_AQI_CategoryDim
	FOREIGN KEY (CategorySK)
	REFERENCES AQICategoryDim (CategorySK),
	CONSTRAINT FK_AQI_DefParamDim
	FOREIGN KEY (DefParamSK)
	REFERENCES DefiningParaDim(DefParamSK)
)
GO

-- Procedure tạo dữ liệu bảng DateDimension
CREATE OR ALTER PROCEDURE PopulateDateDimension
AS
BEGIN
	INSERT INTO DateDimension (Day, Month, Quater, Year, DayLightSaving)
	SELECT
		DAY(Date) AS Day,
		MONTH(Date) AS Month,
		CASE
			WHEN MONTH(Date) IN (1, 2, 3) THEN 1
			WHEN MONTH(Date) IN (4, 5, 6) THEN 2
			WHEN MONTH(Date) IN (7, 8, 9) THEN 3
			ELSE 4
		END AS Quater,
		YEAR(Date) AS Year,
		CASE
			WHEN Date BETWEEN '2023-03-12' AND '2023-11-05' THEN 1
			ELSE 0
		END AS DayLightSaving
	FROM
		(SELECT DISTINCT Date FROM NDS.dbo.AQI) AQI
	ORDER BY
		Date ASC;
END;
go


EXEC PopulateDateDimension;
Select * from DateDimension
go

SELECT *  FROM DefiningParaDim;
SELECT * FROM StateDimension;
SELECT * FROM CountyDimension;
SELECT * FROM AQICategoryDim;
SELECT * FROM AQIFactTable;

delete from DefiningParaDim;
delete from CountyDimension ;
delete from StateDimension;
delete from AQICategoryDim;
delete from AQIFactTable;


