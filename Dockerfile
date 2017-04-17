FROM ubuntu:16.04

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install git make build-essential python-dev python-pip libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl
RUN git clone git://github.com/yyuu/pyenv.git ~/.pyenv
ENV HOME /root
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH
RUN pyenv install 3.5.3
RUN pyenv global 3.5.3

RUN mkdir /app
WORKDIR /app
COPY . /app
