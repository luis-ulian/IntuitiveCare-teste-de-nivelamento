from django.urls import path
from .views import get_empresas

urlpatterns = [
    path('empresas/', get_empresas, name="get_empresas")
]