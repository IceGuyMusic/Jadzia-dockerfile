#### This is the Dockerfile for the Healthcheck Service for mzML Files ####
FROM openms/executables

RUN apt-get update && apt-get install -y python3-pip && python3 -m pip install flask && git

RUN git clone git@github.com:IceGuyMusic/Healthcheck_mzML .

EXPOSE 5000

CMD ["python3", "main.py"]
