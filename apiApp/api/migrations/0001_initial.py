# Generated by Django 3.0.6 on 2020-05-09 23:25

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Sensor',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('motor_devri', models.IntegerField()),
                ('basinc', models.IntegerField()),
                ('derinlik', models.IntegerField()),
                ('sicaklik', models.IntegerField()),
            ],
        ),
    ]
