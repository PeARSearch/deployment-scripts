FROM debian

MAINTAINER Nandaja Varma

RUN apt-get update

RUN apt-get install -y build-essential  git python-dev python-pip wget liblapack-dev libblas-dev gfortran libxml2 libxml2-dev python-lxml

RUN git clone https://github.com/PeARSearch/PeARS.git

RUN export GIT_TRACE_PACKET=1
RUN export GIT_TRACE=1
RUN export GIT_CURL_VERBOSE=1

WORKDIR /PeARS

RUN git checkout development

RUN pip install -r requirements.txt

RUN wget http://clic.cimec.unitn.it/~aurelie.herbelot/openvectors.dump.bz2
RUN ./uncompress_db.py openvectors.dump.bz2
RUN python db_create.py

EXPOSE 5000 4000

CMD "python run.py"
