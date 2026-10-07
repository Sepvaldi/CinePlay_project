import 'package:flutter/material.dart';

class KeamananOvoSection extends StatelessWidget {
  const KeamananOvoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Keamanan',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        _MenuItem(icon: Icons.lock, title: 'Ubah Pin'),
        _MenuItem(icon: Icons.fingerprint, title: 'Login Biometrik'),
        _MenuItem(icon: Icons.phone_android, title: 'Perangkat Terhubung'),
      ],
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  const _MenuItem({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              Icon(icon),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Icon(Icons.chevron_right),
            ],
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }
}
