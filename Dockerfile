# pull official base image
FROM python:3.12-alpine

# set work directory
WORKDIR /app

# install psycopg2 dependencies
RUN apk update \
   && apk add postgresql-dev gcc musl-dev jpeg-dev zlib-dev

# install python dependencies
COPY requirements.txt /app/requirements.txt
RUN pip install --upgrade pip
RUN pip install -U setuptools
RUN pip install --no-cache-dir -r requirements.txt


# copy project
COPY . .