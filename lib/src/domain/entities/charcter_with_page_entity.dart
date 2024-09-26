import 'package:equatable/equatable.dart';
import 'package:kdigital_test/src/domain/entities/character_entity.dart';

class CharcterWithPageEntity extends Equatable {
  final List<CharacterEntity> characters;
  final int page;

  CharcterWithPageEntity({required this.characters, required this.page});

  CharcterWithPageEntity copyWith({
    List<CharacterEntity>? characters,
    int? page,
  }) {
    return CharcterWithPageEntity(
      characters: characters ?? this.characters,
      page: page ?? this.page,
    );
  }

  @override
  List<Object?> get props => [
        characters,
        page,
      ];
}
