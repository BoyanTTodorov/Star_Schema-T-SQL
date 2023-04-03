-- if object_id(N'newdb', N'U') is null
-- begin
--     create table newdb
--     (
--         id int IDENTITY(1,1),
--         name VARCHAR(50)
--     )
-- end
-- ELSE
-- BEGIN
--     insert into newdb
--         (name)
--     values('Boyan')
-- end
-- select *
-- from newdb

-- insert into [dbo].[newdb]
--     ([name])
-- select [name]
-- from [dbo].[county]


-- truncate TABLE [dbo].[newdb];
-- DBCC CHECKIDENT ('newdb', RESEED, 0);
-- select *
-- from [dbo].[newdb];

-- insert into newdb
--     (name)
-- select name
-- from county
-- insert into [dbo].[newdb]
--     (name)
-- select name
-- from county
-- where LEFT(name, 1) = 'A'

-- select *
-- from newdb
-- where name  not like ('%County%');

-- declare @name varchar(10);
-- set @name = 'Boyan';
-- select @name as name;

-- TRUNCATE table newdb;

-- insert into newdb
-- select [name]
-- FROM[dbo].[county];

-- alter table [dbo].[newdb] alter COLUMN [name] varchar(150);
-- exec sp_rename 'dbo.newdb.name', 'new_name', 'COLUMN';
-- alter table [dbo].[newdb]
-- alter column[new_name]
-- varchar(255)
-- NOT NULL;
-- select *
-- from [dbo].[newdb];

-- alter table [dbo].[newdb]
-- add CONSTRAINT unique_new_name unique([new_name]);

-- SELECT new_name, COUNT(*) AS count
-- FROM [dbo].[newdb]
-- GROUP BY new_name
-- HAVING COUNT(*) > 1;


-- exec sp_rename 'dbo.newdb.new_name', 'name', 'COLUMN';


-- if not exists
--     (select *
-- from sys.tables
-- where name in ('professors', 'organizations', 'universities') and type = 'U')

-- BEGIN

--     create table professors
--     (
--         first_name VARCHAR(50),
--         lastname VARCHAR(50),
--         university_shortname VARCHAR(10)
--     );

--     create table organizations
--     (
--         organization_sector VARCHAR(50),
--         organization VARCHAR(50),
--     );

--     create table universities
--     (
--         university VARCHAR(40),
--         university_shortname VARCHAR(10),
--         university_city VARCHAR(30)
--     )
-- END

-- EXEC SP_RENAME '[DBO].[UNIVERSITIES].[UNIVERSITY_SHORTNAME]', 'ID', 'COLUMN';

--  ALTER TABLE [DBO].[UNIVERSITIES] DROP COLUMN ID;

--  ALTER TABLE [DBO].[UNIVERSITIES] 
--  ADD ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY;

-- ALTER TABLE [DBO].[UNIVERSITIES]
-- ALTER COLUMN [ID] INT;

-- ALTER TABLE [DBO].[UNIVERSITIES]
-- ADD CONSTRAINT UNIVERSITIES_PK	PRIMARY KEY ([ID]); 

IF NOT EXISTS
(
    SELECT *
    FROM sys.tables
    WHERE name IN ( 'new_table' )
          AND TYPE = 'U'
)
BEGIN
    CREATE TABLE new_table
    (
        id VARCHAR(5),
        name VARCHAR(20)
    )
END

--Cannot define PRIMARY KEY constraint on nullable column in table 'new_table'.
--We can solve it by droping the column and add new one predefined column
-- ALTER TABLE new_table
-- ALTER COLUMN id INT;

-- ALTER TABLE new_table
-- ADD CONSTRAINT new_table_primary PRIMARY KEY(id);

-- alter table new_table
-- drop COLUMN id;

-- alter table new_table
-- add id int IDENTITY(1,1) not null primary key;

-- insert into new_table(name) VALUES('Boyan')

INSERT INTO new_table
VALUES
('Boyan'),
('Pencho'),
('Stamat'),
('Boyan'),
('Stamat');



SELECT name,
       COUNT(*) AS COUNT
FROM new_table
GROUP BY name
HAVING COUNT(*) > 1;