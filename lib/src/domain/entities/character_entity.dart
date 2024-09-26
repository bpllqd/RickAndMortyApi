import 'package:equatable/equatable.dart';

import 'package:kdigital_test/src/data/models/character.dart';

class CharacterEntity extends Equatable {
  final String name;
  final String image;
  final String species;
  final String status;
  final String gender;
  const CharacterEntity({
    required this.name,
    required this.image,
    required this.species,
    required this.status,
    required this.gender,
  });

  CharacterEntity copyWith({
    String? name,
    String? image,
    String? species,
    String? status,
    String? gender,
  }) {
    return CharacterEntity(
      name: name ?? this.name,
      image: image ?? this.image,
      species: species ?? this.species,
      status: status ?? this.status,
      gender: gender ?? this.gender,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'species': species,
      'status': status,
      'gender': gender,
    };
  }

  factory CharacterEntity.fromMap(Map<String, dynamic> map) {
    return CharacterEntity(
      name: map['name'] as String,
      image: map['image'] as String,
      species: map['species'] as String,
      status: map['status'] as String,
      gender: map['gender'] as String,
    );
  }

  @override
  List<Object> get props {
    return [
      name,
      image,
      species,
      status,
      gender,
    ];
  }

  factory CharacterEntity.fromApiModel(Character model) {
    return CharacterEntity(
      name: model.name,
      image: model.image,
      species: model.species,
      status: model.status,
      gender: model.gender,
    );
  }
}
