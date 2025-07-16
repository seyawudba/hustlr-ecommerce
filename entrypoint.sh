#!/bin/sh
set -e

if [ "$DEV" = "true" ]; then
  echo "Running in development mode: applying makemigrations"
  python3 manage.py makemigrations
fi

echo "Running migrations"
python3 manage.py migrate

echo "Starting server"
python3 manage.py runserver 0.0.0.0:8000
