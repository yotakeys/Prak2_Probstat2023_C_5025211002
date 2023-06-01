# Prak2_Probstat2023_C_5025211002

### Identitas

    Nama: Keyisa Raihan Illah Setiadi
    NRP: 5025211002
    Kelas: Probabilitas dan Statistik (C)

### No 1
Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas 𝐴 terhadap
kadar saturasi oksigen pada manusia. Peneliti tersebut mengambil sampel
sebanyak 9 responden. Pertama, sebelum melakukan aktivitas 𝐴, peneliti mencatat
kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut
diminta melakukan aktivitas 𝐴. Setelah 15 menit, peneliti tersebut mencatat
kembali kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9
responden mengenai kadar saturasi oksigen sebelum dan sesudah melakukan
aktivitas.
<img width="144" alt="image" src="https://github.com/yotakeys/Prak2_Probstat2023_C_5025211002/assets/85614845/8abec140-a510-4b69-b80d-8c99739f7a0a">

Berdasarkan data pada tabel diatas, diketahui kadar saturasi oksigen dari
responden ke-3 ketika belum melakukan aktivitas 𝐴 sebanyak 67, dan setelah
melakukan aktivitas 𝐴 sebanyak 70.

#### 1 A.
Carilah Standar deviasi dari data selisih pasangan pengamatan tabel diatas

##### Penyelesaian : 
Kita perlu menyimpan tabel data percobaan tersebut ke variabel X dan Y, lalu kita tinggal memanggil fungsi `sd(Y - X)` untuk mendapatkan satndar defiasi dari data tersebut 
```R
X <- c(78, 75, 67, 77, 70, 72, 78, 70, 77)
Y <- c(100, 95, 70, 90, 90, 90, 89, 100, 100)

sd(Y - X)
```
##### Output (`Dapat dilihat pada console kiri bawah`) :
<img width="960" alt="image" src="https://github.com/yotakeys/Prak2_Probstat2023_C_5025211002/assets/85614845/5b97aef7-f881-479f-9e06-3908325f74c3">


#### 1 B.
Carilah nilai t (p-value)

##### Penyelesaian :
Dengan menggunakan `t.test()` kita bisa mendapatkan seperti summary test, dari hasil dapat dilihhag nilai t (p-value) nya adalah `0.0001373`
```R
X <- c(78, 75, 67, 77, 70, 72, 78, 70, 77)
Y <- c(100, 95, 70, 90, 90, 90, 89, 100, 100)

t.test(Y, X, paired = TRUE)
```

##### Output (`Dapat dilihat pada console kiri bawah`) :
<img width="960" alt="image" src="https://github.com/yotakeys/Prak2_Probstat2023_C_5025211002/assets/85614845/5fd0e7af-6b4b-4b76-b5eb-e83185664ad4">


#### 1 C.
Tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam
hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴 jika
diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada pengaruh yang
signifikan secara statistika dalam hal kadar saturasi oksigen sebelum dan sesudah
melakukan aktivitas 𝐴”

##### Penyelesaian : 
Untuk mengetahui apakah H0 ditolah atau tidak maka, kita akan mengguanakn fungsi `t.test()`, jika nilai p-value lebih kecil dari alpha atau masuk daerah penolakan, maka H0 ditolak, dari output sebenarnya `t.test()` sudah dapat memberikan kesimpulan hipotesis dengan memasukkan beberapa parameter, namun dalam kasus ini kita akan membandingkan manual nilai p-value dengan alpha, sehingga terlihat pada output bahwa H0 ditolak yang berarti terdatapat pengaruh yang signifian secara statistika dalam hal kadara saturasi oksigen sebelum dan sesudah melakukan aktifitas A
```R
X <- c(78, 75, 67, 77, 70, 72, 78, 70, 77)
Y <- c(100, 95, 70, 90, 90, 90, 89, 100, 100)
alfa = 0.05

if(t.test(Y, X, paired = TRUE)$p.value <= alfa){
  print("H0 Ditolak, terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen sebelum dan sesudah melakukan aktifitas A")
}else{
  print("H0 diterima, tidak ada pengaruh yang signifikan secara statistika dalam hal kadara saturasi oksigen sebelum dan sesudah melakukan aktifitas A")
}
```

