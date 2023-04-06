USE test
GO
IF NOT EXISTS(SELECT * from sys.tables where name in ('universities') and type = 'U')
BEGIN
CREATE TABLE [dbo].[universities]
(
  university_name VARCHAR(100) NOT NULL,
  university_shortname CHAR(3) NOT NULL,
  university_city VARCHAR(50) NOT NULL
)
END
GO
