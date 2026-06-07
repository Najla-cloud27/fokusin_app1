import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

// Import file picker
import 'custom_time_picker.dart';
import 'custom_date_picker.dart';

class TambahListBottomSheet extends StatefulWidget {
  const TambahListBottomSheet({Key? key}) : super(key: key);

  @override
  State<TambahListBottomSheet> createState() => _TambahListBottomSheetState();
}

class _TambahListBottomSheetState extends State<TambahListBottomSheet> {
  final TextEditingController _listController = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  Duration? selectedDuration;
  bool isRepeat =
      false; // 👈 1. Tambah variabel state untuk menyimpan status pengulangan

  Future<void> _pilihJam() async {
    final result = await showDialog<TimePickerResult>(
      context: context,
      builder: (BuildContext context) {
        return const CustomTimePicker();
      },
    );

    if (result != null) {
      setState(() {
        selectedTime = result.time;
        selectedDuration = result.duration;
      });
    }
  }

  Future<void> _pilihTanggal() async {
    // 👈 2. Ubah showDialog dari <DateTime> menjadi <DatePickerResult> supaya bisa bawa data bool pengulangan
    final result = await showDialog<DatePickerResult>(
      context: context,
      builder: (BuildContext context) {
        return const CustomDatePicker();
      },
    );

    if (result != null) {
      setState(() {
        selectedDate = result.date; // Ambil tanggalnya
        isRepeat = result
            .isRepeat; // 👈 3. Ambil status tombol pengulangan dari kalender
      });
    }
  }

  @override
  void dispose() {
    _listController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFFFF9E6),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _listController,
            autofocus: true,
            onChanged: (text) {
              setState(() {});
            },
            style: GoogleFonts.poppins(
              fontSize: 15,
              color: const Color(0xFF141414),
            ),
            decoration: InputDecoration(
              hintText: 'Tambahkan List',
              hintStyle: GoogleFonts.poppins(
                color: Colors.grey.shade500,
                fontSize: 15,
              ),
              border: InputBorder.none,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              GestureDetector(
                onTap: _pilihJam,
                child: SvgPicture.asset(
                  'assets/icons/iconamoon_clock-bold.svg',
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    selectedTime != null
                        ? const Color(0xFF229EFF)
                        : const Color(0xFF141414),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              GestureDetector(
                onTap: _pilihTanggal,
                child: SvgPicture.asset(
                  'assets/icons/tabler_calendar-filled.svg',
                  width: 22,
                  height: 22,
                  colorFilter: ColorFilter.mode(
                    selectedDate != null
                        ? const Color(0xFF229EFF)
                        : const Color(0xFF141414),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  if (_listController.text.trim().isNotEmpty) {
                    final dataTugas = {
                      'nama': _listController.text.trim(),
                      'tanggal': selectedDate,
                      'jam': selectedTime,
                      'durasi': selectedDuration,
                      'isRepeat':
                          isRepeat, // 👈 4. Masukkan status isRepeat ke dalam Map dataTugas
                    };

                    Navigator.pop(context, dataTugas);
                  }
                },
                child: SvgPicture.asset(
                  'assets/icons/icon_checklist-2.svg',
                  width: 26,
                  height: 26,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
