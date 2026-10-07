import 'package:flutter/material.dart';
import 'card_banner_ovo.dart';
import 'badge_ovo.dart';
import 'kategori_ovo.dart';
import 'banner_promo_ovo.dart';

class HomeOvo extends StatelessWidget {
  const HomeOvo({super.key});

  @override
  Widget build(BuildContext context) {
    const Color purpleHeaderColor = Color(0xFFC6C4FB);
    const Color offWhiteColor = Color(0xFFF7F7FA);

    return Scaffold(
      backgroundColor: purpleHeaderColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'OVO',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4C2A86),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.percent,
                            size: 16,
                            color: Color(0xFF4C2A86),
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Promo',
                            style: TextStyle(
                              color: Color(0xFF4C2A86),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Card Banner Top
              const MainBannerOvo(),
              const SizedBox(height: 16),

              // Container Putih Tulang
              Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                decoration: const BoxDecoration(
                  color: offWhiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: const [
                    SizedBox(height: 16),
                    BadgeOvo(),
                    SizedBox(height: 20),
                    KategoriOvo(),
                    BannerPromoOvo(),
                    SizedBox(height: 80),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
