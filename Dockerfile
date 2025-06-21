FROM odoo:17

USER root

# Clean apt and install dependencies with compatible options
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
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
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN pip install --upgrade pip

# Add and install custom Python packages
COPY requirements.txt /tmp/
RUN pip install -r /tmp/requirements.txt

USER odoo
