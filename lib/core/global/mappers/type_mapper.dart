import 'package:pokedex_3/core/global/entities/type_entity.dart';

class TypeMapper extends TypeEntity {
  TypeMapper(super.element);

  factory TypeMapper.fromMap(dynamic map) {
    return TypeMapper(TypeEnum.createFromName(map['type']['name']));
  }
}
