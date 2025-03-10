import 'package:flutter/material.dart';
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  final String username;
  final String nickname;
  final String fullName;
  final String nim;
  final String workExp;
  final String orgExp;
  final String hardSkill;
  final String softSkill;
  final String achievement;

  const ProfilePage({
    Key? key,
    required this.username,
    required this.nickname,
    required this.fullName,
    required this.nim,
    required this.workExp,
    required this.orgExp,
    required this.hardSkill,
    required this.softSkill,
    required this.achievement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Menentukan nama tampilan (nickname atau username)
    final String displayName = nickname.isNotEmpty ? nickname : username;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text('Profil'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            children: [
              // Foto profil (CircleAvatar)
              // Pastikan file 'assets/Profile.jpg' telah ditambahkan dan dideklarasikan di pubspec.yaml.
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                backgroundImage: const AssetImage('assets/Profile.jpg'),
              ),
              const SizedBox(height: 20),
              // Menampilkan data dengan container berwarna pink muda
              _buildFieldContainer(label: 'Nama', value: fullName),
              _buildFieldContainer(label: 'NIM', value: nim),
              _buildFieldContainer(label: 'Pengalaman Kerja', value: workExp),
              _buildFieldContainer(
                  label: 'Pengalaman Organisasi', value: orgExp),
              _buildFieldContainer(label: 'Hard Skill', value: hardSkill),
              _buildFieldContainer(label: 'Soft Skill', value: softSkill),
              _buildFieldContainer(label: 'Pencapaian', value: achievement),
              const SizedBox(height: 40),
              // Tombol Logout
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                      (route) => false,
                    );
                  },
                  child: const Text(
                    'Logout',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget helper untuk membuat container yang menampilkan label dan nilai data
  Widget _buildFieldContainer({
    required String label,
    required String value,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.pink.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        '$label: $value',
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
