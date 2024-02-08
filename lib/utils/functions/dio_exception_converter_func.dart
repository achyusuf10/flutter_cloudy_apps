import 'package:dio/dio.dart';

class DioExceptionConverterFunc {
  /// ## How To Use
  /// - DioException.call(dioException, errorDictionary: errorDictionary, sourceMessageError: sourceMessageError);
  /// - dioException = exception from dio
  /// - errorDictionary = error dictionary is used to convert error message from BE to error message that we want to show to user
  /// - sourceMessageError = source message error is used to get error message from BE
  ///
  /// ```dart
  /// DioException.call(
  ///   dioError,
  ///   sourceMessageError: dioException.response?.data['message'] ?? '',
  ///   errorDictionary: {
  ///     'invalid pin validation!': 'Pin yang anda masukkan salah',
  ///   },
  /// ),
  /// ```
  static String call(
    DioException dioException, {
    /// * Error dictionary is used to convert error message from BE to error message that we want to show to user
    Map<String, String> errorDictionary = const {},

    /// * Source message error is used to get error message from BE
    String sourceMessageError = '',
  }) {
    String errorMessage = '';

    /// * Checkking if error message from BE is exist in errorDictionary
    errorMessage = errorDictionary[sourceMessageError] ?? '';

    /// * If error message from BE is exist in errorDictionary, return error message
    if (errorMessage.isNotEmpty) return errorMessage;

    switch (dioException.type) {
      case DioExceptionType.cancel:
        errorMessage =
            'Maaf, permintaan ke server dibatalkan. Silahkan coba lagi.';
        break;
      case DioExceptionType.connectionTimeout:
        errorMessage =
            'Maaf, koneksi terputus karena waktu yang ditentukan telah habis. Silakan coba lagi.';
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage =
            'Maaf, waktu untuk menerima data telah habis. Silakan coba lagi.';
        break;
      case DioExceptionType.sendTimeout:
        errorMessage =
            'Maaf, permintaan tidak dapat terkirim karena waktu yang diberikan telah berakhir. Silakan coba lagi';
        break;
      case DioExceptionType.badResponse:
        errorMessage = handleStatusCode(dioException.response?.statusCode);
        break;
      case DioExceptionType.unknown:
        if ((dioException.message ?? '').contains('SocketException')) {
          errorMessage = 'Tidak ada koneksi internet. Silakan coba lagi.';
          break;
        }
        errorMessage =
            'Maaf, terjadi kesalahan yang tidak terduga. Silakan coba lagi.';
        break;
      default:
        errorMessage = 'Terjadi kesalahan pada sistem, silahkan coba lagi';
        break;
    }
    return errorMessage;
  }

  static String handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Maaf, permintaan tidak valid atau tidak dapat diproses. Silakan coba lagi.';
      case 401:
        return 'Maaf, otentikasi gagal. Silahkan coba lagi.';
      case 403:
        return 'Maaf, pengguna yang terotentikasi tidak diizinkan untuk mengakses titik API yang ditentukan. Silakan coba lagi.';
      case 404:
        return 'Maaf, sumber yang Anda cari tidak ditemukan (Error 404). Silakan coba lagi.';
      case 405:
        return 'Maaf, metode yang digunakan tidak diizinkan. Harap periksa header "Allow" untuk melihat metode HTTP yang diizinkan. Silakan coba lagi.';
      case 415:
        return 'Maaf, jenis media yang diminta tidak didukung. Jenis konten atau nomor versi yang diminta tidak valid. Silakan coba lagi.';
      case 422:
        return 'Maaf, validasi data gagal. Silakan coba lagi.';
      case 429:
        return 'Maaf, terlalu banyak permintaan. Silakan coba lagi.';
      case 500:
        return 'Maaf, terjadi kesalahan internal server. Silakan coba lagi.';
      default:
        return 'Maaf, terjadi kesalahan yang tidak terduga. Silakan coba lagi.';
    }
  }
}
