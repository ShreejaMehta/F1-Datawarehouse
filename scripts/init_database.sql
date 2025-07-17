/*
=============================================================
Create Database and Schemas - PostgreSQL Version
=============================================================
Script Purpose:
 This script creates a new database named 'datawarehouse' after checking if it already exists.
 If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas
 within the database: 'bronze', 'silver', and 'gold'.

WARNING:
 Running this script will drop the entire 'datawarehouse' database if it exists.
 All data in the database will be permanently deleted. Proceed with caution
 and ensure you have proper backups before running this script.

Usage:
 1. Connect to PostgreSQL as a superuser or user with CREATEDB privileges
 2. Run this script in psql or your preferred PostgreSQL client
 3. The script will create the database and schemas automatically
*/

SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
WHERE pg_stat_activity.datname = 'datawarehouse'
  AND pid <> pg_backend_pid();

-- Drop the database if it exists
DROP DATABASE IF EXISTS datawarehouse;

-- Create the 'datawarehouse' database
CREATE DATABASE datawarehouse
    WITH 
    OWNER = CURRENT_USER
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

-- Connect to the newly created database
\c datawarehouse

-- Create schemas
CREATE SCHEMA IF NOT EXISTS bronze;
CREATE SCHEMA IF NOT EXISTS silver;
CREATE SCHEMA IF NOT EXISTS gold;
