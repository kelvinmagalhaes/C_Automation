# Firmware C CI/CD Pipeline Demo
Complete CI/CD pipeline for embedded C firmware with testing, Valgrind analysis, and automation. Prepared for Firmware DevOps roles.

[![CI Status](https://github.com/kelvinmagalhaes/C_Automation/actions/workflows/ci.yml/badge.svg)](https://github.com/kelvinmagalhaes/C_Automation/actions/workflows/ci.yml)
[![Valgrind](https://github.com/kelvinmagalhaes/C_Automation/actions/workflows/c_build_ultraclean.yml/badge.svg)](https://github.com/kelvinmagalhaes/C_Automation/actions/workflows/c_build_ultraclean.yml)

## Features
- ARM Cortex-M cross-compilation (gcc-arm-none-eabi)  
- Automated unit tests + input/output validation
- Memory leak detection (Valgrind)
- Full GitHub Actions CI/CD pipeline
- Bash automation scripting (run_build.sh)

## Quick Start
```bash
make clean
make
./run_build.sh
cat output.txt  # Check test results
