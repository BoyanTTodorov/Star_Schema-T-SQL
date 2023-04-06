-- Write your own SQL object definition here, and it'll be included in your package.
-- Create the University_Dim table

IF NOT EXISTS(SELECT * FROM sys.tables WHERE name IN ('University_Dim', 'Organization_Dim', 'Professor_Dim', 'Affiliation_Fact') and type= 'U')
BEGIN
CREATE TABLE [dbo].[University_Dim]
(
  university_shortname VARCHAR(10) PRIMARY KEY,
  university_name VARCHAR(100) NOT NULL,
  university_city VARCHAR(50) NOT NULL
);

-- Insert some sample data
INSERT INTO [dbo].[University_Dim] (university_shortname, university_name, university_city)
VALUES ('U001', 'University of Oxford', 'Oxford'),
       ('U002', 'University of Cambridge', 'Cambridge'),
       ('U003', 'Harvard University', 'Cambridge');

-- Create the Organization_Dim table
CREATE TABLE [dbo].[Organization_Dim]
(
  organization VARCHAR(50) PRIMARY KEY,
  organization_sector VARCHAR(100) NOT NULL
);

-- Insert some sample data
INSERT INTO [dbo].[Organization_Dim] (organization, organization_sector)
VALUES ('Org001', 'Education'),
       ('Org002', 'Healthcare'),
       ('Org003', 'Technology');

-- Create the Professor_Dim table
CREATE TABLE [dbo].[Professor_Dim]
(
  professor_name VARCHAR(100) PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  university_shortname VARCHAR(10) NOT NULL REFERENCES [dbo].[University_Dim](university_shortname)
);

-- Insert some sample data
INSERT INTO [dbo].[Professor_Dim] (professor_name, first_name, last_name, university_shortname)
VALUES ('John Smith (U001)', 'John', 'Smith', 'U001'),
       ('Jane Doe (U002)', 'Jane', 'Doe', 'U002'),
       ('Bob Johnson (U003)', 'Bob', 'Johnson', 'U003');

-- Create the Affiliation_Fact table
CREATE TABLE [dbo].[Affiliation_Fact]
(
  university_shortname VARCHAR(10) NOT NULL REFERENCES [dbo].[University_Dim](university_shortname),
  organization VARCHAR(50) NOT NULL REFERENCES [dbo].[Organization_Dim](organization)
)
END 
GO