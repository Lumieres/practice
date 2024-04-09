FROM python:3.9.0

WORKDIR /home/

RUN echo "testing123"

RUN git clone https://github.com/Lumieres/practice.git

WORKDIR /home/practice/

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

EXPOSE 8000

CMD ["bash", "-c", "python manage.py collectstatic --noinput --settings=practice.settings.deploy && python manage.py migrate --settings=practice.settings.deploy && gunicorn practice.wsgi --env DJANGO_SETTINGS_MODULE=practice.settings.deploy --bind 0.0.0.0:8000"]