```bash
# Connect ke MongoDB container dengan admin credentials
docker exec -it mongodb-iot mongosh -u admin -p password123 --authenticationDatabase admin

# Atau connect langsung tanpa kredensial admin (akan perlu authenticate manual)
docker exec -it mongodb-iot mongosh
```

```javascript
// Beralih ke database iot_db
use iot_db

// Authenticate sebagai iot_user
db.auth('iot_user', 'iot_password')

// Find all readings from spesific truck
db.sensor_readings.find({ truck_id: 'TRK001' }).sort({ timestamp: 1 }).forEach(doc => printjson(doc));
```