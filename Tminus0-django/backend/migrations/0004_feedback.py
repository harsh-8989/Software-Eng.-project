# Generated by Django 2.2.16 on 2021-04-05 18:01

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('backend', '0003_auto_20210324_0914'),
    ]

    operations = [
        migrations.CreateModel(
            name='feedback',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fname', models.CharField(max_length=132)),
                ('lname', models.CharField(max_length=132)),
                ('feedback', models.TextField()),
            ],
        ),
    ]
