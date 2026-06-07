import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Kelas data untuk mengembalikan hasil
class TimePickerResult {
  final TimeOfDay time;
  final Duration duration;

  TimePickerResult({required this.time, required this.duration});
}

class CustomTimePicker extends StatefulWidget {
  const CustomTimePicker({Key? key}) : super(key: key);

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  late int _selectedHour;
  late int _selectedMinute;
  int _durHour = 0;
  int _durMin = 0;
  int _durSec = 0;

  @override
  void initState() {
    super.initState();
    final now = TimeOfDay.now();
    _selectedHour = now.hour;
    _selectedMinute = now.minute;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFFFF9E6),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFF229EFF), width: 2),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pilih waktu",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildScrollableBox(
                  label: "Jam",
                  maxValue: 24,
                  currentValue: _selectedHour,
                  isActive: true,
                  onChanged: (val) => _selectedHour = val,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    ":",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
                _buildScrollableBox(
                  label: "Menit",
                  maxValue: 60,
                  currentValue: _selectedMinute,
                  isActive: false,
                  onChanged: (val) => _selectedMinute = val,
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Divider(color: Colors.black12, thickness: 1),
            ),
            Text(
              "Pilih durasi",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildScrollableBox(
                  label: "Jam",
                  maxValue: 24,
                  currentValue: _durHour,
                  isActive: true,
                  isSmall: true,
                  onChanged: (val) => _durHour = val,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    ":",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                _buildScrollableBox(
                  label: "Menit",
                  maxValue: 60,
                  currentValue: _durMin,
                  isActive: false,
                  isSmall: true,
                  onChanged: (val) => _durMin = val,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    ":",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                _buildScrollableBox(
                  label: "Detik",
                  maxValue: 60,
                  currentValue: _durSec,
                  isActive: false,
                  isSmall: true,
                  onChanged: (val) => _durSec = val,
                ),
              ],
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.pop(
                  context,
                  TimePickerResult(
                    time: TimeOfDay(
                      hour: _selectedHour,
                      minute: _selectedMinute,
                    ),
                    duration: Duration(
                      hours: _durHour,
                      minutes: _durMin,
                      seconds: _durSec,
                    ),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFF229EFF),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: const Color(0xFFFFCB33), width: 2),
                ),
                child: Center(
                  child: Text(
                    "Selesai",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScrollableBox({
    required String label,
    required int maxValue,
    required int currentValue,
    required ValueChanged<int> onChanged,
    bool isActive = false,
    bool isSmall = false,
  }) {
    return Column(
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(fontSize: 10, color: Colors.black54),
        ),
        const SizedBox(height: 8),
        Container(
          width: isSmall ? 65 : 80,
          height: isSmall ? 55 : 65,
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFF90CAFF) : Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListWheelScrollView.useDelegate(
            itemExtent: isSmall ? 55 : 65,
            physics: const FixedExtentScrollPhysics(),
            controller: FixedExtentScrollController(initialItem: currentValue),
            onSelectedItemChanged: onChanged,
            childDelegate: ListWheelChildBuilderDelegate(
              builder: (context, index) {
                return Center(
                  child: Text(
                    index.toString().padLeft(2, '0'),
                    style: GoogleFonts.poppins(
                      fontSize: isSmall ? 24 : 32,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              },
              childCount: maxValue,
            ),
          ),
        ),
      ],
    );
  }
}
