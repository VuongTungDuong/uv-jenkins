# Base image
FROM python:3.11-slim

# Set work directory
WORKDIR /app


# The installer requires curl (and certificates) to download the release archive
RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates

# Download the latest installer
ADD https://astral.sh/uv/install.sh /uv-installer.sh

# Run the installer then remove it
RUN sh /uv-installer.sh && rm /uv-installer.sh

# Ensure the installed binary is on the `PATH`
ENV PATH="/root/.local/bin/:$PATH"


# Copy project files

COPY . .
COPY uv.lock uv.lock



# Sync the project
RUN uv sync --locked


# Expose port (tuỳ theo ứng dụng của bạn)
EXPOSE 5050


# CMD [".venv/bin/python", "app.py"]
CMD ["uv", "run", "app.py"]
# CMD ["tail","-f" ,"/dev/null"]
