from rest_framework.routers import DefaultRouter
from django.urls import path

from .views import user_list

urlpatterns = [
    path('user', user_list),

]
