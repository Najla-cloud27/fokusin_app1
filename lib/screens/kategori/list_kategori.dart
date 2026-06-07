import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fokusin_app1/screens/kategori/kelola_kategori_page.dart';
import 'package:google_fonts/google_fonts.dart';

// 👇 INI TAMBAHANNYA: Import halaman Pomodoro (HomeScreen)
import 'package:fokusin_app1/screens/home/home_screen.dart';

import 'tambah_list_bottom_sheet.dart';
import 'tugas_item.dart';

class KategoriList extends StatefulWidget {
  final String namaKategori;
  final Color warnaKategori;

  const KategoriList({
    Key? key,
    required this.namaKategori,
    required this.warnaKategori,
  }) : super(key: key);

  @override
  State<KategoriList> createState() => _KategoriListState();
}

class _KategoriListState extends State<KategoriList> {
  List<Map<String, dynamic>> daftarTugas = [
    {
      'nama': 'Nyapu ngepel',
      'tanggal': DateTime(2026, 6, 3),
      'jam': const TimeOfDay(hour: 6, minute: 0),
      'durasi': const Duration(minutes: 30),
      'isRepeat': true,
      'isSelesai': false,
    },
    {
      'nama': 'Cuci piring',
      'tanggal': DateTime(2026, 6, 3),
      'jam': const TimeOfDay(hour: 17, minute: 30),
      'durasi': const Duration(minutes: 45),
      'isRepeat': true,
      'isSelesai': true,
    },
    {
      'nama': 'Review Materi Koding Flutter',
      'tanggal': DateTime(2026, 6, 3),
      'jam': const TimeOfDay(hour: 14, minute: 0),
      'durasi': const Duration(minutes: 90),
      'isRepeat': false,
      'isSelesai': false,
    },
    {
      'nama': 'Baca Buku Self Improvement',
      'tanggal': DateTime(2026, 6, 4),
      'jam': const TimeOfDay(hour: 9, minute: 15),
      'durasi': const Duration(minutes: 30),
      'isRepeat': false,
      'isSelesai': false,
    },
    {
      'nama': 'Latihan Soal UTBK / Ujian',
      'tanggal': DateTime(2026, 6, 4),
      'jam': const TimeOfDay(hour: 15, minute: 30),
      'durasi': const Duration(minutes: 60),
      'isRepeat': false,
      'isSelesai': false,
    },
    {
      'nama': 'Desain UI Aplikasi di Figma',
      'tanggal': DateTime(2026, 6, 5),
      'jam': const TimeOfDay(hour: 11, minute: 0),
      'durasi': const Duration(minutes: 120),
      'isRepeat': false,
      'isSelesai': false,
    },
    {
      'nama': 'Evaluasi Mingguan & Journaling',
      'tanggal': DateTime(2026, 6, 5),
      'jam': const TimeOfDay(hour: 20, minute: 0),
      'durasi': const Duration(minutes: 30),
      'isRepeat': false,
      'isSelesai': false,
    },
  ];

  int? indeksTugasTerpilih;

