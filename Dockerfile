FROM python:3.9

WORKDIR /app
# Tes koneksi jaringan
RUN apt-get update && apt-get install -y iputils-ping dnsutils || apk add --no-cache iputils dnsutils
RUN ping -c 3 google.com
RUN nslookup pypi.org
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "app.py"]
