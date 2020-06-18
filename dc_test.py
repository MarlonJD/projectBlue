import requests
import Adafruit_BMP.BMP085 as BMP085
import time

# Get Motor Degerleri
r0 = requests.get('http://127.0.0.1:8000/api/motor/2/')
get_motor = r0.json()

# Gelen cevabi degiskenlere ata
direction1 = get_motor['d1']
direction2 = get_motor['d1']
motor1 = get_motor['m1']
motor2 = get_motor['m2']
pwm = get_motor['pwm']

print(pwm)

# Post Sensor Degerleri
data = {}

sensor = BMP085.BMP085()

while True:
    data['deniz_seviyesi'] = sensor.read_sealevel_pressure()
    data['basinc'] = round(sensor.read_pressure(), 2)
    data['derinlik'] = round(sensor.read_altitude(), 2)
    data['sicaklik'] = round(sensor.read_temperature(), 2)
    print(data)
    r1 = requests.patch('http://127.0.0.1:8000/api/sensor/2/',
                        data=data)
    post_sensor = r1
    time.sleep(1)

    print(post_sensor)
