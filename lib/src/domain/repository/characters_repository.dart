import 'package:dartz/dartz.dart';
import 'package:kdigital_test/src/domain/entities/charcter_with_page_entity.dart';
import 'package:kdigital_test/src/utils/failure.dart';

abstract class CharactersRepository {
  Future<Either<Failure, CharcterWithPageEntity>> getCharacters(int page);
}
