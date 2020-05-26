from django.db import models


class Sensor(models.Model):
    motor_devri = models.IntegerField()
    basinc = models.IntegerField()
    derinlik = models.IntegerField()
    sicaklik = models.IntegerField()


class Switch(models.Model):
    lights = models.BooleanField()
    uMotor = models.BooleanField()
    aMotor = models.BooleanField()
