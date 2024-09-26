import 'package:equatable/equatable.dart';
import 'package:kdigital_test/src/domain/entities/character_entity.dart';

abstract class MainPageState extends Equatable {}

class InitialMainPageState extends MainPageState {
  @override
  List<Object> get props => [];
}

class LoadingMainPageState extends MainPageState {
  @override
  List<Object> get props => [];
}

class UnSuccessfulMainPageState extends MainPageState {
  final String errorDescription;

  UnSuccessfulMainPageState(this.errorDescription);

  @override
  List<Object> get props => [];
}

class SuccessfulMainPageState extends MainPageState {
  final List<CharacterEntity> characters;
  final int page;

  SuccessfulMainPageState(this.characters, this.page);

  @override
  List<Object> get props => [characters];
}
