FROM rackspacedot/python37

COPY . /app
WORKDIR /app

RUN pip3 install -r requirement.txt

EXPOSE 5000

# ENTRYPOINT ["python3"]
CMD python3 app.py