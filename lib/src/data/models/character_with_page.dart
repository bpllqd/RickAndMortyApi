import 'package:kdigital_test/src/data/models/character.dart';

class CharacterWithPage {
  List<Character> characters;
  final int pages;

  CharacterWithPage({required this.characters, required this.pages});

  CharacterWithPage copyWith({
    List<Character>? characters,
    int? pages,
  }) {
    return CharacterWithPage(
      characters: characters ?? this.characters,
      pages: pages ?? this.pages,
    );
  }
}
