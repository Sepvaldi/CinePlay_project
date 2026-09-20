import 'package:flutter/material.dart';

class JadwalBioskopPage extends StatefulWidget {
  const JadwalBioskopPage({super.key});

  @override
  State<JadwalBioskopPage> createState() => _JadwalBioskopPageState();
}

class _JadwalBioskopPageState extends State<JadwalBioskopPage> {
  // Data Film
  final List<String> movieList = const [
    'Avatar 3',
    'Spider-Man 3',
    'Inception',
    'Resident Evil',
  ];

  // Data Studio dan Jam Tayang masing-masing
  final List<Map<String, dynamic>> studioData = const [
    {
      'namaStudio': 'Studio Regular',
      'harga': 'Rp 40.000',
      'jam': ['11:00', '13:30', '16:00', '18:30', '21:00'],
    },
    {
      'namaStudio': 'Studio IMAX 3D',
      'harga': 'Rp 60.000',
      'jam': ['12:30', '15:15', '18:00', '20:45'],
    },
    {
      'namaStudio': 'Velvet VIP',
      'harga': 'Rp 100.000',
      'jam': ['14:00', '17:00', '20:00'],
    },
  ];

  String _selectedMovie = 'Avatar 3';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Jadwal Bioskop')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dropdown Pilihan Film
            const Text(
              'Pilih Film:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedMovie,
                  isExpanded: true,
                  items: movieList.map((String movie) {
                    return DropdownMenuItem<String>(
                      value: movie,
                      child: Text(movie),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        _selectedMovie = newValue;
                      });
                    }
                  },
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Judul Film yang Dipilih
            Row(
              children: [
                const Icon(Icons.movie, color: Colors.redAccent),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    _selectedMovie,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ],
            ),

            const Divider(height: 32, thickness: 1),

            // Daftar Studio & Jam Tayang
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: studioData.length,
              itemBuilder: (context, index) {
                final studio = studioData[index];
                final String namaStudio = studio['namaStudio'];
                final String harga = studio['harga'];
                final List<String> listJam = studio['jam'];

                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              namaStudio,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              harga,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.green,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: listJam.map((jam) {
                            return ActionChip(
                              avatar: const Icon(Icons.access_time, size: 16),
                              label: Text(jam),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Memilih $_selectedMovie di $namaStudio jam $jam',
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
