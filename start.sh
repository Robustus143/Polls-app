#!/usr/bin/env bash
set -e
echo "Migrating database..."
python manage.py migrate
echo "Loading initial data..."
python manage.py loaddata initial_data.json
echo "Starting Gunicorn..."
gunicorn mysite.wsgi:application --bind 0.0.0.0:$PORT
