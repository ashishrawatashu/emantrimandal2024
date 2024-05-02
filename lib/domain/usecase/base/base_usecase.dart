import 'package:either_dart/either.dart';

import '../../../core/error/base_error.dart';

abstract class BaseUseCase<E extends BaseError, P, T> {
  Future<Either<E, T>> execute({
    required P params,
  });
}
