import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// 👇 1. Tambahkan class ini untuk membungkus data tanggal & pengulangan
class DatePickerResult {
  final DateTime date;
  final bool isRepeat;

  DatePickerResult({required this.date, required this.isRepeat});
}

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({Key? key}) : super(key: key);

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  bool isRepeat = false;
  final DateTime _today = DateTime.now();
  late DateTime _displayedMonth;
  late DateTime _selectedDate;
  final List<String> _monthNames = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember',
  ];

  @override
  void initState() {
    super.initState();
    _displayedMonth = DateTime(_today.year, _today.month, 1);
    _selectedDate = _today;
  }

  void _nextMonth() {
    setState(() {
      _displayedMonth = DateTime(
        _displayedMonth.year,
        _displayedMonth.month + 1,
        1,
      );
    });
  }

  void _prevMonth() {
    setState(() {
      _displayedMonth = DateTime(
        _displayedMonth.year,
        _displayedMonth.month - 1,
        1,
      );
    });
  }

  List<DateTime> _getDaysInMonth() {
    List<DateTime> days = [];
    int offset = _displayedMonth.weekday - 1;
    DateTime startOfGrid = _displayedMonth.subtract(Duration(days: offset));
    for (int i = 0; i < 42; i++) {
      days.add(startOfGrid.add(Duration(days: i)));
    }
    return days;
  }

  @override
  Widget build(BuildContext context) {
    String currentMonthName = _monthNames[_displayedMonth.month - 1];
    String currentYear = _displayedMonth.year.toString();

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFFFF9E6),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Icon(Icons.access_time_rounded, size: 24),
                const SizedBox(width: 12),
                Text(
                  "Ulang setiap hari",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Switch(
                  value: isRepeat,
                  onChanged: (val) => setState(() => isRepeat = val),
                  activeColor: Colors.white,
                  activeTrackColor: const Color(0xFF90CAFF),
                  inactiveThumbColor: Colors.grey,
                  inactiveTrackColor: Colors.grey.shade300,
                ),
              ],
            ),
            const Divider(color: Colors.black12, height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildArrowButton(Icons.chevron_left, _prevMonth),
                Text(
                  "$currentMonthName $currentYear",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                _buildArrowButton(Icons.chevron_right, _nextMonth),
              ],
            ),
            const SizedBox(height: 20),
            _buildDaysHeader(),
            const SizedBox(height: 10),
            _buildCalendarGrid(),
            const SizedBox(height: 30),

            // 👇 2. Cari bagian tombol 'Selesai' ini
            GestureDetector(
              onTap: () {
                // 👇 3. Ubah kembaliannya menggunakan DatePickerResult
                Navigator.pop(
                  context,
                  DatePickerResult(date: _selectedDate, isRepeat: isRepeat),
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

  Widget _buildArrowButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, size: 20),
      ),
    );
  }

  Widget _buildDaysHeader() {
    List<String> days = ['Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab', 'Min'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: days.map((day) {
        return Text(
          day,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: day == 'Min' ? Colors.red : const Color(0xFF229EFF),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCalendarGrid() {
    List<DateTime> dates = _getDaysInMonth();
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        childAspectRatio: 1.2,
      ),
      itemCount: dates.length,
      itemBuilder: (context, index) {
        DateTime date = dates[index];
        bool isCurrentMonth = date.month == _displayedMonth.month;
        bool isSelected =
            date.year == _selectedDate.year &&
            date.month == _selectedDate.month &&
            date.day == _selectedDate.day;
        bool isSunday = date.weekday == 7;

        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedDate = date;
              if (!isCurrentMonth) {
                _displayedMonth = DateTime(date.year, date.month, 1);
              }
            });
          },
          child: Center(
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: isSelected
                    ? Border.all(color: const Color(0xFF229EFF), width: 2)
                    : null,
              ),
              child: Center(
                child: Text(
                  date.day.toString(),
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: !isCurrentMonth
                        ? Colors.grey
                        : (isSunday ? Colors.red : Colors.black),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
