from django.contrib import admin
from .models import User

class UserAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'age',)
    list_per_page = 20
    search_fields = ['name']


admin.site.register(User, UserAdmin)