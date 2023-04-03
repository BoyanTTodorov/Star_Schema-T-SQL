-- IF OBJECT_ID(N'newdb', N'U') IS NULL
-- BEGIN
--     CREATE TABLE newdb
--     (
--         id INT IDENTITY(1, 1),
--         name VARCHAR(50)
--     )
-- END
-- ELSE
-- BEGIN
--     INSERT INTO newdb
--     (
--         name
--     )
--     VALUES
--     ('Boyan')
-- END
-- SELECT *
-- FROM newdb

-- INSERT INTO [dbo].[newdb]
-- (
--     [name]
-- )
-- SELECT [name]
-- FROM [dbo].[county]


-- TRUNCATE TABLE [dbo].[newdb];
-- DBCC CHECKIDENT('newdb', RESEED, 0);
-- SELECT *
-- FROM [dbo].[newdb];

-- INSERT INTO newdb
-- (
--     name
-- )
-- SELECT name
-- FROM county
-- INSERT INTO [dbo].[newdb]
-- (
--     name
-- )
-- SELECT name
-- FROM county
-- WHERE LEFT(name, 1) = 'A'

-- SELECT *
-- FROM newdb
-- WHERE name NOT LIKE ('%County%');

-- DECLARE @name VARCHAR(10);
-- SET @name = 'Boyan';
-- SELECT @name AS name;

-- TRUNCATE TABLE newdb;

-- INSERT INTO newdb
-- SELECT [name]
-- FROM [dbo].[county];

-- ALTER TABLE [dbo].[newdb] ALTER COLUMN [name] VARCHAR(150);
-- EXEC sp_rename 'dbo.newdb.name', 'new_name', 'COLUMN';
-- ALTER TABLE [dbo].[newdb] ALTER COLUMN [new_name] VARCHAR(255) NOT NULL;
-- SELECT *
-- FROM [dbo].[newdb];

-- ALTER TABLE [dbo].[newdb]
-- ADD CONSTRAINT unique_new_name
--     UNIQUE ([new_name]);

-- SELECT new_name,
--        COUNT(*) AS count
-- FROM [dbo].[newdb]
-- GROUP BY new_name
-- HAVING COUNT(*) > 1;


-- EXEC sp_rename 'dbo.newdb.new_name', 'name', 'COLUMN';


-- IF NOT EXISTS
-- (
--     SELECT *
--     FROM sys.tables
--     WHERE name IN ( 'professors', 'organizations', 'universities' )
--           AND type = 'U'
-- )
-- BEGIN

--     CREATE TABLE professors
--     (
--         first_name VARCHAR(50),
--         lastname VARCHAR(50),
--         university_shortname VARCHAR(10)
--     );

--     CREATE TABLE organizations
--     (
--         organization_sector VARCHAR(50),
--         organization VARCHAR(50),
--     );

--     CREATE TABLE universities
--     (
--         university VARCHAR(40),
--         university_shortname VARCHAR(10),
--         university_city VARCHAR(30)
--     )
-- END

-- EXEC SP_RENAME '[DBO].[UNIVERSITIES].[UNIVERSITY_SHORTNAME]',
--                'ID',
--                'COLUMN';

-- ALTER TABLE [DBO].[UNIVERSITIES] DROP COLUMN ID;

-- ALTER TABLE [DBO].[UNIVERSITIES]
-- ADD ID INT IDENTITY(1, 1) NOT NULL PRIMARY KEY;

-- ALTER TABLE [DBO].[UNIVERSITIES] ALTER COLUMN [ID] INT;

-- ALTER TABLE [DBO].[UNIVERSITIES]
-- ADD CONSTRAINT UNIVERSITIES_PK
--     PRIMARY KEY ([ID]);

-- IF NOT EXISTS
-- (
--     SELECT *
--     FROM sys.tables
--     WHERE name IN ( 'new_table' )
--           AND TYPE = 'U'
-- )
-- BEGIN
--     CREATE TABLE new_table
--     (
--         id VARCHAR(5),
--         name VARCHAR(20)
--     )
-- END

-- -- Cannot define PRIMARY KEY constraint on nullable column in table 'new_table'.
-- -- We can solve it by droping the column and add new one predefined column
-- ALTER TABLE new_table ALTER COLUMN id INT;

-- ALTER TABLE new_table ADD CONSTRAINT new_table_primary PRIMARY KEY (id);

-- ALTER TABLE new_table DROP COLUMN id;

-- ALTER TABLE new_table ADD id INT IDENTITY(1, 1) NOT NULL PRIMARY KEY;

-- INSERT INTO new_table
-- (
--     name
-- )
-- VALUES
-- ('Boyan')

-- INSERT INTO new_table
-- VALUES
-- ('Boyan'),
-- ('Pencho'),
-- ('Stamat'),
-- ('Boyan'),
-- ('Stamat');



-- SELECT name,
--        COUNT(*) AS COUNT
-- FROM new_table
-- GROUP BY name
-- HAVING COUNT(*) > 1;