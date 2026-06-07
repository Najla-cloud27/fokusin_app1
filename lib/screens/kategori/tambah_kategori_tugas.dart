import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fokusin_app1/screens/kategori/list_kategori.dart';
import 'package:google_fonts/google_fonts.dart';

class TambahKategoriTugas extends StatefulWidget {
  const TambahKategoriTugas({Key? key}) : super(key: key);

  @override
  State<TambahKategoriTugas> createState() => _TambahKategoriTugasState();
}

class _TambahKategoriTugasState extends State<TambahKategoriTugas> {
  final TextEditingController _namaKategoriController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final List<Color> categoryColors = [
    const Color(0xFFF16E96),
    const Color(0xFFFC9390),
    const Color(0xFFAB82A4),
    const Color(0xFF7759A3),
    const Color(0xFF76BBC0),
    const Color(0xFF899064),
    const Color(0xFFDB3E8D),
    const Color(0xFFFFAFEC),
    const Color(0xFFF5C45D),
    const Color(0xFF66A4ED),
    const Color(0xFFA609F0),
    const Color(0xFF000180),
    const Color(0xFF006EE9),
    const Color(0xFF83E7FF),
    const Color(0xFFD1FFA4),
    const Color(0xFFB1C228),
    const Color(0xFF535C1D),
    const Color(0xFFFA6B41),
    const Color(0xFFFC3C31),
    const Color(0xFFFE8616),
    const Color(0xFFA7FE3D),
    const Color(0xFF00B6FF),
    const Color(0xFF2B6B6D),
    const Color(0xFF7B46F8),
  ];

  int? selectedColorIndex;

  @override
  void dispose() {
    _namaKategoriController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E4),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset(
              'assets/icons/arrow_back_blue.svg',
              width: 28,
              height: 28,
            ),
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: SizedBox(
              width: constraints.maxWidth > 600 ? 500 : double.infinity,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),

                            // INPUT SECTION
                            Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.topCenter,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 30),
                                  padding: const EdgeInsets.fromLTRB(
                                    20,
                                    40,
                                    20,
                                    20,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF229EFF),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Nama kategori',
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                      TextFormField(
                                        controller: _namaKategoriController,
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                        cursorColor: Colors.white,
                                        decoration: InputDecoration(
                                          hintText: 'Isi Kategori',
                                          hintStyle: GoogleFonts.poppins(
                                            color: Colors.white70,
                                            fontSize: 16,
                                          ),
                                          enabledBorder:
                                              const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.white,
                                                ),
                                              ),
                                          focusedBorder:
                                              const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.white,
                                                  width: 2,
                                                ),
                                              ),
                                          errorBorder:
                                              const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.yellowAccent,
                                                ),
                                              ),
                                          focusedErrorBorder:
                                              const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.yellowAccent,
                                                  width: 2,
                                                ),
                                              ),
                                          errorStyle: GoogleFonts.poppins(
                                            color: Colors.yellowAccent,
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value == null ||
                                              value.trim().isEmpty) {
                                            return 'Nama kategori tidak boleh kosong';
                                          }
                                          return null;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  child: Container(
                                    width: 60,
                                    height: 60,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF229EFF),
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xFFFFE085),
                                          blurRadius: 4,
                                          spreadRadius: 2,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        'assets/icons/logo_white.svg',
                                        width: 32,
                                        height: 32,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 32),

                            // LABEL PILIH WARNA
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF229EFF),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0xFFFFE085),
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Text(
                                "Pilih Warna",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),

                            // GRID WARNA
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 50,
                                    crossAxisSpacing: 12,
                                    mainAxisSpacing: 12,
                                    childAspectRatio: 1,
                                  ),
                              itemCount: categoryColors.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () => setState(
                                    () => selectedColorIndex = index,
                                  ),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    decoration: BoxDecoration(
                                      color: categoryColors[index],
                                      borderRadius: BorderRadius.circular(12),
                                      border: selectedColorIndex == index
                                          ? Border.all(
                                              color: Colors.black,
                                              width: 3,
                                            )
                                          : null,
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 40),
                          ],
                        ),
                      ),
                    ),

                    // TOMBOL SIMPAN
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(36),
                            border: Border.all(
                              color: const Color(0xFFFFCB33),
                              width: 2,
                            ),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // Menentukan warna yang dikirim. Jika user belum memilih,
                                // bisa ditentukan warna default (misalnya indeks 0 atau warna tertentu)
                                Color warnaTerpilih = selectedColorIndex != null
                                    ? categoryColors[selectedColorIndex!]
                                    : const Color(0xFF229EFF);

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => KategoriList(
                                      namaKategori:
                                          _namaKategoriController.text,
                                      warnaKategori:
                                          warnaTerpilih, // 👈 Kirim variabel warna ke file tujuan
                                    ),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF229EFF),
                              minimumSize: const Size(double.infinity, 46),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(34),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              'Simpan',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
