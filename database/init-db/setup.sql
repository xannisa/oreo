-- Create Read-Only User
CREATE USER readonly_user WITH PASSWORD 'readonly_pass';
GRANT CONNECT ON DATABASE sre TO readonly_user;
GRANT USAGE ON SCHEMA public TO readonly_user;

-- Simple Table for testing
CREATE TABLE client (
    id SERIAL PRIMARY KEY,
    client_id VARCHAR(50) NOT NULL,
    affiliates INT DEFAULT 0
);

-- Index to prevent the CPU spikes we discussed
CREATE INDEX idx_client_id ON client(client_id);

-- Grant select to the read-only user
GRANT SELECT ON ALL TABLES IN SCHEMA public TO readonly_user;