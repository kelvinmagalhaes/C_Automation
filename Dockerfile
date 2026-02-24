FROM ubuntu:22.04
RUN apt-get update && apt-get install -y \
    gcc make valgrind git curl gcc-arm-none-eabi \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /workspace
COPY . .
RUN chmod +x run_build.sh
CMD ["./run_build.sh"]
