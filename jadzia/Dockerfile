FROM python:3.11.8-slim-bookworm

WORKDIR /app

RUN apt-get update && apt-get install -y \
    git \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*


RUN git clone https://github.com/IceGuyMusic/ProjectJadzia.git .

RUN pip install -r requirements.txt

ENV PYTHONUNBUFFERED=1
ENV FLASK_APP=Jadzia.py

EXPOSE 5000

CMD ["flask", "run", "--host=0.0.0.0"]

