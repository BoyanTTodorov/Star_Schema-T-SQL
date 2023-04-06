USE test
GO
IF NOT EXISTS(SELECT * FROM sys.tables WHERE name IN('professors') AND type = 'U')
BEGIN
CREATE TABLE [dbo].[professors]
(
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  univercity_shortname CHAR(3) NOT NULL
)
END
GO