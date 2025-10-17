// menghubungkan ke database iot_db
db = db.getSiblingDB('iot_db');

// membuat user untuk aplikasi
db.createUser({
  user: 'iot_user',
  pwd: 'iot_password',
  roles: [
    {
      role: 'readWrite',
      db: 'iot_db'
    }
  ]
});

// membuat collection untuk data bacaan sensor
db.createCollection('sensor_readings');

// membuat collection untuk truk
db.createCollection('trucks');

// membuat collection untuk sensor
db.createCollection('sensors');

// memasukkan data contoh ke dalam collection trucks
db.trucks.insertMany([
    { truck_id: "TRK001", model: "Volvo FH", year: 2018 },
    { truck_id: "TRK002", model: "Mercedes Actros", year: 2020 },
    { truck_id: "TRK003", model: "Scania R450", year: 2019 }
]);

// memasukkan data contoh ke dalam collection sensors
db.sensors.insertMany([
    { sensor_id: "SENS001", truck_id: "TRK001", sensor_type: "temperature" },
    { sensor_id: "SENS002", truck_id: "TRK001", sensor_type: "gps" },
    { sensor_id: "SENS003", truck_id: "TRK002", sensor_type: "fuel" },
    { sensor_id: "SENS004", truck_id: "TRK002", sensor_type: "pressure" },
    { sensor_id: "SENS005", truck_id: "TRK003", sensor_type: "humidity" }
]);

// memasukkan data contoh ke dalam collection sensor_readings
db.sensor_readings.insertOne({
  "sensor_id": "SENS001",
  "truck_id": "TRK001",
  "timestamp": ISODate(),
  "readings": {
    "temperature": 25.5,
    "humidity": 67.2
  }
});

print("Database iot_db initialized with user, collections, and sample data.");