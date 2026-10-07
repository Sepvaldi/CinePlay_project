import 'package:flutter/material.dart';

class AkunOvoSection extends StatelessWidget {
  const AkunOvoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Akun',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),

        // Premier: ada tombol Upgrade, tanpa panah
        _MenuItem(
          icon: Icons.workspace_premium,
          title: 'OVO Premier',
          showArrow: false,
          trailing: ElevatedButton(
            onPressed: () {},
            child: const Text('Upgrade'),
          ),
        ),

        const _MenuItem(icon: Icons.payments_rounded, title: 'OVO Points'),
        const _MenuItem(icon: Icons.stars_rounded, title: 'OVO Stamp'),

        // Aplikasi Terhubung: ada badge NEW
        _MenuItem(
          icon: Icons.link,
          title: 'Aplikasi Terhubung',
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              'NEW',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final bool showArrow;

  const _MenuItem({
    required this.icon,
    required this.title,
    this.trailing,
    this.showArrow = true,
  });

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
              if (trailing != null) trailing!,
              if (showArrow) const Icon(Icons.chevron_right),
            ],
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }
}
