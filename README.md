#### NRP   : 2172019
#### Nama  : Thoriq Hdayansyah

# EmmA (Employee Management)
EmmA adalah sebuah aplikasi berbasis web yang dirancang untuk mempermudah pengelolaan karyawan di dalam perusahaan. Aplikasi ini menyediakan fitur presensi, pengajuan izin, dan pengajuan cuti bagi karyawan dengan alur yang terorganisasi dan terintegrasi.

## **Set Up Repository**
- Clone repository dengan Git atau unduh zip-nya langsung dari GitHub.
```bash
git clone https://github.com/Toriq29/EmmA
cd EmmA
```

## Set Up Basis Data
1. Pastikan Anda sudah menginstal **XAMPP** atau server lokal lainnya yang memiliki **phpMyAdmin**.  
   - Jika belum, unduh XAMPP di [https://www.apachefriends.org](https://www.apachefriends.org).  
2. Jalankan **Apache** dan **MySQL** dari kontrol panel XAMPP.  
3. Buka **phpMyAdmin** melalui browser dengan mengakses `http://localhost/phpmyadmin`.  
4. Buat database baru dengan nama `tubes_db`.  
5. Import file database:  
   - Klik pada database yang telah dibuat.  
   - Pilih tab **Import**.  
   - Unggah file `tubes_db.sql`.  
   - Klik **Go** untuk memulai proses impor.  

## **Set Up Aplikasi Backend**

### **1. Pastikan Node.js Terinstal**
Jika Node.js belum terinstal, unduh dan instal dari [Node.js Official Website](https://nodejs.org/en).

### **2. Pengecekan Instalasi Node.js**
Setelah instalasi, verifikasi apakah Node.js dan npm telah terinstal dengan benar:  
```bash
node -v
npm -v
```
Jika versi Node.js dan npm muncul, maka instalasi berhasil.

### **3. Instalasi Dependencies**
1. Buka terminal atau command prompt.
2. Arahkan ke folder backend aplikasi:
```bash
cd backend
```
3. Instal semua dependencies yang diperlukan menggunakan npm:
```bash
npm install
```

### **4.  Menjalankan Aplikasi**
1. Untuk menjalankan aplikasi dalam mode pengembangan (dengan hot reload):
```bash
npm run dev
```
2. Untuk menjalankan aplikasi dalam mode produksi:
```bash
npm start
```

## **Set Up Aplikasi FrontEnd**
### **1. Instalasi Dependencies**
1. Buka terminal atau command prompt.
2. Arahkan ke folder backend aplikasi:
```bash
cd frontend
```
3. Instal semua dependencies yang diperlukan menggunakan npm:
```bash
npm install
```

### **2.  Menjalankan Aplikasi**
1. Untuk menjalankan aplikasi dalam mode pengembangan::
```bash
npm start
```
2. Aplikasi akan terbuka di browser secara otomatis. Jika tidak, Anda dapat mengaksesnya di:
```bash
http://localhost:3000
```

## **Account**
1. Admin = username : admin | password : asd12345
2. Karyawan = username : fabio |  password : asd12345
3. Supervisor = username : arthur |  password : asd12345
4. Manager = username : thoriquee |  password : asd12345
5. HRD = username : youka |  password : asd12345


 
