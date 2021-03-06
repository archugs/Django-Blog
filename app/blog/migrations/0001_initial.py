# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2016-07-14 03:57
from __future__ import unicode_literals

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Blog',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=100, unique=True)),
                ('author', models.CharField(db_index=True, max_length=100)),
                ('publication_date', models.DateField(db_index=True, default=datetime.date(2016, 7, 14))),
                ('category', models.CharField(max_length=100)),
                ('image', models.CharField(max_length=100)),
                ('optional_image', models.CharField(max_length=100)),
                ('body', models.TextField()),
                ('slug', models.SlugField(unique=True)),
            ],
        ),
    ]
