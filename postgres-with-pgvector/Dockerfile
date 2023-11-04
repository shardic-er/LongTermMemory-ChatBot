FROM postgres:latest

# Install the pgvector extension
RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential postgresql-server-dev-all git \
    && git clone https://github.com/ankane/pgvector.git \
    && cd pgvector \
    && make \
    && make install \
    && apt-get purge -y --auto-remove build-essential postgresql-server-dev-all git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* pgvector

# Add pgvector to shared_preload_libraries for PostgreSQL
RUN echo "shared_preload_libraries = 'pgvector'" >> /usr/share/postgresql/postgresql.conf.sample
