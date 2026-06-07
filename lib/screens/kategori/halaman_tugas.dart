import 'package:flutter/material.dart';
import 'tugas_item.dart'; // 👈 Pastikan import file TugasItem di atas

class HalamanTestTugas extends StatefulWidget {
  const HalamanTestTugas({Key? key}) : super(key: key);

  @override
  State<HalamanTestTugas> createState() => _HalamanTestTugasState();
}

class _HalamanTestTugasState extends State<HalamanTestTugas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF5),
      appBar: AppBar(
        title: const Text('Cek Tampilan UI Tugas'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // 1. CONTOH TUGAS NORMAL (Warna Krem bawaan)
          TugasItem(
            namaTugas: "Cuci piring malam",
            infoWaktu: "23:30 WIB, 45:00min",
            apakahTerpilih: false,
            isRepeat: true,
            isSelesai: false, // 👈 Set false
            isTerlewat: false, // 👈 Set false
            onTap: () {},
            onHapus: () {},
          ),

          // 2. CONTOH TUGAS SELESAI (Harus otomatis jadi BIRU)
          TugasItem(
            namaTugas: "Backup data mingguan",
            infoWaktu: "20:15 WIB, 15:00min",
            apakahTerpilih: false,
            isRepeat: false,
            isSelesai: true, // 👈 KUNCI BIRU: Di-set jadi true
            isTerlewat: false,
            onTap: () {},
            onHapus: () {},
          ),

          // 3. CONTOH TUGAS TERLEWAT (Harus otomatis jadi ABU-ABU)
          TugasItem(
            namaTugas: "Nyapu dan ngepel pagi",
            infoWaktu: "06:00 WIB, 30:00min",
            apakahTerpilih: false,
            isRepeat: true,
            isSelesai: false,
            isTerlewat: true, // 👈 KUNCI ABU-ABU: Di-set jadi true
            onTap: () {},
            onHapus: () {},
          ),
        ],
      ),
    );
  }
}
