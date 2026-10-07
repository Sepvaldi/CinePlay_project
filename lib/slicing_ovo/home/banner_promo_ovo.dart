import 'package:flutter/material.dart';

class BannerPromoOvo extends StatelessWidget {
  const BannerPromoOvo({super.key});

  @override
  Widget build(BuildContext context) {
    // Daftar gambar promo (Ganti dengan path aset lokal atau URL gambar milikmu)
    final List<String> promoImages = [
      'https://images-loyalty.ovo.id/public/deal/89/64/l/27980.jpg',
      'https://images-loyalty.ovo.id/public/deal/03/19/l/39001.jpg?ver=1',
      'https://images-loyalty.ovo.id/public/deal/89/01/l/42710.jpg?ver=1',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Judul Bagian Promo (Opsional)
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            'Info dan Promo Menarik',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4C2A86),
            ),
          ),
        ),

        // List Horizontal Card Gambar
        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: promoImages.length,
            itemBuilder: (context, index) {
              return Container(
                width: 280, // Lebar masing-masing card banner
                margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(promoImages[index], fit: BoxFit.cover),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
