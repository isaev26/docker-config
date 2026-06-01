FROM composer:latest

WORKDIR /var/www/laravel

# Ensure system CA certificates and common utilities are installed to avoid TLS errors
USER root
RUN if command -v apt-get >/dev/null 2>&1; then \
      apt-get update && apt-get install -y --no-install-recommends \
        ca-certificates \
        openssl \
        curl \
        git \
        unzip \
        zip \
      && rm -rf /var/lib/apt/lists/*; \
    elif command -v apk >/dev/null 2>&1; then \
      apk add --no-cache \
        ca-certificates \
        openssl \
        curl \
        git \
        unzip \
        zip; \
    fi

ENTRYPOINT ["composer", "--ignore-platform-reqs"]