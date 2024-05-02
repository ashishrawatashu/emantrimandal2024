
import '../../data/model/base/error_info.dart';
import '../constants/error_types.dart';

class AppError implements Exception {
  ErrorType type;
  ErrorInfo error;
  Exception cause;

  AppError({
    required this.cause,
    required this.error,
    required this.type,
  });
}
