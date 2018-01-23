FROM centos

RUN yum -y update
RUN yum -y install gcc git curl make zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl openssl-devel sudo wget epel-release tk-devel

RUN echo 'pyuser ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN useradd -m pyuser
WORKDIR /home/pyuser
USER pyuser

RUN git clone git://github.com/yyuu/pyenv.git .pyenv

ENV HOME  /home/pyuser
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

RUN pyenv install 3.5.4
RUN pyenv global 3.5.4
RUN pyenv rehash

RUN pip install tensorflow keras pandas tflearn cvxopt matplotlib h5py seaborn
