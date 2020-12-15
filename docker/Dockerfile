FROM tensorflow/tensorflow:2.4.0-jupyter
LABEL maintainer="voyagerwy130 <voyager.yoshida@gmail.com>"

ENV ROOTHOME /root

ENV WORKSPACE /var/www
WORKDIR $WORKSPACE

RUN curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python
ENV PATH $ROOTHOME/.poetry/bin:$PATH
COPY pyproject.toml $WORKSPACE
COPY poetry.lock $WORKSPACE

RUN apt-get update && apt-get install -y locales make 
RUN locale-gen ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP.UTF-8  
ENV LC_ALL ja_JP.UTF-8

# RUN pip install certifi --ignore-installed
# RUN pip install absl --ignore-installed
RUN poetry config virtualenvs.create false && \
    pip install --upgrade pip && \
    pip install -U setuptools && \
    poetry install -n

CMD ["python"]
