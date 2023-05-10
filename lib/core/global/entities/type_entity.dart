import 'package:flutter/material.dart';

class TypeEntity {
  TypeEnum element;

  TypeEntity(this.element);
}

enum TypeEnum {
  normal,
  fighting,
  flying,
  poison,
  ground,
  rock,
  bug,
  ghost,
  steel,
  fire,
  water,
  grass,
  electric,
  psychic,
  ice,
  dragon,
  dark,
  fairy,
  unknown,
  shadow;

  static createFromName(String name) {
    for (var type in values) {
      if (name.toLowerCase() == type.name) {
        return type;
      }
    }
  }

  Color getColor() {
    switch (this) {
      case TypeEnum.normal:
        return Colors.brown.shade200;
      case TypeEnum.flying:
        return Colors.grey.shade200;
      case TypeEnum.fighting:
        return Colors.brown.shade50;
      case TypeEnum.poison:
        return Colors.pink.shade200;
      case TypeEnum.ground:
        return Colors.brown;
      case TypeEnum.rock:
        return const Color.fromARGB(255, 29, 29, 29);
      case TypeEnum.bug:
        return Colors.greenAccent.shade100;
      case TypeEnum.ghost:
        return const Color.fromARGB(255, 67, 3, 119);
      case TypeEnum.steel:
        return Colors.brown.shade50;
      case TypeEnum.fire:
        return Colors.redAccent;
      case TypeEnum.water:
        return Colors.blueAccent;
      case TypeEnum.grass:
        return const Color.fromARGB(255, 147, 248, 151);
      case TypeEnum.electric:
        return Colors.yellow.shade200;
      case TypeEnum.psychic:
        return Colors.amber.shade200;
      case TypeEnum.ice:
        return Colors.lightBlue.shade200;
      case TypeEnum.dragon:
        return Colors.grey.shade300;
      case TypeEnum.dark:
        return const Color.fromARGB(255, 49, 2, 104);
      case TypeEnum.fairy:
        return Colors.pink.shade100;
      case TypeEnum.unknown:
        return const Color.fromARGB(255, 49, 2, 104);
      case TypeEnum.shadow:
        return Colors.black;
    }
  }
}
