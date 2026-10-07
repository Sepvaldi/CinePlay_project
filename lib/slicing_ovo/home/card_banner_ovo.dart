import 'package:flutter/material.dart';

class MainBannerOvo extends StatelessWidget {
  const MainBannerOvo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 120, 79, 192),
            Color.fromARGB(255, 107, 105, 179),
            Color.fromARGB(255, 76, 42, 134),
            Color.fromARGB(255, 107, 105, 179),
            Color.fromARGB(255, 76, 42, 134),
            Color.fromARGB(255, 107, 105, 179),
            Color.fromARGB(255, 76, 42, 134),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'OVO Cash',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: const [
              Text(
                'Total Balance',
                style: TextStyle(fontSize: 15, color: Colors.white70),
              ),
              SizedBox(width: 8),
              Icon(Icons.visibility_outlined, size: 15, color: Colors.white70),
            ],
          ),
          const SizedBox(height: 4),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Tap untuk lihat',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              _PointsButton(),
            ],
          ),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              _MenuButton(icon: Icons.add_circle, label: 'Top up'),
              _MenuButton(icon: Icons.arrow_circle_up, label: 'Transfer'),
              _MenuButton(icon: Icons.atm, label: 'Tarik Tunai'),
              _MenuButton(icon: Icons.list_alt, label: 'Riwayat'),
            ],
          ),
        ],
      ),
      // height: 180,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(16),
      //   image: const DecorationImage(image: AssetImage('Asset/BannerOvo.png')),
      // ),
    );
  }
}

class _PointsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: const [
          CircleAvatar(
            radius: 10,
            child: Text(
              'P',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Color.fromARGB(255, 76, 42, 134),
            foregroundColor: Colors.white,
          ),
          SizedBox(width: 4),
          Text('OVO Points', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 4),
          Icon(Icons.arrow_forward_ios, size: 12),
        ],
      ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _MenuButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
          child: Icon(icon, color: Color(0xFF4C2A86)),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}
