
# Nama  : Keyisa Raihan Illah Setiadi
# NRP   : 5025211002
# Kelas : Probabilitas dan Statistik (C)


# Soal 1
# Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas 𝐴 terhadap
# kadar saturasi oksigen pada manusia. Peneliti tersebut mengambil sampel
# sebanyak 9 responden. Pertama, sebelum melakukan aktivitas 𝐴, peneliti mencatat
# kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut
# diminta melakukan aktivitas 𝐴. Setelah 15 menit, peneliti tersebut mencatat
# kembali kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9
# responden mengenai kadar saturasi oksigen sebelum dan sesudah melakukan
# aktivitas.
# Berdasarkan data pada tabel diatas, diketahui kadar saturasi oksigen dari
# responden ke-3 ketika belum melakukan aktivitas 𝐴 sebanyak 67, dan setelah
# melakukan aktivitas 𝐴 sebanyak 70.

# Poin 1a.
# Carilah Standar deviasi dari data selisih pasangan pengamatan tabel diatas
# Jawab : 
X <- c(78, 75, 67, 77, 70, 72, 78, 70, 77)
Y <- c(100, 95, 70, 90, 90, 90, 89, 100, 100)

sd(Y - X)

# Poin 1b.
# carian nilai t (p-value)
# Jawab : 
X <- c(78, 75, 67, 77, 70, 72, 78, 70, 77)
Y <- c(100, 95, 70, 90, 90, 90, 89, 100, 100)

t.test(Y, X, paired = TRUE)

# poin 1c.
# Tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam
# hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴 jika
# diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada pengaruh yang
# signifikan secara statistika dalam hal kadar saturasi oksigen sebelum dan sesudah
# melakukan aktivitas 𝐴”
# Jawab :
X <- c(78, 75, 67, 77, 70, 72, 78, 70, 77)
Y <- c(100, 95, 70, 90, 90, 90, 89, 100, 100)
alfa = 0.05

if(t.test(Y, X, paired = TRUE)$p.value <= alfa){
  print("H0 Ditolak, terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen sebelum dan sesudah melakukan aktifitas A")
}else{
  print("H0 diterima, tidak ada pengaruh yang signifikan secara statistika dalam hal kadara saturasi oksigen sebelum dan sesudah melakukan aktifitas A")
}

# Soal 2
# Diketahui bahwa mobil dikemudikan rata-rata lebih dari 25.000 kilometer per
# tahun. Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak
# diminta untuk mencatat jarak yang mereka tempuh. Jika sampel acak
# menunjukkan rata-rata 23.500 kilometer dan standar deviasi 3.000 kilometer
# (kerjakan menggunakan library seperti referensi pada modul).

# Poin 2a.
# Apakah Anda setuju dengan klaim tersebut? Jelaskan
# Jawab : 
# Tidak Setuju, dengan didapatkan rata rata sampel = 23.500 dengan standar defiasi 3000
# walaupun 25000 mungkin,namun data akan lebih berkumpul disekitar 23500

# Poin 2b.
# Buatlah kesimpulan berdasarkan p-value yang dihasilkan!
# Jawab :
install.packages("BSDA")
library(BSDA)

tsum.test(mean.x = 23500, s.x = 3000, n.x = 100, conf.level = 0.95, mu = 25000)
# Dari hasil nya dapat dilihat bahwa dengan interval confidence 95 % dihasilkan 
# range 22904.73 sampai 24095.27, sehingga nilai 25000 ditolak (nilai p-value jauh lebih kecil daripada 0.05)

# Soal 3
# Diketahui perusahaan memiliki seorang data analyst yang ingin memecahkan
# permasalahan pengambilan keputusan dalam perusahaan tersebut. Selanjutnya
# didapatkanlah data berikut dari perusahaan saham tersebut.
# Dari data di atas berilah keputusan serta kesimpulan yang didapatkan. Asumsikan
# nilai variancenya sama, apakah ada perbedaan pada rata-ratanya (α= 0.05)?
# Buatlah:

# Poin 3a.
# H0 dan H1
# Jawab :
# H0 : mean1 = mean2
# H1 : mean1 != mean2

# Poin 3b.
# Hitung sampel statistik
# Jawab :
install.packages("BSDA")
library(BSDA)

tsum.test(mean.x=3.64, s.x = 1.67, n.x = 20, mean.y =2.79 , s.y = 1.5, n.y = 27, alternative = "two.sided", var.equal = TRUE)

# Poin 3c.
# Lakukan uji statistik (df =2)
# Jawab :
install.packages("mosaic")
library(mosaic)

plotDist(dist = 't', df = 2, col = "blue")

# Poin 3d.
# Nilai kritika;
# Jawab : 
qchisq(p = 0.05, df = 2, lower.tail = FALSE)

# Poin 3e.
# Keputusan
# Jawab :
# Keputusan didapatkan dari hasil tsum.test()

# Poin 3f.
# Kesimpulan
# Jawab :
# H0 Ditolak, terdapat perbedaan mean dari 2 data tersebut, sehingga H1 diterima


# Soal 4
# Data yang digunakan merupakan hasil eksperimen yang dilakukan untuk
# mengetahui pengaruh suhu operasi (100˚C, 125˚C dan 150˚C) dan tiga jenis kaca
# pelat muka (A, B dan C) pada keluaran cahaya tabung osiloskop. Percobaan
# dilakukan sebanyak 27 kali dan didapat data sebagai berikut:

# Poin 4a.
# Buatlah plot sederhana untuk visualisasi data.
# Jawab : 
data <- read.csv("C:\\Users\\KEY\\Documents\\Coding\\Prak2_Probstat2023_C_5025211002\\GTL.csv")
qplot(x = Temp, y = Light, geom = "point", data = data) + facet_grid(.~Glass, labeller = label_both)

# Poin 4b.
# Lakukan uji ANOVA dua arah.
# Jawab :
data$Glass <- as.factor(data$Glass)
data$Temp_Factor <- as.factor(data$Temp)

anova <- aov(Light ~ Glass*Temp_Factor, data =data )
summary(anova)

# Poin 4c.
# Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap
# perlakuan (kombinasi kaca pelat muka dan suhu operasi).
# Jawab :
summary <- group_by(data, Glass, Temp) %>%
  summarise(mean = mean(Light), sd = sd(Light)) %>%
  arrange(desc(mean))
summary