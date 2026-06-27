-- DROP DATABASE IF EXISTS job;
CREATE DATABASE job;

CREATE TABLE industrial_park (
    id SERIAL PRIMARY KEY,

    code VARCHAR(50) UNIQUE,
    name VARCHAR(255) NOT NULL,

    province VARCHAR(100),
    district VARCHAR(100),
    address TEXT,

    latitude DECIMAL(10,7),
    longitude DECIMAL(10,7)
);

CREATE TABLE company (
    id SERIAL PRIMARY KEY,

    industrial_park_id INT,

    name VARCHAR(255) NOT NULL,
    address TEXT,

    website VARCHAR(255),

    latitude DECIMAL(10,7),
    longitude DECIMAL(10,7),

    CONSTRAINT fk_company_industrial_park
        FOREIGN KEY (industrial_park_id)
        REFERENCES industrial_park(id)
);

CREATE TABLE job_position (
    id SERIAL PRIMARY KEY,

    code VARCHAR(30) UNIQUE,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE company_job (
    company_id INT NOT NULL,
    job_position_id INT NOT NULL,

    PRIMARY KEY (
        company_id,
        job_position_id
    ),

    CONSTRAINT fk_company_job_company
        FOREIGN KEY (company_id)
        REFERENCES company(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_company_job_position
        FOREIGN KEY (job_position_id)
        REFERENCES job_position(id)
        ON DELETE CASCADE
);

CREATE TABLE bus_route (
    id SERIAL PRIMARY KEY,

    route_no VARCHAR(20) UNIQUE,
    route_name VARCHAR(255),

    start_point VARCHAR(255),
    end_point VARCHAR(255),

    operator VARCHAR(255),

    fare NUMERIC(10,2),

    operating_time VARCHAR(100),
    interval_minutes INT
);

CREATE TABLE bus_stop (
    id SERIAL PRIMARY KEY,

    stop_name VARCHAR(255) NOT NULL,

    address TEXT,

    latitude DECIMAL(10,7),
    longitude DECIMAL(10,7)
);

CREATE TABLE route_stop (
    route_id INT NOT NULL,
    stop_id INT NOT NULL,

    stop_order INT NOT NULL,

    PRIMARY KEY (
        route_id,
        stop_order
    ),

    CONSTRAINT fk_route_stop_route
        FOREIGN KEY (route_id)
        REFERENCES bus_route(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_route_stop_stop
        FOREIGN KEY (stop_id)
        REFERENCES bus_stop(id)
        ON DELETE CASCADE
);

CREATE TABLE industrial_park_bus_route (
    industrial_park_id INT NOT NULL,
    bus_route_id INT NOT NULL,

    nearest_stop_id INT,

    walking_distance_m INT,

    note TEXT,

    PRIMARY KEY (
        industrial_park_id,
        bus_route_id
    ),

    CONSTRAINT fk_ip_bus_ip
        FOREIGN KEY (industrial_park_id)
        REFERENCES industrial_park(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_ip_bus_route
        FOREIGN KEY (bus_route_id)
        REFERENCES bus_route(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_ip_bus_stop
        FOREIGN KEY (nearest_stop_id)
        REFERENCES bus_stop(id)
);

INSERT INTO industrial_park
    (code, name, province, district, address)
VALUES
    ('VSIP', 'VSIP Hải Phòng', 'Hải Phòng', 'Thủy Nguyên', 'KCN VSIP'),
    ('TD', 'Tràng Duệ', 'Hải Phòng', 'An Dương', 'KCN Tràng Duệ');

INSERT INTO company
    (name, industrial_park_id, address)
VALUES
    ('USI', 1, 'VSIP Hải Phòng'),
    ('CÔNG TY TNHH H&T INTELLIGENT CONTROL', 2, 'Tràng Duệ');

INSERT INTO job_position(code, name)
VALUES
    ('ME','Mechanical Engineer'),
    ('TE','Test Engineer'),
    ('SMT','SMT Engineer'),
    ('DIP','DIP Engineer'),
    ('FA','Failure Analysis'),
    ('PE','Process Engineer'),
    ('IE','Industrial Engineer'),
    ('IQC','Incoming Quality Control'),
    ('IPQC','In Process Quality Control'),
    ('OBA','Outgoing Quality Assurance'),
    ('PQE','Product Quality Engineer'),
    ('CQE','Customer Quality Engineer');

INSERT INTO company_job (company_id, job_position_id)
    SELECT 1, id FROM job_position;

INSERT INTO bus_route
    (route_no, route_name, start_point, end_point, operator, fare, operating_time, interval_minutes)
VALUES
    ('03','Thượng Lý - Tràng Duệ','Bến xe Thượng Lý',
    'KCN Tràng Duệ','Hải Phòng Bus',8000,'05:30-19:30',20),
    ('15','Thượng Lý - VSIP','Bến xe Thượng Lý','VSIP',
    'Hải Phòng Bus',8000,'05:30-19:00',25);

INSERT INTO bus_stop
    (stop_name)
VALUES
    ('Bến xe Thượng Lý'),
    ('VSIP Gate A'),
    ('Tràng Duệ Gate 1');

INSERT INTO route_stop
    (route_id, stop_id, stop_order)
VALUES
    (1,1,1),
    (1,3,2),
    (2,1,1),
    (2,2,2);

INSERT INTO industrial_park_bus_route
    (industrial_park_id,bus_route_id,nearest_stop_id,walking_distance_m,note)
VALUES
    (1,2,2,150,'Đi bộ khoảng 2 phút'),
    (2,1,3,80,'Trạm ngay cổng KCN');

-- 