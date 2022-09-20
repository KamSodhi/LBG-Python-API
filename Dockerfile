FROM python:latest

ARG port

COPY . .

RUN pip3 install -r "requirements.txt"

ENV PORT $port

EXPOSE $port

ENTRYPOINT ["python", "lbg.py"]