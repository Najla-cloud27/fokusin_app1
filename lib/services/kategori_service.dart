import 'package:dio/dio.dart';

class KategoriService {
  final Dio dio = Dio();

  Future getKategori() async {
    final response = await dio.get('http://10.0.2.2:8000/api/kategori');

    return response.data;
  }
}
