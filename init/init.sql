-- Gunakan database 'iot'
USE iot;

-- Buat tabel 'trucks'
CREATE TABLE trucks (
    truck_id VARCHAR(10) PRIMARY KEY,
    model VARCHAR(50),
    year INT
);

-- Buat tabel 'sensors'
CREATE TABLE sensors (
    sensor_id VARCHAR(10) PRIMARY KEY,
    truck_id VARCHAR(10),
    sensor_type VARCHAR(20),
    FOREIGN KEY (truck_id) REFERENCES trucks(truck_id)
);

-- Masukkan data awal ke tabel 'trucks'
INSERT INTO trucks (truck_id, model, year) VALUES
 ('TRK001', 'Volvo FH', 2018),
 ('TRK002', 'Mercedes Actros', 2020),
 ('TRK003', 'Scania R450', 2019);

-- Masukkan data awal ke tabel 'sensors'
INSERT INTO sensors (sensor_id, truck_id, sensor_type) VALUES
 ('SENS001', 'TRK001', 'temperature'),
 ('SENS002', 'TRK001', 'gps'),
 ('SENS003', 'TRK002', 'fuel'),
 ('SENS004', 'TRK002', 'pressure'),
 ('SENS005', 'TRK003', 'humidity');