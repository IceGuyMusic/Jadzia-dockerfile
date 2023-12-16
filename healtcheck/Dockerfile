#### This is the Dockerfile for the Healthcheck Service for mzML Files ####
FROM openms/executables

COPY main.py main.py

RUN apt-get update && apt-get install -y python3-pip && python3 -m pip install flask

EXPOSE 5000

CMD ["python3", "main.py"]
