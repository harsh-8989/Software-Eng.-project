from django.db import models

# Create your models here.
class developer(models.Model):
    id = models.IntegerField(primary_key = True)
    name = models.CharField(max_length=132)
    user_name= models.CharField(max_length=132)
    password=models.CharField(max_length=132)
class doctor(models.Model):
    position=models.CharField(max_length=132)
    name = models.CharField(max_length=132)
    user_name=models.CharField(max_length=50,primary_key=True)
    password= models.CharField(max_length=20)
    age=models.IntegerField()
    experience=models.IntegerField()
    def __str__(self):
        return self.user_name