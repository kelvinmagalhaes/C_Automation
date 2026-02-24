FROM ubuntu:22.04
RUN apt-get update && apt-get install -y \
    gcc make valgrind git curl \
    gcc-arm-none-eabi \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /workspace
# Copy arquivos CRÍTICOS só (evita .git 188MB)
COPY challenge.c Makefile run_build.sh input.txt test1_expected.txt ./
RUN chmod +x run_build.sh
CMD ["make", "test"]