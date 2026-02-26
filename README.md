# Firmware C CI/CD Pipeline Demo
**Complete CI/CD pipeline for embedded C firmware** with Jenkins + GitHub Actions. Testing, Valgrind, ARM cross-compilation and automation. Prepared for Firmware DevOps roles.

[![Jenkins CI](http://localhost:8080/job/C_Automation/badge/icon)](http://localhost:8080/job/C_Automation/) [![Valgrind](https://github.com/kelvinmagalhaes/C_Automation/actions/workflows/c_build_ultraclean.yml/badge.svg)](https://github.com/kelvinmagalhaes/C_Automation/actions/workflows/c_build_ultraclean.yml)

## 🚀 Features
- **ARM Cortex-M** cross-compilation (`gcc-arm-none-eabi`)
- Automated unit tests + I/O validation
- **Memory leak detection** (Valgrind)
- **Jenkins Pipeline** (trigger on main push/merge)
- GitHub Actions CI/CD (dual setup)
- Bash automation scripting (`run_build.sh`)

## 🛠 Quick Start
```bash
make clean
make
./run_build.sh
cat output.txt  # ✅ Check test results
