import 'package:dartz/dartz.dart';
import 'package:emantrimandal/domain/repository/local/itemDetails/itemsDetails.dart';
import '../../../core/error/failure.dart';
import '../base/local_base_usecase.dart';

class DeleteAllItemsDetailsUseCase extends BaseLocalUseCase<Unit, DefaultParams> {
  final ItemsDetailsLocalRepository itemsDetailsLocalRepository;

  DeleteAllItemsDetailsUseCase({required this.itemsDetailsLocalRepository});

  @override
  Future<Either<Failure, Unit>> call(DefaultParams param) async {
    return await itemsDetailsLocalRepository.deleteAllItemsDetails();
  }
}