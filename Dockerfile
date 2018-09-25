FROM python:3.7-alpine

COPY Pipfile Pipfile
COPY Pipfile.lock Pipfile.lock

RUN pip install pipenv && \
	pipenv install --system --deploy

COPY app /app
WORKDIR /app

EXPOSE 5000/tcp

CMD ["gunicorn", "-b", "0.0.0.0:5000", "-w", "4", "app:app"]
