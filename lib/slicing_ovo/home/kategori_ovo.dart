import 'package:flutter/material.dart';
import 'kategori_icon_ovo.dart';

class KategoriOvo extends StatelessWidget {
  const KategoriOvo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          // Tab Horizontal Kategori
          const Row(
            children: [
              Text(
                'Favorit',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4C2A86),
                ),
              ),
              SizedBox(width: 16),
              Text('Finansial', style: TextStyle(color: Colors.grey)),
              SizedBox(width: 16),
              Text('Hiburan', style: TextStyle(color: Colors.grey)),
              SizedBox(width: 16),
              Text('Pilihan Lain', style: TextStyle(color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 16),

          // Grid Menu Items dengan Ratio yang Pas
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 0.78, // Mencegah overflow vertikal pada ikon
            mainAxisSpacing: 12,
            crossAxisSpacing: 8,
            children: const [
              KategoriIconOvo(
                icon: Icons.account_balance,
                label: 'Nabung by Superbank',
                badgeText: 'BARU',
              ),
              KategoriIconOvo(
                icon: Icons.monetization_on,
                label: 'Pinjaman',
                badgeText: '100JT',
              ),
              KategoriIconOvo(
                icon: Icons.wallet,
                label: 'Uang Elektronik',
                badgeText: 'Rp 1',
              ),
              KategoriIconOvo(
                icon: Icons.description,
                label: 'Angsuran Kredit',
              ),
              KategoriIconOvo(
                icon: Icons.phone_android,
                label: 'Pulsa/Paket Data',
                badgeText: 'PROMO',
              ),
              KategoriIconOvo(
                icon: Icons.flash_on,
                label: 'PLN',
                badgeText: 'PROMO',
              ),
              KategoriIconOvo(icon: Icons.water_drop, label: 'Air PDAM'),
              KategoriIconOvo(icon: Icons.tv, label: 'Internet & TV Kabel'),
            ],
          ),
        ],
      ),
    );
  }
}
