import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:emantrimandal/domain/entity/remote/get_meetings_items_entity/items_details.dart';
import 'package:meta/meta.dart';

import '../../../core/utils/singleton.dart';
import '../../../data/model/getMeetingsItemsModel/items_details_model.dart';
import '../../../domain/usecase/local/get_items_details_by_item_id_usecase.dart';

part 'item_details_event.dart';
part 'item_details_state.dart';

class ItemDetailsBloc extends Bloc<ItemDetailsEvent, ItemDetailsState> {

  GetItemsDetailsByItemIdUseCase _getItemsDetailsByItemIdUseCase;

  ItemDetailsBloc(this._getItemsDetailsByItemIdUseCase) : super(ItemDetailsInitial()) {
    on<GetItemsDetailsEvent>(getItemsDetailsEvent);
  }

  FutureOr<void> getItemsDetailsEvent(GetItemsDetailsEvent event, Emitter<ItemDetailsState> emit) async {
    emit(ItemDetailsLoadingState());
    final result = await _getItemsDetailsByItemIdUseCase.call(event.itemId);
    result.fold((error) {
      emit(ItemDetailsErrorState());
    }, (data) {
      emit(ItemDetailsSuccessState(data));
    },
    );
  }
}
