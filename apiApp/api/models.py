from django.db import models


class Sensor(models.Model):
    motor_devri = models.IntegerField()
    basinc = models.IntegerField()
    derinlik = models.IntegerField()
    sicaklik = models.IntegerField()
