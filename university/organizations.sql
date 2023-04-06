USE test
GO
IF NOT EXISTS(SELECT * from sys.tables where name in ('organizations') and type = 'U')
BEGIN
CREATE TABLE [dbo].[organizations]
(
  organization VARCHAR(100) NOT NULL,
  organization_sector VARCHAR(100) NOT NULL
)
END
