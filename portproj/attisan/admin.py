from django.contrib import admin
from .models import State, City, Client, Project, Artisan, Ratings
# Register your models here.


admin.site.register(State)
admin.site.register(City)
admin.site.register(Client)
admin.site.register(Project)
admin.site.register(Artisan)
admin.site.register(Ratings)
