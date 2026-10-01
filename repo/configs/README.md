# Configuraciones (running-configs)

| Carpeta | Contenido |
|---|---|
| `infra1/` | ISP, SW-USERS, netplan del servidor. FortiGate A/B: ver `fortigate/` |
| `infra2/` | ISP, R1, SW1, netplan y nginx del servidor |
| `infra3/` | ISP, R-CLIENTE, netplan y nginx del servidor |
| `fortigate/` | Backups de los FortiGate (ver abajo) |

Los archivos `*-running-config.txt` son salida directa de `show running-config`.

## FortiGate: cómo exportar su configuración

Los FortiGate se configuraron por GUI, así que su configuración se exporta así:

- **GUI:** usuario `admin` → *Configuration → Backup* (guardar como `.conf`).
- **CLI:** `show full-configuration` (o `show` para solo lo modificado) y copiar la salida.

Guardar los archivos como `fortigate/infra1-FGT-A.conf`, `infra1-FGT-B.conf`, `infra2-FortiGate.conf` e `infra3-FortiGate.conf`.
