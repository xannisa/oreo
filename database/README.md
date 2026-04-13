# 📦 PostgreSQL Deployment & Optimization
• Configuration :
◦ Edit your previous Docker Compose file to run PostgreSQL 16 and map the PostgreSQL
port to your host
◦ Create 2 users for PostgreSQL: 1 for read-only and the other is full access
◦ Create a database named sre with a full access user
◦ Increase PostgreSQL max connection from the config file
◦ Check PostgreSQL max connection from query
• Case scenario :
◦ The back office team needed to check how many affiliates our client had. But the data is
so slow to show. We trace it with the developer team and have some clues :
▪ Our database CPU usage spikes during that time
▪ Our dashboard resource is normal (there's no spikes in every aspects)
▪ In the back end, API will query to the database with this query :

```bash
select count(affiliates) from client where client_id =
'this_is_client_id';
```
Please analyze and describe how you resolve this issue

## 📄📄📄 Answer
### 🔍 The Root Cause Analysis
While the query looks simple, SELECT COUNT(column) FROM table behaves differently than you might expect, especially as data grows:

1. Null Checking: When use `COUNT(affiliates)`, the database must check every single row to see if the affiliates column is NULL. If it is, it doesn't count it. This forces a full scan of that data.

2. Sequential Scanning: If there is no Index on `client_id`, the database has to read every single row in the entire table just to find the ones belonging to that specific client.

3. Table Size: If the client table has hundreds of thousands or millions of rows, doing this check repeatedly for back-office requests will saturate the CPU.

### 🛠️ Recommended Solutions
1. Optimize the Query Syntax

Unless you specifically need to exclude rows where affiliates is `NULL`, use `COUNT(*)` or `COUNT(1)`. These are often more highly optimized by modern database engines.

``` bash
SELECT COUNT(*) FROM client WHERE client_id = 'this_is_client_id';
```
2. Add an Index (The "Silver Bullet")

If it hasn't already, ensure there is an index on the `client_id` column. Without an index, the database performs a Full Table Scan. With an index, it performs an Index Seek, which is nearly instantaneous.

``` bash
CREATE INDEX idx_client_id ON client(client_id);
```
3. Review Table Architecture

If affiliates is actually a JSON column or a large string containing a list of `IDs` (rather than individual rows in a relational table), the database has to "unpack" that data for every row to count it.
Solution is if one client has many affiliates, these should ideally be in a separate affiliates table with a `client_id` foreign key.

4. Use a Counter Cache

If the back office checks this frequently and the count doesn't change every second, don't calculate it live.

Add a `total_affiliates` column to main clients table.

Update this number only when an affiliate is added or removed.

The query then becomes a simple `SELECT`, which uses almost zero CPU.

### 💡 Next Step for the Devs
Ask the developer team to run an `EXPLAIN ANALYZE` on the query:

``` bash
EXPLAIN ANALYZE SELECT COUNT(affiliates) FROM client WHERE client_id = 'this_is_client_id';
```
This will show exactly how many rows are being scanned and whether the database is using an index or just brute-forcing the entire table.

## 📁 Project Structure

database/
├────init-db/
    ├── setup.sql
├── docker-compose.yaml

## 📖 Description

This project focuses on the deployment and performance optimization of a **PostgreSQL 16** database environment, specifically tailored for High-Concurrency and Site Reliability Engineering (SRE) standards. The system is designed to handle a production-level load by increasing the `max_connections` limit to 500 via the configuration file, ensuring the database remains responsive during traffic surges. It features a secure, dual-user access model comprising an **Admin** user with full ownership of the `sre` database and a *Read-Only* user dedicated to back-office queries. By mapping the internal PostgreSQL port to the host, the setup facilitates seamless external management while maintaining high security through distinct role permissions.

The repository also provides a direct solution for a real-world performance bottleneck where high CPU spikes were observed during client affiliate lookups. By identifying that slow `COUNT` queries were exhausting system resources, this configuration implements optimized B-tree indexing on the `client_id` column to drastically reduce query latency and CPU overhead. Orchestrated via **Docker Compose** for local reliability and **Ansible** for automated remote deployment, this setup ensures that infrastructure changes are consistent, reproducible, and performance-tuned from the moment the container is initialized.

## 🧱 Run Database Task

### Start Docker compose 

Start the PostgreSQL service using docker compose
``` bash
docker-compose up -d

# Verify initialization and max connections
docker exec -it postgres-db psql -U admin_user -d sre -c "SHOW max_connections;"
```
Check the tables created inside
``` bash
docker exec -it postgres-db psql -U admin_user -d sre
```

then, execute this :
``` bash
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public';
```

### Destroy Docker compose 

To remove container running :
``` bash
docker-compose down
```