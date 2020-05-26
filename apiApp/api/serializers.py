from rest_framework import serializers
from rest_framework.generics import RetrieveUpdateDestroyAPIView
from .models import Sensor, Switch


class SensorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Sensor
        fields = '__all__'


class SwitchSerializer(serializers.ModelSerializer):
    class Meta:
        model = Switch
        fields = '__all__'

    # def update(self, instance, validated_data):
    #     # Update the Foo instance
    #     instance.lights = validated_data['lights']
    #     instance.uMotor = validated_data['uMotor']
    #     instance.aMotor = validated_data['aMotor']
    #     instance.save()
    #     return instance
