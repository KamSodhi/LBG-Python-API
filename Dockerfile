FROM python:latest

#ARG port

COPY . .

RUN pip3 install -r "requirements.txt"

#ENV PORT $port

EXPOSE 8080
#$port

ENTRYPOINT ["python", "lbg.py"]