import 'package:pokedex_3/core/global/entities/type_entity.dart';
import 'package:pokedex_3/features/home/domain/entities/url_entity.dart';

class UrlMapper extends UrlEntity {
  UrlMapper(super.url, super.name);

  factory UrlMapper.fromMap(dynamic map) {
    final pokemon = map['pokemon'];

    if (pokemon != null) {
      return UrlMapper(pokemon['url'], pokemon['name']);
    }

    return UrlMapper(map['url'], map['name']);
  }
}
