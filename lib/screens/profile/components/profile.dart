import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plantapp/constraint.dart';
import 'package:plantapp/screens/profile/components/camera_page.dart';
import 'package:plantapp/screens/profile/components/map_page.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _imageFile;
  final _addressController = TextEditingController();
  String? alamatDipilih;

  Future<void> _pickFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _pickFromCamera() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CameraPage()),
    );
    if (result != null && result is File) {
      setState(() {
        _imageFile = result;
      });
    }
  }

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color pastel = const Color(0xFFFDEAE7); // pastel peach
    final Color textColor = Colors.black87;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text("Profil", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sectionTitle("Foto Profil"),
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: kPrimaryColor.withOpacity(0.1),
                      backgroundImage:
                          _imageFile != null ? FileImage(_imageFile!) : null,
                      child: _imageFile == null
                          ? const Icon(Icons.person, size: 60, color: Colors.white)
                          : null,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'camera') {
                            _pickFromCamera();
                          } else {
                            _pickFromGallery();
                          }
                        },
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'camera',
                            child: Text("Ambil dari Kamera"),
                          ),
                          const PopupMenuItem(
                            value: 'gallery',
                            child: Text("Ambil dari Galeri"),
                          ),
                        ],
                        child: const CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.edit, size: 18, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
              sectionTitle("Alamat dari Peta"),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Alamat container
                  Expanded(
                    child: alamatDipilih != null
                        ? Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Icons.location_on, size: 18, color: Colors.black54),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Text(
                                    alamatDipilih!,
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => setState(() => alamatDipilih = null),
                                  child: const Icon(Icons.close, size: 18, color: Colors.black45),
                                ),
                              ],
                            ),
                          )
                        : const Text("Belum ada alamat"),
                  ),
                  const SizedBox(width: 12),

                  // Tombol pilih peta
                  ElevatedButton.icon(
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MapPage()),
                      );
                      if (result != null && result is String) {
                        setState(() {
                          alamatDipilih = result;
                        });
                      }
                    },
                    icon: const Icon(Icons.map_outlined, size: 20),
                    label: const Text("Peta"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: pastel,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),
              sectionTitle("Alamat Manual"),
              Container(
                decoration: BoxDecoration(
                  color: pastel,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(12),
                child: TextField(
                  controller: _addressController,
                  style: TextStyle(color: textColor),
                  decoration: InputDecoration(
                    labelText: "Tulis alamat secara manual (opsional)",
                    labelStyle: TextStyle(color: textColor.withOpacity(0.7)),
                    border: InputBorder.none,
                    icon: const Icon(Icons.edit_location_alt, color: Colors.black54),
                  ),
                  maxLines: 2,
                ),
              ),

              const SizedBox(height: 40),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    final alamatManual = _addressController.text;
                    final alamatAkhir = alamatDipilih ?? alamatManual;

                    print("Alamat disimpan: $alamatAkhir");
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Profil berhasil disimpan")),
                    );
                  },
                  icon: const Icon(Icons.save),
                  label: const Text("Simpan Profil"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: pastel,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }
}
