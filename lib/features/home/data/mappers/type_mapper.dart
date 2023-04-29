import 'package:pokedex_3/features/home/domain/entities/type_entity.dart';

class TypeMapper extends TypeEntity {
  TypeMapper(super.element);

  factory TypeMapper.fromMap(dynamic map) {
    return TypeMapper(TypeEnum.createFromName(map['type']['name']));
  }
}
