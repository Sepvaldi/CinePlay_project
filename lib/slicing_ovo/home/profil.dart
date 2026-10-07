import 'package:flutter/material.dart';
import 'package:project_mobile_app/slicing_ovo/profile/akun_ovo.dart';
import 'package:project_mobile_app/slicing_ovo/profile/bantuan_ovo.dart';
import 'package:project_mobile_app/slicing_ovo/profile/keamanan_ovo.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    final profilPengguna = ItemProfile(
      nama: 'Sepvaldi Firmandah Ramadhan',
      avatarImageUrl:
          'https://i.pinimg.com/236x/ca/6e/96/ca6e96a81264ee624d39315869da734d.jpg',
      nomorTelepon: 82143771234, // Integer tanpa angka 0 di depan
    );
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Profile',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              _ProfileHeader(data: profilPengguna),

              _LoyaltyPointsSection(),
              SizedBox(height: 25),
              const AkunOvoSection(),
              const SizedBox(height: 20),
              const BantuanOvoSection(),
              const SizedBox(height: 20),
              const KeamananOvoSection(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemProfile {
  String nama;
  String avatarImageUrl;
  int nomorTelepon;

  ItemProfile({
    required this.nama,
    required this.avatarImageUrl,
    required this.nomorTelepon,
  });
}

class _ProfileHeader extends StatelessWidget {
  final ItemProfile data;
  const _ProfileHeader({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 15,
            foregroundImage: NetworkImage(data.avatarImageUrl),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.nama,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  data.nomorTelepon.toString(),
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Ubah',
              style: const TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LoyaltyPointsSection extends StatelessWidget {
  const _LoyaltyPointsSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.qr_code_2_rounded, size: 30),
          SizedBox(width: 10),
          Text(
            'Loyalty Code',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
