# Terraform Azure Modular Infrastructure

This repository contains reusable and production-grade **Terraform modules** for provisioning infrastructure on **Microsoft Azure** using a **modular**, **scalable**, and **environment-based** structure.

The goal of this project is to provide a generic approach to deploy Azure resources using:
- Reusable Terraform modules
- `for_each` and `dynamic` blocks for flexibility
- Remote backend for state management
- Environment-specific configurations (Dev / QA / Prod)
- CI/CD friendly structure

---

## 📁 Repository Structure


terraform-azure-modular-infra/
├── modules/
│   ├── resource_group/
│   ├── network/
│   ├── vm_linux/
│   ├── key_vault/
│   ├── firewall/
│   └── storage_account/
└── envs/
    ├── dev/
    └── prod/
