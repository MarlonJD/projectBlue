from rest_framework.viewsets import ModelViewSet
from rest_framework.generics import RetrieveUpdateAPIView
from .models import Sensor, Switch
from .serializers import SensorSerializer, SwitchSerializer


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
