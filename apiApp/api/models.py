from django.db import models


class Sensor(models.Model):
    deniz_seviyesi = models.DecimalField(max_digits=10, decimal_places=2)
    basinc = models.DecimalField(max_digits=10, decimal_places=2)
    derinlik = models.DecimalField(max_digits=10, decimal_places=2)
    sicaklik = models.DecimalField(max_digits=10, decimal_places=2)


class Switch(models.Model):
    lights = models.BooleanField()
    uMotor = models.BooleanField()
    aMotor = models.BooleanField()


class Motor(models.Model):
    d1 = models.BooleanField(default=False)
    d2 = models.BooleanField(default=False)
    m1 = models.BooleanField(default=False)
    m2 = models.BooleanField(default=False)
    pwm = models.IntegerField()
