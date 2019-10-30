FROM python:3.7

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        cmake \
        build-essential \
        gcc \
        gdb \
        g++ \
        git \
        wget

RUN pip install pandas numpy scipy scikit-learn pandas

ADD . /usr/src/
WORKDIR /usr/src/python-package

RUN python setup.py bdist_wheel --plat-name=manylinux1_x86_64 --universal
RUN pip install --user /usr/src/python-package/dist/lightgbm-2.3.1-py2.py3-none-manylinux1_x86_64.whl

RUN ulimit -c unlimited

WORKDIR /usr/src/examples/python-guide
CMD ["./runner.sh"]