##### Output (`Dapat dilihat pada console kiri bawah`) :
<img width="960" alt="image" src="https://github.com/yotakeys/Prak2_Probstat2023_C_5025211002/assets/85614845/aa705410-8e87-4f17-b50d-9c429420af31">


### No 2
Diketahui bahwa mobil dikemudikan rata-rata lebih dari 25.000 kilometer per
tahun. Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak
diminta untuk mencatat jarak yang mereka tempuh. Jika sampel acak
menunjukkan rata-rata 23.500 kilometer dan standar deviasi 3.000 kilometer
(kerjakan menggunakan library seperti referensi pada modul).

#### 2 A.
Apakah Anda setuju dengan klaim tersebut? Jelaskan.

##### Penyelesaian :
```Tidak Setuju, dengan didapatkan rata rata sampel = 23.500 dengan standar defiasi 3000.
nilai 25000 terlalu jauh dari mean sampel dengan standar defiasi tersebut```


#### 2 B.
Buatlah kesimpulan berdasarkan p-value yang dihasilkan!

##### Penyelesaian :
Dalam `t.test()` kita akan masukkan sumamry data kita, dengan confident level dan data yang ingin kita uji kebenaranya. dari output, dapat dilihat bahwa klaim ditolak karena mean tidak sama dengan 25.000
```R
install.packages("BSDA")
library(BSDA)

tsum.test(mean.x = 23500, s.x = 3000, n.x = 100, conf.level = 0.95, mu = 25000)
```

##### Output (`Dapat dilihat pada console kiri bawah`) :
<img width="960" alt="image" src="https://github.com/yotakeys/Prak2_Probstat2023_C_5025211002/assets/85614845/1c0ddc2d-21a6-4756-aa94-198a95c86018">


### No 3
Diketahui perusahaan memiliki seorang data analyst yang ingin memecahkan
permasalahan pengambilan keputusan dalam perusahaan tersebut. Selanjutnya
didapatkanlah data berikut dari perusahaan saham tersebut.

<img width="276" alt="image" src="https://github.com/yotakeys/Prak2_Probstat2023_C_5025211002/assets/85614845/afd31de5-878d-49b5-875b-1eb25741244a">

Dari data di atas berilah keputusan serta kesimpulan yang didapatkan. Asumsikan
nilai variancenya sama, apakah ada perbedaan pada rata-ratanya (α= 0.05)?
Buatlah:

#### 3 A.
H0 dan H1

##### Penyelesaian :
```
H0 : mean1(Bandung) = mean2(Bali)
H1 : mean1(Bandung) != mean2(Bali)
```


#### 3 B.
Hitung Sampel statistik

##### Penyelesaian :
dengan menggunakan `tsum.test()` kita memasingkan sumamry dari kedua data yang ingin kita uji, lalu kita berika `alternatif = two.sided` karena kita ingin membuktikan 2 arah bahwa kedua data memiliki mean yang berbeda. terakhir, karena asumsi variance sama, maka kita isi `var.equa = true`. hasil uji statistik dapat dilihat pada output
```R
install.packages("BSDA")
library(BSDA)

tsum.test(mean.x=3.64, s.x = 1.67, n.x = 20, mean.y =2.79 , s.y = 1.5, n.y = 27, alternative = "two.sided", var.equal = TRUE)
```

##### Output (`Dapat dilihat pada console kiri bawah`) :
<img width="960" alt="image" src="https://github.com/yotakeys/Prak2_Probstat2023_C_5025211002/assets/85614845/9b393202-5a81-41ee-93ff-dd5961b7153d">


#### 3 C.
Lakukan uji statistik (df=2)

##### Penyelesaian :
Untuk uji statistik, kita hanya akan menggunakan plot dist dengan df = 2 untuk melihat distribusinya
```R
plotDist(dist = 't', df = 2, col = "blue")
```

