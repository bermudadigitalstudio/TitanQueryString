FROM swift:3.0

COPY . /code
WORKDIR /code
CMD swift test