  String _formatTanggalBuatHeader(DateTime date) {
    final List<String> hari = ['Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab', 'Min'];
    final List<String> bulan = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'Mei',
      'Jun',
      'Jul',
      'Agu',
      'Sep',
      'Okt',
      'Nov',
      'Des',
    ];
    return '${hari[date.weekday - 1]}, ${date.day} ${bulan[date.month - 1]}';
  }

  String _formatSubtitleTugas(Map<String, dynamic> tugas) {
    String info = "";
    if (tugas['jam'] != null) {
      final TimeOfDay jam = tugas['jam'];
      final m = jam.minute.toString().padLeft(2, '0');
      info += "${jam.hour}:$m WIB";
    } else {
      info += "--:-- WIB";
    }

    if (tugas['durasi'] != null) {
      final Duration durasi = tugas['durasi'];
      if (durasi.inMinutes > 0) info += ", ${durasi.inMinutes}:00min";
    }
    return info;
  }

  void _showHapusDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            width: 320,
            decoration: BoxDecoration(
              color: const Color(0xFFFFFDF5),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: const Color(0xFF229EFF), width: 2),
            ),
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Kamu ingin menghapus list ini?',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF141414),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          height: 46,
                          decoration: BoxDecoration(
                            color: const Color(0xFF626262),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: const Color(0xFFA7D8FF),
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Batal',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          setState(() {
                            daftarTugas.removeAt(index);
                            if (indeksTugasTerpilih == index) {
                              indeksTugasTerpilih = null;
                            } else if (indeksTugasTerpilih != null &&
                                indeksTugasTerpilih! > index) {
                              indeksTugasTerpilih = indeksTugasTerpilih! - 1;
                            }
                          });
                        },
                        child: Container(
                          height: 46,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE32525),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: const Color(0xFFFFCB33),
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Hapus',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showMulaiTugasDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            width: 340,
            decoration: BoxDecoration(
              color: const Color(0xFFFFFDF5),
              borderRadius: BorderRadius.circular(24),
            ),
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'Yakin ingin memulai tugas ini?',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFE32525),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Image.asset(
                      'assets/images/logo_kelola.png',
                      height: 45,
                      width: 45,
                      fit: BoxFit.contain,
                      errorBuilder: (c, o, s) =>
                          const SizedBox(width: 45, height: 45),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(color: Color(0xFF929292), thickness: 1),
                const SizedBox(height: 12),
                Text(
                  'Setelah sesi dimulai, aplikasi akan terkunci hingga timer selesai atau sesi dibatalkan',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: const Color(0xFF141414),
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          height: 46,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE32525),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: const Color(0xFFA7D8FF),
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Kembali',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // 👇 INI PERUBAHANNYA: Navigasi ke Pomodoro (HomeScreen)
                          Navigator.pop(context); // Tutup dialog popup dulu
                          Navigator.pushAndRemoveUntil(
                            // Pindah ke halaman Pomodoro
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                            (route) => false,
                          );
                        },
                        child: Container(
                          height: 46,
                          decoration: BoxDecoration(
                            color: const Color(0xFF229EFF),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: const Color(0xFFFFCB33),
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Mulai Sekarang',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _showTambahListPanel(BuildContext context) async {
    final result = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: const TambahListBottomSheet(),
        );
      },
    );

    if (result != null) {
      setState(() {
        daftarTugas.add(result as Map<String, dynamic>);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E4),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: FloatingActionButton(
          onPressed: () {
            if (indeksTugasTerpilih != null) {
              _showMulaiTugasDialog(context);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Pilih salah satu list tugas terlebih dahulu untuk dimulai!',
                    style: GoogleFonts.poppins(fontSize: 13),
                  ),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: const Color(0xFF626262),
                ),
              );
            }
          },
          backgroundColor: const Color(0xFF229EFF),
          shape: const CircleBorder(),
          elevation: 4,
          child: SvgPicture.asset(
            'assets/icons/pemutar_video.svg',
            width: 24,
            height: 24,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const KelolaKategoriPage(),
                            ),
                            (route) => false,
                          );
                        },
                        child: SizedBox(
                          width: 44,
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/icons/arrow_back_blue.svg',
                              width: 28,
                              height: 28,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        widget.namaKategori,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF141414),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => _showTambahListPanel(context),
                    child: SizedBox(
                      width: double.infinity,
                      height: 85,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 58,
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(36),
                                border: Border.all(
                                  color: const Color(0xFFFFCB33),
                                  width: 2,
                                ),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFF229EFF),
                                  borderRadius: BorderRadius.circular(34),
                                ),
                                padding: const EdgeInsets.only(right: 16),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 40,
                                      child: Center(
                                        child: SvgPicture.asset(
                                          'assets/icons/Vector 1.svg',
                                          width: 20,
                                          height: 20,
                                          colorFilter: const ColorFilter.mode(
                                            Color(0xFFFFCB33),
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 14),
                                    Text(
                                      'Tambahkan List',
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 12,
                            bottom: 0,
                            child: Image.asset(
                              'assets/images/logo_kelola.png',
                              height: 80,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Divider(color: Color(0xFF929292), thickness: 1, height: 1),
            Expanded(
              child: daftarTugas.isEmpty
                  ? _buildEmptyState()
                  : _buildDynamicTaskList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Opacity(
        opacity: 0.6,
        child: SizedBox(
          width: 201,
          height: 221,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(
                  'assets/images/logo_list.png',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Belum ada List nih, ayo isi!',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: const Color(0xFF141414),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDynamicTaskList() {
    Map<String, List<Map<String, dynamic>>> grupTugasBerdasarTanggal = {};
    for (var tugas in daftarTugas) {
      DateTime tgl = tugas['tanggal'] ?? DateTime.now();
      String keyTanggal = _formatTanggalBuatHeader(tgl);
      if (!grupTugasBerdasarTanggal.containsKey(keyTanggal)) {
        grupTugasBerdasarTanggal[keyTanggal] = [];
      }
      grupTugasBerdasarTanggal[keyTanggal]!.add(tugas);
    }
    List<String> semuaHeaderTanggal = grupTugasBerdasarTanggal.keys.toList();

    return ListView.builder(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 90),
      itemCount: semuaHeaderTanggal.length,
      itemBuilder: (context, indexTanggal) {
        String teksTanggal = semuaHeaderTanggal[indexTanggal];
        List<Map<String, dynamic>> listTugasDiTanggalIni =
            grupTugasBerdasarTanggal[teksTanggal]!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: 12,
                top: indexTanggal == 0 ? 0 : 20,
              ),
              child: Text(
                teksTanggal,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF141414),
                ),
              ),
            ),
            ...listTugasDiTanggalIni.map((dataTugas) {
              int indeksAsli = daftarTugas.indexOf(dataTugas);
              bool apakahTerpilih = indeksTugasTerpilih == indeksAsli;

              final DateTime tgl = dataTugas['tanggal'] ?? DateTime.now();
              final TimeOfDay jam =
                  dataTugas['jam'] ?? const TimeOfDay(hour: 0, minute: 0);

              final waktuLogikaTugas = DateTime(
                tgl.year,
                tgl.month,
                tgl.day,
                jam.hour,
                jam.minute,
              );

              bool isSelesai = dataTugas['isSelesai'] ?? false;

              bool isTerlewat =
                  DateTime.now().isAfter(waktuLogikaTugas) && !isSelesai;

              return TugasItem(
                namaTugas: dataTugas['nama'] ?? '',
                infoWaktu: _formatSubtitleTugas(dataTugas),
                apakahTerpilih: apakahTerpilih,
                isRepeat: dataTugas['isRepeat'] ?? false,
                isSelesai: isSelesai,
                isTerlewat: isTerlewat,
                onTap: () {
                  setState(() {
                    indeksTugasTerpilih = indeksAsli;
                  });
                },
                onHapus: () {
                  _showHapusDialog(context, indeksAsli);
                },
              );
            }).toList(),
          ],
        );
      },
    );
  }
}
