# Netflix Content & Market Analysis

Proyek ini berfokus pada proses end-to-end *Data Wrangling* menggunakan **MySQL** untuk membersihkan, mentransformasikan, dan mengoptimalkan dataset mentah Netflix, diikuti dengan pembangunan *Executive Dashboard* interaktif menggunakan **Google Looker Studio**.

---

## 📌 Business Understanding

### Latar Belakang
Dataset Netflix memiliki potensi besar untuk mengungkap tren hiburan global. Namun, data mentah sering kali kotor, memiliki format tanggal yang tidak seragam, nilai kosong (*missing values*) yang tinggi, serta data lokasi yang menggabungkan banyak negara dalam satu baris.

### Tujuan Proyek
* **Optimasi Kueri:** Melakukan migrasi dan pembersihan data (*data cleaning*) menggunakan MySQL untuk meningkatkan efisiensi kueri database.
* **Penanganan Data Kosong:** Menangani *missing values* secara logis pada kolom kritis seperti `director`, `cast`, `country`, dan `duration`.
* **Analisis Data-Driven:** Menyajikan *dashboard* eksekutif yang bersih dan interaktif di Google Looker Studio untuk memetakan distribusi konten, tren rilis tahunan, serta analisis genre demi mendukung pengambilan keputusan bisnis.

---

## 📊 Result Summary of The Project

* **Tipe Konten:** Katalog Netflix secara signifikan didominasi oleh **Movie sebesar 69.7%** (sekitar 6.131 konten), sementara **TV Show mencakup 30.3%** sisanya (sekitar 2.666 konten).
* **Top Director:** Setelah data kosong dibersihkan, **Rajiv Chilaka** teridentifikasi sebagai sutradara paling produktif di platform Netflix dengan rekor kontribusi sebanyak **19 konten** (didominasi oleh seri animasi).
* **Distribusi Pasar Global:** Berdasarkan pembersihan kolom lokasi geografis, **United States** menempati posisi pertama sebagai produsen konten terbanyak dengan **3.240 konten**, disusul oleh **India** di posisi kedua dengan **1.064 konten**.
* **Lonjakan Penambahan Konten:** Volume penambahan konten ke platform mengalami kenaikan masif. Pada tahun 2017, jumlahnya melonjak hampir 3 kali lipat menjadi 1.188 konten, dan mencapai titik puncaknya pada tahun 2019 dengan rekor **2.016 konten baru dalam setahun**.

---

## ⚙️ Process

1. **Data Ingestion & Validation:** Mengimpor data ke MySQL via DBeaver dan memvalidasi total data akhir agar bersih.
2. **Data Cleaning & Correction:** Membersihkan data dari string kosong (`''`) pada kolom `director`, `cast`, `country`, dan `rating`, serta memperbaiki anomali data durasi film yang tertukar di kolom `rating`.
3. **Feature Extraction:** Mengekstrak negara utama dari kolom lokasi menggunakan kueri SQL agar visualisasi peta dunia terbaca dengan rapi dan presisi.
4. **Data Export:** Mengekspor hasil kueri final dari MySQL ke format file CSV yang bersih dan siap diolah oleh BI tools.
5. **Dashboard Building:** Membangun *dashboard* interaktif di Google Looker Studio yang dilengkapi dengan visualisasi peta (*Choropleth Map*), grafik tren waktu, grafik batang, serta filter kontrol.

---

## 💡 Key Takeaways

### What did you learn?
* Cara menangani *missing values*, mengatasi anomali kolom yang tertukar, dan membersihkan data string kosong (`''`) yang tidak terdeteksi oleh kueri `IS NULL` standar.

### What mistakes did you make?
* Melewatkan pembersihan karakter baris baru (*unquoted newlines*) saat proses *import* awal, yang menyebabkan jumlah baris membengkak menjadi 9.945 akibat teks deskripsi film terpecah.
* Melewatkan penyaringan nilai kosong seperti `Not Given` atau `Unknown Country` di awal visualisasi, sehingga grafik *Top Director* dan peta sebaran sempat bias.

### What would you do differently next time?
* Menerapkan teknik *String Splitting* yang lebih mendalam pada kolom `cast` dan `listed_in` agar bisa memvisualisasikan tren aktor terbaik serta sub-genre secara lebih spesifik.

---

## 💻 The Project
* 📄 **Dataset:** [Lihat di sini](https://www.kaggle.com/datasets/shivamb/netflix-shows)
* 📄 **SQL Script:** [Lihat di sini](netflix_content_market_analysis.sql)
* 📊 **Interactive Dashboard:** [Lihat di sini](https://datastudio.google.com/reporting/22439aeb-6b9e-4a1f-b065-6cb7b9eb5acd)

---

*Catatan: Kamu bisa menambahkan tautan/link ke file SQL kuerimu atau link visualisasi Looker Studio di bagian bawah ini jika dashboard-nya sudah dipublikasikan.*
