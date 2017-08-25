#!/usr/bin/env bash

until cd src
do
    echo "Waiting for django volume..."
done

until python manage.py migrate --settings=djangoreactredux.settings.prod
do
    echo "Waiting for postgres ready..."
    sleep 2
done

python manage.py loaddata fixtures.json --settings=djangoreactredux.settings.prod
python manage.py runserver 0.0.0.0:8000 --settings=djangoreactredux.settings.prod
