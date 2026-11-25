ARG PYTHON_VERSION=3.12

# Stage 1: install dependencies
FROM python:${PYTHON_VERSION}-slim AS builder
WORKDIR /build
COPY requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

# Stage 2: small final image
FROM python:${PYTHON_VERSION}-slim
WORKDIR /app
COPY --from=builder /install /usr/local
COPY app.py .
EXPOSE 5000
CMD ["python", "app.py"]