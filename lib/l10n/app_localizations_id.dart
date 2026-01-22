// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get loginTagline => 'Masuk untuk membagikan momen Anda';

  @override
  String get registerTitle => 'Buat Akun';

  @override
  String get registerTagline =>
      'Daftar untuk membagikan cerita dengan teman-temanmu';

  @override
  String get registerName => 'Nama';

  @override
  String get email => 'Alamat Surel';

  @override
  String get password => 'Kata Sandi';

  @override
  String get authRegisterText => 'Belum punya akun?';

  @override
  String get authLoginText => 'Sudah punya akun?';

  @override
  String get titleLoginButton => 'Masuk';

  @override
  String get titleRegisterButton => 'Daftar';

  @override
  String get storyDescription => 'Deskripsi';

  @override
  String get addStory => 'Buat Cerita';

  @override
  String get uploadStory => 'Unggah Cerita';

  @override
  String get camera => 'Kamera';

  @override
  String get gallery => 'Galeri';

  @override
  String get postDetailTitle => 'Rincian Postingan';

  @override
  String get createdAt => 'Dibuat pada';

  @override
  String get addStoryTitle => 'Buat Cerita';

  @override
  String get addStoryDescription => 'Bagikan kisahmu...';

  @override
  String get errorNoInternet =>
      'Tidak ada koneksi internet. Pastikan wifi atau data seluler aktif.';

  @override
  String get errorTimeout =>
      'Koneksi internet bermasalah atau server lambat merespon.';

  @override
  String get errorServerError =>
      'Terjadi masalah pada server kami. Silakan coba beberapa saat lagi.';

  @override
  String get errorUnknown => 'Terjadi kesalahan yang tidak terduga.';

  @override
  String get refreshButtonText => 'Coba Lagi';

  @override
  String get logoutDialogText => 'Apakah anda yakin ingin keluar aplikasi?';

  @override
  String get yes => 'Ya';

  @override
  String get no => 'Tidak';

  @override
  String get likedButtonText => 'Anda menyukai cerita ini!';

  @override
  String get selectLocation => 'Pilih Lokasi';

  @override
  String get changeLocation => 'Ubah Lokasi';

  @override
  String get lockedFeatureInfo =>
      'Fitur lokasi hanya tersedia untuk versi berbayar (Paid).';

  @override
  String get selectImageValidation => 'Mohon pilih gambar terlebih dahulu';

  @override
  String get writeDescriptionValidation => 'Mohon isi deskripsi';

  @override
  String get address => 'Pilih lokasi dengan menekan peta';

  @override
  String get failedAddress => 'Gagal memuat peta';

  @override
  String get selectedLocation => 'Lokasi Terpilih';

  @override
  String get selectedLocationButtonText => 'Pilih Lokasi Ini';
}
