import 'dart:convert';

import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:kdigital_test/src/data/models/character.dart';
import 'package:kdigital_test/src/data/models/character_with_page.dart';
import 'package:kdigital_test/src/utils/exceptions.dart';

abstract class CharactersRemoteDatasource {
  Future<CharacterWithPage> getCharacters(int page);
}

@Injectable(as: CharactersRemoteDatasource)
class CharactersRemoteDatasourceImpl implements CharactersRemoteDatasource {
  final Client client;

  CharactersRemoteDatasourceImpl(this.client);

  @override
  Future<CharacterWithPage> getCharacters(int page) async {
    final charResult = await client.get(
      Uri.parse("https://rickandmortyapi.com/api/character/?page=$page"),
    );

    if (charResult.statusCode != 200) {
      throw ServerException('Error fetching data: ${charResult.body}');
    }

    final jsonMap = await json.decode(charResult.body) as Map<String, dynamic>;

    if (jsonMap["results"] == null) {
      throw ServerException('No data from server: ${charResult.body} is null');
    }

    final characters = List<Character>.from(
      (jsonMap["results"] as List<dynamic>).map(
        (value) => Character.fromJson(value),
      ),
    );

    final pages = jsonMap["info"]["pages"] as int;

    return CharacterWithPage(characters: characters, pages: pages);
  }
}
