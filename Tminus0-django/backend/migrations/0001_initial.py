# Generated by Django 2.2.12 on 2021-03-22 07:26

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='developer',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=132)),
                ('user_name', models.CharField(max_length=132)),
                ('password', models.CharField(max_length=132)),
            ],
        ),
    ]
