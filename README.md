# Library
This is my project. The task was to create a simple library system.

Structured Query Language (SQL)is a computer language for storing, manipulating, and retrieving data stored in a relational database.


Databases are used for storing, maintaining, and accessing any sort of data.

Data about people, places, or things are collected, aggregated and stored in form of records or files in databases for analysis, information, and decision makings.

SQL consists of several sublanguages namely;

-----Data Definition Language (DDL) - is used by engineers and software developers to create and/or modify database objects such as tables

-----Data Manipulation Language (DML)

```sql
CREATE TABLE IF NOT EXISTS users(
  user_id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  dob DATE NOT NULL,
  email VARCHAR(254) NOT NULL UNIQUE
);
```
