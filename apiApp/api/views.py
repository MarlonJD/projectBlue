from rest_framework.viewsets import ModelViewSet
from .models import Sensor
from .serializers import SensorSerializer


class SensorViewSet(ModelViewSet):
    """
    List genres from Rest API
    """
    model = Sensor
    serializer_class = SensorSerializer
    queryset = Sensor.objects.all()
