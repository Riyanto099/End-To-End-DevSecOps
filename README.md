## 🔐 Secrets Management & Security Architecture (HashiCorp Vault)

Dalam proyek **End-to-End DevSecOps** ini, manajemen rahasia (*secrets management*) dirancang menggunakan **HashiCorp Vault** untuk menghindari *hardcoded credentials* di dalam *source code* maupun *Docker image*.

### Alur Kerja Keamanan Secrets:
1. **Penyimpanan Terpusat:** Konfigurasi sensitif (seperti kredensial database, *API tokens*, dan *encryption keys*) disimpan secara aman di dalam HashiCorp Vault.
2. **Dynamic Secrets / Token Injection:** Saat aplikasi dijalankan melalui **Docker Compose** atau di *cloud*, aplikasi mengambil secrets secara dinamis menggunakan *Vault Token* atau *AppRole authentication*.
3. **Infrastruktur sebagai Kode (IaC) yang Aman:** Terraform berkomunikasi dengan Vault untuk mengambil parameter sensitif yang dibutuhkan saat melakukan *provisioning* infrastruktur AWS.

### Simulasi Lokal dengan Vault (Development Mode)
Untuk menjalankan HashiCorp Vault secara lokal bersama aplikasi menggunakan Docker Compose:
```yaml
# Contoh integrasi service vault di docker-compose.yml
services:
  vault:
    image: hashicorp/vault:latest
    container_name: vault_dev
    ports:
      - "8200:8200"
    environment:
      - VAULT_DEV_ROOT_TOKEN_ID=myroottoken
      - VAULT_DEV_LISTEN_ADDRESS=0.0.0.0:8200
    cap_add:
      - IPC_LOCK
