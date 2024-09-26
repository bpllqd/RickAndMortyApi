import 'package:dartz/dartz.dart';
import 'package:kdigital_test/src/domain/entities/character_entity.dart';
import 'package:kdigital_test/src/domain/entities/charcter_with_page_entity.dart';
import 'package:kdigital_test/src/domain/usecases/get_characters_usecase.dart';
import 'package:kdigital_test/src/presentation/bloc/main_event.dart';
import 'package:kdigital_test/src/presentation/bloc/main_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kdigital_test/src/utils/failure.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  final GetCharacters getCharactersUsecase;

  MainPageBloc(
    MainPageState initialState,
    this.getCharactersUsecase,
  ) : super(initialState) {
    on<GetTestDataOnMainPageEvent>(
      (event, emitter) => _getDataOnMainPageEvent(event, emitter),
    );
    on<LoadingDataOnMainPageEvent>(
      (event, emitter) => emitter(LoadingMainPageState()),
    );
  }

  Future<void> _getDataOnMainPageEvent(
    GetTestDataOnMainPageEvent event,
    Emitter<MainPageState> emit,
  ) async {
    emit(LoadingMainPageState());

    final Either<Failure, CharcterWithPageEntity> result =
        await getCharactersUsecase.call(event.page);

    await Future.delayed(Duration(milliseconds: 500));

    result.fold((failure) {
      emit(UnSuccessfulMainPageState(failure.message));
    }, (value) {
      emit(SuccessfulMainPageState(value.characters, value.page));
    });
  }
}
