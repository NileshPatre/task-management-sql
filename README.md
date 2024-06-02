# task-management-sql
  1. This is a sql dump file.
# Prerequisites
  1. Install Postgres version 16
# Please follow the below commands to restore the dump.
   1. Create database with name "task_management"
      command - CREATE DATABASE task_management;
  2. Grant privileges
     command - GRANT ALL PRIVILEGES ON DATABASE task_management TO user;
  3. Dump the task_management.sql file in the database.
     command – psql task_management < task_management.sql
