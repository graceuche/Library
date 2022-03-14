# Library
This is my project. The task was to create a simple library system.

```sql
CREATE TABLE IF NOT EXISTS users(
  user_id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  dob DATE NOT NULL,
  email VARCHAR(254) NOT NULL UNIQUE
);
```
