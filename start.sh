#!/usr/bin/env bash
python manage.py migrate
python manage.py loaddata initial_data.json
gunicorn mysite.wsgi:application --bind 0.0.0.0:$PORT
