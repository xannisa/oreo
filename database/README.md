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
