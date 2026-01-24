# 📘 SQL Server Basic Commands (Syntax Notes)

This document contains **essential SQL Server syntax** for **database management**,  
**table operations (DDL)**, and **data manipulation (DML)**.

Use this as a **quick-reference cheat sheet** while practicing SQL Server.

---

## 🔹 Database Management

### Create a Database
```sql
CREATE DATABASE Database_Name;
```
## Delete a Database
Simple delete:
```sql
DROP DATABASE Database_Name;
```
Safe delete (check existence first):
```sql
IF EXISTS (
    SELECT name 
    FROM sys.databases 
    WHERE name = 'Database_Name'
)
BEGIN
    DROP DATABASE Database_Name;
END;
```
Use a Database
```sql
USE Database_Name;
```
## 🔹 Table Management (DDL – Data Definition Language)
Create a Table

```sql
CREATE TABLE Table_Name (
    COL1 INT PRIMARY KEY,
    COL2 VARCHAR(50),
    COL3 VARCHAR(50),
    COL4 DECIMAL(10,2),
    COL5 VARCHAR(100),
    COL6 DATETIME
);
```
## Alter a Table
Add a new column:
```sql
ALTER TABLE Table_Name 
ADD COL7 VARCHAR(100);
```
Modify column data type:
```sql
ALTER TABLE Table_Name 
ALTER COLUMN COL4 BIGINT;
```
Rename a column:
```sql
EXEC sp_rename 'Table_Name.COL5', 'NEW_COL5', 'COLUMN';
```
Change column size:
```sql
ALTER TABLE Table_Name 
ALTER COLUMN COL2 VARCHAR(200);
Drop a Table (Remove table completely)
```
```sql
DROP TABLE Table_Name;
🔹 Data Manipulation (DML)
```
Insert Data
```sql
INSERT INTO Table_Name (COL1, COL2, COL3, COL4, COL5, COL6)
VALUES (1, 'Value1', 'Value2', 50000, 'Dept', GETDATE());
```
## Select Data
All columns:
```sql
SELECT * FROM Table_Name;
Specific columns with WHERE:
```
```sql
SELECT COL1, COL2 
FROM Table_Name 
WHERE COL5 = 'Dept';
```
Update Data
```sql
UPDATE Table_Name
SET COL4 = 60000
WHERE COL1 = 1;
```
## Delete Data
Delete all rows:
```sql
DELETE FROM Table_Name;
Delete specific rows:
```
```sql
DELETE FROM Table_Name
WHERE COL5 = 'HR';
```
Truncate Table (Fast delete)
```sql
TRUNCATE TABLE Table_Name;
```

## ⚖️ DELETE vs TRUNCATE
Feature	DELETE	TRUNCATE
WHERE clause	✅ Yes	❌ No
Row-by-row delete	✅ Yes	❌ No
Speed	Slower	Faster
Identity reset	❌ No	✅ Yes
Transaction log	More logging	Minimal logging
Rollback	✅ Possible	❌ Not possible
🔹 Constraints (Basic)

```sql
-- Primary Key
COL1 INT PRIMARY KEY

-- Unique
COL2 VARCHAR(50) UNIQUE

-- Not Null
COL3 VARCHAR(50) NOT NULL

-- Default
COL4 INT DEFAULT 0
```
## 🔹 Index (Basic)
Create Index:

```sql
CREATE INDEX IDX_COL2
ON Table_Name (COL2);
```
Drop Index:

```sql
DROP INDEX IDX_COL2 ON Table_Name;
```
## 🔹 Useful System Queries
Show All Databases:

```sql
SELECT name FROM sys.databases;
Show All Tables:
```
```sql
SELECT name FROM sys.tables;
```
Describe Table Structure:

```sql
EXEC sp_help 'Table_Name';
```
### 📝 Notes
This document focuses on syntax learning, not real schema design.
Replace Database_Name, Table_Name, and column names as needed.
Practice regularly to build strong SQL fundamentals.
Last updated: January 2026

***

**Copy the code block above, save it as `SQL-Server-Commands.md`, and you'll have a perfectly formatted, downloadable Markdown file!**