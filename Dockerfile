FROM python:3.12.4-alpine3.19
LABEL maintainer="seyawudba"

ENV PYTHONUNBUFFERED=1

ARG DEV=false
ENV DEV=${DEV}

WORKDIR /src/

# Install system dependencies
RUN apk add --no-cache gcc musl-dev libpq

# Create user and group
RUN addgroup -g 1000 e-commerce && \
    adduser \
        --disabled-password \
        --no-create-home \
        --uid 1000 \
        -G e-commerce \
        product

# Copy project files and entrypoint script with correct ownership
COPY --chown=product:e-commerce . .
COPY --chown=product:e-commerce entrypoint.sh /entrypoint.sh

# Install Python dependencies
RUN pip install --upgrade pip && \
    pip install psycopg2-binary && \
    pip install -r requirements.txt && \
    if [ "$DEV" = "true" ]; then \
        pip install -r requirements-dev.txt; \
    fi

EXPOSE 8000

USER product

RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
