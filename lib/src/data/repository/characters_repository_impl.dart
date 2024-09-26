import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kdigital_test/src/data/datasources/remote/characters_remote_datasource.dart';
import 'package:kdigital_test/src/data/models/character_mapper.dart';
import 'package:kdigital_test/src/domain/entities/character_entity.dart';
import 'package:kdigital_test/src/domain/entities/charcter_with_page_entity.dart';
import 'package:kdigital_test/src/domain/repository/characters_repository.dart';
import 'package:kdigital_test/src/utils/exceptions.dart';
import 'package:kdigital_test/src/utils/failure.dart';

@Injectable(as: CharactersRepository)
class CharactersRepositoryImpl implements CharactersRepository {
  final CharactersRemoteDatasource _api;

  CharactersRepositoryImpl({required CharactersRemoteDatasource api})
      : _api = api;

  @override
  Future<Either<Failure, CharcterWithPageEntity>> getCharacters(
      int page) async {
    try {
      final apiResult = await _api.getCharacters(page);
      final List<CharacterEntity> characters = List.of(apiResult.characters)
          .map((value) => CharacterMapper.toEntityFromModel(value))
          .toList();

      return Right(CharcterWithPageEntity(
          characters: characters, page: apiResult.pages));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
