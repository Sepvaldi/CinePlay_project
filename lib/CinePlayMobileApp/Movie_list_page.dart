import 'package:flutter/material.dart';

class MovieListPage extends StatelessWidget {
  const MovieListPage({super.key});

  // Memisahkan URL gambar untuk Poster (Portrait) dan Banner (Landscape)
  final List<Map<String, String>> movies = const [
    {
      'judul': 'Avatar 3',
      'genre': 'Sci-Fi / Action',
      'imageUrlPoster':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaxfA2LFdGHYIfgLodgNvtZ7tKra1syM6SWzoXwtM9LQ&s',
      'imageUrlBanner':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaxfA2LFdGHYIfgLodgNvtZ7tKra1syM6SWzoXwtM9LQ&s', // Sesuaikan URL banner landscape
      'sinopsis':
          'Petualangan berlanjut di wilayah lautan dan pulau-pulau baru di Pandora.',
    },
    {
      'judul': 'Spider-Man 3',
      'genre': 'Action / Superhero',
      'imageUrlPoster':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3pdcWjYOIs5L3S-hL5079M-NWjFP762gWHosUinr0qw&s=10',
      'imageUrlBanner':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3pdcWjYOIs5L3S-hL5079M-NWjFP762gWHosUinr0qw&s=10', // Sesuaikan URL banner landscape
      'sinopsis':
          'Peter Parker menghadapi musuh baru yang mengancam keamanan kota New York.',
    },
    {
      'judul': 'Inception',
      'genre': 'Sci-Fi / Thriller',
      'imageUrlPoster':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyxLJetSwDjmMTAKuTuSNMSkKrrZG1K9w9o8nT0xR9Tw&s=10',
      'imageUrlBanner':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyxLJetSwDjmMTAKuTuSNMSkKrrZG1K9w9o8nT0xR9Tw&s=10', // Sesuaikan URL banner landscape
      'sinopsis':
          'Seorang pencuri yang masuk ke dalam mimpi orang lain untuk mencuri rahasia.',
    },
    {
      'judul': 'Resident Evil',
      'genre': 'Horror / Action',
      'imageUrlPoster':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS84mZQCQqvp64zaM2o8G3CtETucu4BRxC2DD4Sy1ji6A&s=10',
      'imageUrlBanner':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS84mZQCQqvp64zaM2o8G3CtETucu4BRxC2DD4Sy1ji6A&s=10', // Sesuaikan URL banner landscape
      'sinopsis':
          'Perjuangan bertahan hidup di tengah wabah virus yang mengubah manusia menjadi monster.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Film Tayang')),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailMoviePage(
                    judul: movie['judul']!,
                    genre: movie['genre']!,
                    sinopsis: movie['sinopsis']!,
                    imageUrlBanner:
                        movie['imageUrlBanner']!, // Mengirim URL banner ke halaman detail
                  ),
                ),
              );
            },
            child: Card(
              elevation: 4,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.network(
                      movie['imageUrlPoster']!, // Menggunakan URL gambar poster untuk grid
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: const Center(
                            child: Icon(
                              Icons.broken_image,
                              size: 50,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          color: Colors.grey[200],
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie['judul']!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          movie['genre']!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailMoviePage extends StatelessWidget {
  final String judul;
  final String genre;
  final String sinopsis;
  final String imageUrlBanner; // Menggunakan variabel khusus untuk banner

  const DetailMoviePage({
    super.key,
    required this.judul,
    required this.genre,
    required this.sinopsis,
    required this.imageUrlBanner,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(judul)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  imageUrlBanner, // Memuat gambar khusus banner landscape
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.movie,
                        size: 60,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              judul,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            Chip(
              label: Text(genre),
              backgroundColor: Colors.redAccent.withOpacity(0.1),
            ),
            const SizedBox(height: 16),
            const Text(
              'Sinopsis:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(sinopsis, style: const TextStyle(fontSize: 16, height: 1.4)),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}
