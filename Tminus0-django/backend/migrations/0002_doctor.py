# Generated by Django 2.2.12 on 2021-03-24 06:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('backend', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='doctor',
            fields=[
                ('position', models.CharField(max_length=132)),
                ('name', models.CharField(max_length=132)),
                ('user_name', models.CharField(max_length=50, primary_key=True, serialize=False)),
                ('password', models.CharField(max_length=20)),
                ('DOB', models.DateTimeField()),
                ('experience', models.IntegerField()),
            ],
        ),
    ]
