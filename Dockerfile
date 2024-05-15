FROM python:3.9-aline

WORKDIR /code

COPY requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY . /code

EXPOSE 8000

RUN python manage.py migrate

CMD ["gunicorn", "--bind", "0.0.0.0:8000", "textutils.wsgi"]