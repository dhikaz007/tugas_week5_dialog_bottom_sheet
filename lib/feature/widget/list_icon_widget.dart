// Membuat Class List Icon
import 'package:flutter/material.dart';

class ListIcon {
  // Inisialisasi parameter
  final String namaIcon;
  final IconData icon;

  const ListIcon({required this.namaIcon, required this.icon});
}

// List Icon dalam bentuk Map
const List<ListIcon> iconsList = [
  ListIcon(namaIcon: 'Telepon', icon: Icons.phone),
  ListIcon(namaIcon: 'Pesan', icon: Icons.message),
  ListIcon(namaIcon: 'Pengaturan', icon: Icons.settings),
  ListIcon(namaIcon: 'Peramban Web', icon: Icons.open_in_browser),
  ListIcon(namaIcon: 'Kalender', icon: Icons.calendar_today),
  ListIcon(namaIcon: 'Pemutar Musik', icon: Icons.library_music),
  ListIcon(namaIcon: 'Pemutar Video', icon: Icons.video_library),
  ListIcon(namaIcon: 'Kontak', icon: Icons.contacts),
  ListIcon(namaIcon: 'Galeri Foto', icon: Icons.photo_library),
  ListIcon(namaIcon: 'Kamera', icon: Icons.camera),
];
