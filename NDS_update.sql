use master
go
Drop database NDS
go
Create database NDS
GO
use NDS
GO
DROP TABLE AQI;
go
DROP TABLE AQICategory;
go
DROP TABLE DefiningParam;
go
DROP TABLE County;
go
DROP TABLE State;
go

CREATE TABLE [State] (
    StateSK INT IDENTITY(1,1) PRIMARY KEY,
    StateID NVARCHAR(5),                  
    StateCode INT,						  
    StateName NVARCHAR(50),				  
    CreatedDate DATETIME DEFAULT GETDATE(),
    UpdatedDate DATETIME DEFAULT GETDATE(),
	SourceID INT
)
GO

CREATE TABLE County (
    CountySK INT IDENTITY(1,1) PRIMARY KEY,
    CountyFips NVARCHAR(5),
    CountyCode INT,		
    CountyName NVARCHAR(50),	
    CountyNameAscii NVARCHAR(50),
    CountyFull NVARCHAR(50),
    StateSK INT,
    Latitude DECIMAL(8,6),
    Longitude DECIMAL(9,6),
    [Population] INT,
    CreatedTime DATETIME DEFAULT GETDATE(), 
    UpdatedTime DATETIME DEFAULT GETDATE(), 
    SourceID INT
    CONSTRAINT FK_County_State FOREIGN KEY (StateSK) REFERENCES [State](StateSK)
)
GO

CREATE TABLE AQI (
    AQIEntrySK INT IDENTITY(1,1) PRIMARY KEY,
    CountySK INT,
    [Date] DATE,
    AQI INT,
    CategorySK INT,
    DefiningParameterSK INT,
    DefiningSite NVARCHAR(50),
    NumberOfSitesReporting INT,
    CreatedTime DATETIME DEFAULT GETDATE(),
    UpdatedTime DATETIME DEFAULT GETDATE(),
    SourceID INT
    CONSTRAINT FK_AQI_County FOREIGN KEY (CountySK) REFERENCES County(CountySK)
)
GO

CREATE TABLE AQICategory (
    CategorySK INT IDENTITY(1,1) PRIMARY KEY,
    LevelsOfConcern NVARCHAR(50),
    Description NVARCHAR(255),
    ValuesOfIndex NVARCHAR(50),
    DailyAQIColor NVARCHAR(50),
    SourceID INT,
	CreatedDate DATETIME DEFAULT GETDATE(),
    UpdatedDate DATETIME DEFAULT GETDATE(),
)
GO
select * from AQICategory;

CREATE TABLE DefiningParam (
    DefParamSK INT IDENTITY(1,1) PRIMARY KEY,
    ParamName NVARCHAR(50),
    SourceID INT,
	CreatedDate DATETIME DEFAULT GETDATE(),
    UpdatedDate DATETIME DEFAULT GETDATE(),
)
GO

INSERT INTO AQICategory (DailyAQIColor, LevelsOfConcern, ValuesOfIndex, Description, SourceID)
VALUES 
('Green', 'Good', '0 to 50', 'Air quality is satisfactory, and air pollution poses little or no risk.', 1),
('Yellow', 'Moderate', '51 to 100', 'Air quality is acceptable. However, there may be a risk for some people, particularly those who are unusually sensitive to air pollution.', 1),
('Orange', 'Unhealthy for Sensitive Groups', '101 to 150', 'Members of sensitive groups may experience health effects. The general public is less likely to be affected.', 1),
('Red', 'Unhealthy', '151 to 200', 'Some members of the general public may experience health effects; members of sensitive groups may experience more serious health effects.', 1),
('Purple', 'Very Unhealthy', '201 to 300', 'Health alert: The risk of health effects is increased for everyone.', 1),
('Maroon', 'Hazardous', '301 and higher', 'Health warning of emergency conditions: everyone is more likely to be affected.', 1);

select * from AQI
select * from County
select * from State
select * from DefiningParam
select * from AQICategory

