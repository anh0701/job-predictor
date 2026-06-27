CREATE DATABASE job;

CREATE TABLE company (
    id SERIAL NOT NULL PRIMARY KEY,
    name_company VARCHAR(255),
    address_company VARCHAR(255)
); 

-- CREATE TABLE type_job (
--     id SERIAL NOT NULL PRIMARY KEY,
--     name_type VARCHAR(255)
-- );

CREATE TABLE job (
    id SERIAL NOT NULL PRIMARY KEY,
    name_job VARCHAR(255),
    -- id_type INT
);

CREATE TABLE company_job (
    id_company INT,
    id_job INT
)

INSERT INTO company (name_company, address_company) VALUES 
    ("CÔNG TY TNHH H&T INTELLIGENT CONTROL", "Hai Phong"),
    ("USI", "Hai Phong")

INSERT INTO job (name_job) VALUES
    ("ME"), ("TE"), ("SMT"), ("DIP"), ("FA"),
    ("PE"), ("IE"), ("IQC"), ("IPQC"), ("OBA"),
    ("PQE"), ("CQE")

INSERT INTO company_job (id_company, id_job) VALUES
    (1,1), (1,2), (1,3), (1,4), (1,5), (1,6), (1,7), (1,8), (1,9), (1,10), (1,11), (1,12)