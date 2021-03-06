FROM python:alpine3.7
COPY /app /app
WORKDIR /app

RUN pip install -r requirements.txt

CMD python index.py
