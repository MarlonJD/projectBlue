from rest_framework.viewsets import ModelViewSet
from .models import Sensor, Switch, Motor
from .serializers import (SensorSerializer, SwitchSerializer,
                          MotorSerializer)


class SensorViewSet(ModelViewSet):
    """
    List genres from Rest API
    """
    model = Sensor
    serializer_class = SensorSerializer
    queryset = Sensor.objects.all()


class SwitchViewSet(ModelViewSet):
    """
    List switch from Rest API
    """
    model = Switch
    serializer_class = SwitchSerializer
    queryset = Switch.objects.all()


class MotorViewSet(ModelViewSet):
    """
    List motors from Rest API
    """
    model = Motor
    serializer_class = MotorSerializer
    queryset = Motor.objects.all()
