from rest_framework import serializers
from .models import User


class UserSerializer(serializers.ModelSerializer):
    name = serializers.CharField(required=True, max_length=100)
    age = serializers.IntegerField(required=False)

    class Meta:
        model = User
        fields = ("id", "name", "age")