##### Output (`Dapat dilihat pada console kanan bawah`) :
<img width="960" alt="image" src="https://github.com/yotakeys/Prak2_Probstat2023_C_5025211002/assets/85614845/13ec3915-7ba6-4689-ab8f-4496b9866be3">


#### 3 D.
Nilai kritikal

##### Penyelesaian :
dengan menggunakan `qchisq()` dari  `df=2` dan confidence lefel = 95%, didapat nilai kritikal yaitu `5.991465`
```R
qchisq(p = 0.05, df = 2, lower.tail = FALSE)
```

##### Output (`Dapat dilihat pada console kiri bawah`) :
<img width="960" alt="image" src="https://github.com/yotakeys/Prak2_Probstat2023_C_5025211002/assets/85614845/a21c15f4-df98-44c0-a5cd-ea5c40657c02">



#### 3 E.
Keputusan

##### Penyelesaian :
```Keputusan didapatkan dari hasil tsum.test() dan nilai kritikal```


#### 3 F.
Kesimpulan

##### Penyelesaian :
```H0 Ditolak, terdapat perbedaan mean dari 2 data tersebut, sehingga H1 diterima```


### No 4
Data yang digunakan merupakan hasil eksperimen yang dilakukan untuk
mengetahui pengaruh suhu operasi (100˚C, 125˚C dan 150˚C) dan tiga jenis kaca
pelat muka (A, B dan C) pada keluaran cahaya tabung osiloskop. Percobaan
dilakukan sebanyak 27 kali dan didapat data sebagai berikut:
https://drive.google.com/file/d/1pICtCrf61DRU86LDPQDJmcKiUMVt9ht4/view.
Dengan data tersebut:

#### 4 A.
Buatlah plot sederhana untuk visualisasi data.

##### Penyelesaian :
Pertama kita harus membaca file csv nya dengan `read.csv()`, lalu kita tinngal membuat plot dengan `qplot()` untuk masing masing jenis kaca
```R
data <- read.csv("C:\\Users\\KEY\\Documents\\Coding\\Prak2_Probstat2023_C_5025211002\\GTL.csv")
qplot(x = Temp, y = Light, geom = "point", data = data) + facet_grid(.~Glass, labeller = label_both)
```

##### Output (`Dapat dilihat pada console kanan bawah`) :
<img width="960" alt="image" src="https://github.com/yotakeys/Prak2_Probstat2023_C_5025211002/assets/85614845/67753970-c1ed-4df6-ae92-2d2208a52e51">


#### 4 B.
Lakukan uji ANOVA dua arah.

##### Penyelesaian :
Kita perlu menguba glass dan temp ke factor, lalu kita masukkan fungsi `aov` untuk melakukan uji anova. untuk melihat hasilnya, kita menggunakan `summary()`.
```
data$Glass <- as.factor(data$Glass)
data$Temp_Factor <- as.factor(data$Temp)

anova <- aov(Light ~ Glass*Temp_Factor, data =data )
summary(anova)
```

##### Output (`Dapat dilihat pada console kiri bawah`) :
<img width="960" alt="image" src="https://github.com/yotakeys/Prak2_Probstat2023_C_5025211002/assets/85614845/0c8e5acf-de5a-4d8b-a354-6a3c9fa81712">


#### 3 C.
Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap
perlakuan (kombinasi kaca pelat muka dan suhu operasi).

##### Penyelesaian :
Kita akan mensummaryse data untuk mendapatkan mean dan satndar defiasi light data dari setiap glass dan perlakuanya, maka kita perlu menggunakan `group_by()` pada data berdasar glass dan temp nya
```R
summary <- group_by(data, Glass, Temp) %>%
  summarise(mean = mean(Light), sd = sd(Light)) %>%
  arrange(desc(mean))
summary
```
##### Output (`Dapat dilihat pada console kiri bawah`) :
<img width="960" alt="image" src="https://github.com/yotakeys/Prak2_Probstat2023_C_5025211002/assets/85614845/feee0a5d-e288-4962-a152-21c2686ad237">


