USE test
GO
IF NOT EXISTS(SELECT * from sys.tables where name in ('affiliations') and type = 'U')
BEGIN
CREATE TABLE [dbo].[affiliations]
(
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  "function" VARCHAR (50) NOT NULL,
  organization VARCHAR(50) NOT NULL 

)
END
GO

