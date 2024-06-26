import '../../data/model/base/error_info.dart';
import '../constants/error_types.dart';
import 'app_error.dart';
import 'base_error.dart';

class LocalError extends BaseError {
  LocalError({
    required String message,
    required int localError,
    required Exception cause,
  }) : super(
            error: ErrorInfo(message: message, code: localError), cause: cause);

  @override
  String getFriendlyMessage() {
    return "${error.message}";
  }

  @override
  AppError transform() {
    switch (error.code) {
      case 1:
        return AppError(error: error, cause: cause, type: ErrorType.UI);

      case 1212:
        return AppError(
            error: error, cause: cause, type: ErrorType.DEVICE_NOT_COMPATIBLE);

      default:
        return AppError(
            error: error, cause: cause, type: ErrorType.IOEXCEPTION);
    }
  }
}
