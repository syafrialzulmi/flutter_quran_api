class SurahModel {
  final int nomor;
  final String nama;
  // ignore: non_constant_identifier_names
  final String nama_latin;
  // ignore: non_constant_identifier_names
  final int jumlah_ayat;
  // ignore: non_constant_identifier_names
  final String tempat_turun;
  final String arti;
  final String deskripsi;
  final String audio;

  SurahModel({
    required this.nomor,
    required this.nama,
    // ignore: non_constant_identifier_names
    required this.nama_latin,
    // ignore: non_constant_identifier_names
    required this.jumlah_ayat,
    // ignore: non_constant_identifier_names
    required this.tempat_turun,
    required this.arti,
    required this.deskripsi,
    required this.audio,
  });

  factory SurahModel.fromJson(Map<String, dynamic> json) {
    return SurahModel(
      nomor: json['nomor'],
      nama: json['nama'],
      nama_latin: json['nama_latin'],
      jumlah_ayat: json['jumlah_ayat'],
      tempat_turun: json['tempat_turun'],
      arti: json['arti'],
      deskripsi: json['deskripsi'],
      audio: json['audio'],
    );
  }
}
