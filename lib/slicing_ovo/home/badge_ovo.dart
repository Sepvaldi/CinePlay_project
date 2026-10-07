import 'package:flutter/material.dart';

class BadgeOvo extends StatelessWidget {
  const BadgeOvo({super.key});

  final List<Map<String, dynamic>> badgeImages = const [
    {
      'title': 'Cek data kamu demi kelancaran pemakaian akun OVO Premier kamu.',
      'button': 'Cek',
      'icon': Icons.key,
    },
    {
      'title': 'Jangan lupa selalu cek promo yang selalu hadir di aplikasi.',
      'button': 'Cek',
      'icon': Icons.percent,
    },
    {
      'title': 'Lebih mudah transaksi dengan OVO qris sekarang.',
      'button': 'Cek',
      'icon': Icons.qr_code_scanner,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(
      viewportFraction: 0.92,
    );

    return SizedBox(
      height: 140,
      width: 400,
      child: PageView.builder(
        controller: pageController,
        itemCount: badgeImages.length,
        itemBuilder: (context, index) {
          final badge = badgeImages[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 12.0,
                right: 12.0,
                top: 20.0,
                bottom: 12.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: const Color(0xFFECE6F6),
                        child: Icon(
                          badge['icon'] as IconData,
                          color: const Color(0xFF4C2A86),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          badge['title'] as String,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle button press
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4C2A86),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 6,
                        ),
                      ),
                      child: Text(
                        badge['button'] as String,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
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
