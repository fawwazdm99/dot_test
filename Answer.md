## Sudah berapa lama anda mulai menggunakan Flutter?

Saya mulai menggunakan flutter sejak akhir desember 2019 karena saat itu sedang ada projek bersama teman untuk membuat sebuah aplikasi penjemputan minyak. Sebelumnya telah menggunakan react native sebanyak 2 kali namun mengalami banyak kendala dalam pengembangan sehingga beralih menggunakan flutter

## Apa saja library Flutter yang sering atau biasa anda pakai? Jelaskan kegunaannya bagi anda.

Library flutter yang sering saya gunakan adalah rxdart dan juga http untuk keperluan melakukan request http kepada API yang telah disediakan

## Jelaskan penerapan clean code atau design pattern yang biasa anda gunakan dan manfaatnya untuk anda.

Design pattern yang saya gunakan adalah Based Logic Component atau biasa disebut Bloc. Bloc memiliki kelebihan untuk memisahkan presenter dan juga logic dalam sebuah aplikasi sehingga source code akan lebih mudah untuk dimaintain, readeable, dan juga traceable.

Untuk folderingnya saya membuat 3 folder yaitu view, bloc, dan juga router. View berisi widget yang akan ditampilkan, bloc berisi logic dari widget tersebut, sedangkan router berisi nama-nama routing dan juga logic routingnya

Dalam folder bloc saya membuat folder lagi bernama logic yang mana folder tersebut berisi logic dari setiap halaman yang ada. Seringkali dalam satu halaman memerlukan logic yang banyak (khususnya form) sehingga saya memisahkan logic dari setiap halaman dalam filenya masing-masing. Selain itu dalam setiap file logic akan dilakukan cek koneksi internet terlebih dahulu.
Dalam file repository berisi fungsi untuk memanggil fungsi API mana yang akan dipakai dalam file apiProvider. Sedangkan dalam file API Provider berisi fungsi-fungsi untuk melakukan request http dengan baseUrl yang telah diatur. Yang mana apabila terjadi error maka akan mengembalikan object data error

## Apakah tantangan terbesar yang pernah anda temui dalam mengerjakan aplikasi Flutter dan bagaimana anda menyelesaikannya dari sisi engineering? Misal dari sisi Android dan iOS.

Sejauh ini tantangan terbesar yang pernah saya hadapi adalah bagaimana agar terdapat suatu variabel yang dapat diakses pada semua halaman atau biasa disebut state management yang apabila di react biasa menggunakan redux. Akhirnya saya memilih untuk belajar pattern Bloc untuk dapat melakukan state management dengan baik. Lalu setelah mempelajari berbagai artikel akhirnya saya memilih untuk membuat pattern Bloc versi saya sendiri yang tidak jauh beda ketika saya membuat aplikasi react native terdahulu. Saya juga menghindari model mengingat API yang diberikan bisa jadi objek yang sangat rumit untuk dibuat model dan justru membuang waktu untuk membuatnya sehingga saya memilih menggunakan dynamic yang disediakan oleh bahasa dart. Selain itu tantangan yang saya hadapi adalah keterbatasan device dalam IOS sehingga tidak bisa melakukan testing apda IOS

## Untuk efisiensi pengerjaan project dalam tim, bagaimana workflow anda dari proses development hingga merilis aplikasi hingga bisa digunakan oleh tester / client?

Saya terbiasa menggunakann metode sprint dalam suatu projek yang menggunakan tool trello sebagai project managementnnya. Pada card awal akan diberitahu backlog dan juga asset-asset yang dibutuhkan selama pembuatan aplikasi. Lalu pengerjaan akan dibagi dalam beberapa sprint sesuai kebutuhan dimana jeda antar sprint akan diadakan testing dan validasi terlebih dahulu. Selain itu juga akan diadakan daily meeting by phone untuk briefing dan juga menanyakan apabila ada yang kurang jelas. Setelah semua print selesai makan akan ada tahap testing bersama user untuk melakukan testing secara keseluruhan dan penyesuaian environment. Setelah semua administrasi selesai dilakukan maka aplikasi akan diserahkan kepada client

## Jelaskan teknik-teknik apa saja yang dapat meningkatkan performance dan keamanan sebuah aplikasi Flutter.

Untuk meningkatkan performa aplikasi flutter terdapat beberapa hal yang dapat dilakukan yaitu:

- [Menghindari build widget yang terlalu panjang, lebih baik dipisah menjadi beberapa widget sesuai kebutuhan]
- [Menggunakan efek atau animasi sesuai kebutuhan, dalam flutter disarankan untuk menggunakan AnimatedOpacity atau FadeInImage widget untuk membuat animasi karena telah diatur framerate nya]
- [Menggunakan ListView.builder untuk menampilkan list yang sangat panjang]
  Untuk meningkatkan keamanan sebuah aplikasi flutter diperlukan koordinasi anatar mobile devloper dengan back-end developer dalam komunikasi API. Contoh yang dapat digunakan dalam komunikasinya yaitu token, autentikasi, atau bisa menggunakan autentikasi sidik jari selain itu disisi mobile sebisa mungkin menggunakan plugin yang direkomendasikan oleh pihak flutter

## Apakah anda bersedia onsite di Malang?

Saat ini saya sedang aktif menjadi mahasiswa semester 6 di Unviersitas Brawijaya. Sehingga untuk domisili saya berada di malang namun tidak bisa ke kantor setiap hari karena adanya kelas. Saya memiliki waktu setelah jam 12 dari hari rabu-jum'at. Untuk selebihnya saya akan kerja remote dan tetap bekerja sesuai target yang diberikan
