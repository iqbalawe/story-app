class ErrorMapper {
  static String getErrorMessage(String error) {
    final lowerError = error.toLowerCase();

    if (lowerError.contains('connection took longer') ||
        lowerError.contains('timeout') ||
        lowerError.contains('deadline exceeded')) {
      return 'Koneksi internet bermasalah atau server lambat merespon. Silakan periksa jaringanmu.';
    }

    if (lowerError.contains('socketexception') ||
        lowerError.contains('network is unreachable') ||
        lowerError.contains('connection errored') ||
        lowerError.contains('failed host lookup') ||
        lowerError.contains('connection refused')) {
      return 'Tidak ada koneksi internet. Pastikan wifi atau data seluler aktif.';
    }

    if (lowerError.contains('401') || lowerError.contains('unauthorized')) {
      return 'Sesi Anda telah berakhir. Silakan login kembali.';
    }

    if (lowerError.contains('404')) {
      return 'Data tidak ditemukan.';
    }

    if (lowerError.contains('500') || lowerError.contains('server error')) {
      return 'Terjadi masalah pada server kami. Silakan coba beberapa saat lagi.';
    }

    return 'Terjadi kesalahan: $error';
  }
}
