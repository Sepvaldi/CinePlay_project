import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Saya')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.redAccent,
              foregroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZkaLVi4FSZA1SJEEZ8WFFqhyWKNu0neYNTANAoYXXPg&s=10',
              ),
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 12),
            const Text(
              'Valdi',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text('seppaldi.com', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 24),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Riwayat Pemesanan Tiket',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.confirmation_number,
                  color: Colors.redAccent,
                ),
                title: const Text('Avatar 3'),
                subtitle: const Text('Studio IMAX 3D • 2 Tiket'),
                trailing: const Text(
                  'Berhasil',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.confirmation_number,
                  color: Colors.redAccent,
                ),
                title: const Text('Inception'),
                subtitle: const Text('Studio Regular • 1 Tiket'),
                trailing: const Text(
                  'Berhasil',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(48),
              ),
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
              onPressed: () {
                // Menghapus seluruh stack halaman dan kembali ke rute login
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login',
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
