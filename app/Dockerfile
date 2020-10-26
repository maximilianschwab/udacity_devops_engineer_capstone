FROM python:3

WORKDIR /app

COPY requirements.txt ./
COPY app.py ./
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8080/tcp

CMD [ "python", "./app.py" ]