import 'package:pokedex_3/features/home/domain/entities/url_entity.dart';

class UrlMapper extends UrlEntity {
  UrlMapper(super.url);

  factory UrlMapper.fromMap(dynamic map) {
    return UrlMapper(map['url']);
  }
}
