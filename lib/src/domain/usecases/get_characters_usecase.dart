import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kdigital_test/src/domain/entities/charcter_with_page_entity.dart';
import 'package:kdigital_test/src/domain/repository/characters_repository.dart';
import 'package:kdigital_test/src/utils/failure.dart';

@injectable
class GetCharacters {
  final CharactersRepository repository;

  GetCharacters({required this.repository});

  Future<Either<Failure, CharcterWithPageEntity>> call(int page) async {
    return await repository.getCharacters(page);
  }
}
