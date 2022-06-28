FROM python:3

RUN adduser user

WORKDIR /app

COPY requirements.txt ./requirements.txt
RUN pip install --user --no-cache-dir -r requirements.txt

COPY --chown=user . ./
