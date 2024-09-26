import 'package:kdigital_test/src/data/models/character.dart';
import 'package:kdigital_test/src/domain/entities/character_entity.dart';

class CharacterMapper {
  static CharacterEntity toEntityFromModel(Character model) {
    return CharacterEntity.fromApiModel(model);
  }
}
