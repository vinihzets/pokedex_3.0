class Mapper {
  toMap() {
    return {
      'name': name,
      'id': id,
      'weight': weight,
      'height': height,
      'sprites': {
        'other': {
          'official-artwork': {'front_default': sprite}
        }
      },
      'types': types.map((e) {
        final map = {
          'type': {'name': e.element.name}
        };
        return map;
      })
    };
  }
}
