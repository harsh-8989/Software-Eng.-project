from django.contrib import admin
from backend.models import developer
from backend.models import doctor
from backend.models import feedback
# Register your models here.
admin.site.register(developer)
admin.site.register(doctor)
admin.site.register(feedback)