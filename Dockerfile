FROM odoo:17

USER root

RUN apt-get update && apt-get install -y \
    git \
    libpq-dev \
    build-essential \
    libssl-dev \
    libffi-dev \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    libsasl2-dev \
    libldap2-dev \
    python3-dev \
    && pip install --upgrade pip

COPY requirements.txt /tmp/
RUN pip install -r /tmp/requirements.txt

USER odoo
