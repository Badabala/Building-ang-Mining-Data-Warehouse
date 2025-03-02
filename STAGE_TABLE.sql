Use master
GO
Create database Stage_DB
GO
USE Stage_DB

GO
DROP TABLE STATE_AQI_STAGE

GO
CREATE TABLE [STATE_AQI_STAGE](
	[State_Name] NVARCHAR(50),
	[county_Name] NVARCHAR(50),
	[State_Code] INT,
	[County_Code] int,
	[Date] date,
	[AQI] int,
	[Category] NVARCHAR(50),
	[Defining_Parameter] NVARCHAR(50),
	[Defining_Site] NVARCHAR(50),
	[Number_of_Sites_Reporting] int,
	[Created] datetime2(7),
	[Last_Updated] datetime2(7)
) 

GO
DROP TABLE US_COUNTIES_STAGE

GO
CREATE TABLE US_COUNTIES_STAGE (
	CountyName NVARCHAR(50),
	CountyASCII NVARCHAR(50),
	CountyFull NVARCHAR(50),
	CountyFips NVARCHAR(5),
	StateID NCHAR(5),
	StateName NVARCHAR(50),
	Latitude DECIMAL(8,6),
	Longitude DECIMAL(9,6),
	Population INT
)

select * from [STATE_AQI_STAGE]
select distinct([Category]) from [STATE_AQI_STAGE]
select distinct([Defining_Parameter]) from [STATE_AQI_STAGE]
select distinct([Defining_Site]) from [STATE_AQI_STAGE]



