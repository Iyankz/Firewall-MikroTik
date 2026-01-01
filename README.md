# MikroTik Firewall Configuration Guide 🛡️

Repositori ini berisi kumpulan script dan konfigurasi Firewall MikroTik yang dirancang untuk meningkatkan keamanan jaringan, dan mencegah serangan umum (DDoS, Brute Force, Port Scanning).

## 💡 Fitur Utama
* **Filter Rules:** Pemblokiran akses ilegal ke router (input) dan perlindungan trafik client (forward).
* **Raw Table:** Mitigasi serangan DDoS dengan beban CPU yang lebih rendah.
* **Address Lists:** Daftar IP untuk di blokir.

## 🚀 Cara Penggunaan

### Prasyarat
* RouterOS versi 6.45+ atau 7.x.
* Akses Winbox atau SSH ke router.

### Langkah Instalasi via Terminal
1.  Buka file `.rsc` yang ada di repositori ini.
2.  Copy script dan paste ke dalam **New Terminal** di MikroTik.


#### Contoh perintah import jika file sudah diunggah ke router
```bash
/import file-name=firewall-mikrotik.rsc
