create table users (
    id BIGSERIAL PRIMARY KEY,
    first_name VARCHAR(30),
    second_name VARCHAR(40),
    created_at TIMESTAMP DEFAULT NOW()
);
