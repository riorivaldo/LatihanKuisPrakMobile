import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'custom_button.dart';

class HomePage extends StatefulWidget {
  final String username;
  final String nickname;

  const HomePage({Key? key, required this.username, required this.nickname})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers untuk field data CV
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _workExpController = TextEditingController();
  final TextEditingController _orgExpController = TextEditingController();
  final TextEditingController _hardSkillController = TextEditingController();
  final TextEditingController _softSkillController = TextEditingController();
  final TextEditingController _achievementController = TextEditingController();

  // Fungsi untuk mengirim data ke Profile Page
  void _goToProfile() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilePage(
            username: widget.username,
            nickname: widget.nickname,
            fullName: _fullNameController.text,
            nim: _nimController.text,
            workExp: _workExpController.text,
            orgExp: _orgExpController.text,
            hardSkill: _hardSkillController.text,
            softSkill: _softSkillController.text,
            achievement: _achievementController.text,
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _nimController.dispose();
    _workExpController.dispose();
    _orgExpController.dispose();
    _hardSkillController.dispose();
    _softSkillController.dispose();
    _achievementController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Tampilkan nama panggilan jika diisi, kalau tidak tampilkan username
    final String displayName =
        widget.nickname.isNotEmpty ? widget.nickname : widget.username;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:
            Colors.teal, // Mengatur warna background AppBar menjadi teal
        centerTitle: true,
        title: Text(
          'Selamat Datang $displayName',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Field Nama Lengkap
                TextFormField(
                  controller: _fullNameController,
                  decoration: InputDecoration(
                    labelText: 'Nama Lengkap',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  validator: (value) => (value == null || value.isEmpty)
                      ? 'Masukkan nama lengkap'
                      : null,
                ),
                const SizedBox(height: 16),

                // Field NIM
                TextFormField(
                  controller: _nimController,
                  decoration: InputDecoration(
                    labelText: 'NIM',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  validator: (value) =>
                      (value == null || value.isEmpty) ? 'Masukkan NIM' : null,
                ),
                const SizedBox(height: 16),

                // Field Pengalaman Kerja
                TextFormField(
                  controller: _workExpController,
                  decoration: InputDecoration(
                    labelText: 'Pengalaman Kerja',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Field Pengalaman Organisasi
                TextFormField(
                  controller: _orgExpController,
                  decoration: InputDecoration(
                    labelText: 'Pengalaman Organisasi',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Field Hard Skill
                TextFormField(
                  controller: _hardSkillController,
                  decoration: InputDecoration(
                    labelText: 'Hard Skill',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Field Soft Skill
                TextFormField(
                  controller: _softSkillController,
                  decoration: InputDecoration(
                    labelText: 'Soft Skill',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Field Pencapaian/Penghargaan
                TextFormField(
                  controller: _achievementController,
                  decoration: InputDecoration(
                    labelText: 'Pencapaian/Penghargaan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Tombol submit ke Profile Page (custom button)
                CustomButton(
                  text: 'Submit dan Lihat Profile',
                  onPressed: _goToProfile,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
