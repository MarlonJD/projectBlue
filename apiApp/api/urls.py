from rest_framework import routers
from django.urls import path, include
from . import views

router = routers.DefaultRouter()
router.register(r'sensor', views.SensorViewSet, basename='sensors')
router.register(r'switch', views.SwitchViewSet, basename='switchs')


urlpatterns = [
    path('', include(router.urls)),
]
