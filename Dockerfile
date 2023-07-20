# Whic python version to use
FROM python:3.8-slim-buster

RUN apt update -y && apt install awscli -y

# creating a working directory and copying all the source code file in it.
WORKDIR /app

COPY . /app

RUN pip install -r requirements.txt
RUN pip install --upgrade accelerate
RUN pip uninstall -y transformers accelerate
RUN pip install transformers accelerate

CMD ["python3", "app.py"]