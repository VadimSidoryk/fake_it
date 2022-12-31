import 'package:equatable/equatable.dart';
import 'package:fake_it/src/generator.dart';
import 'package:fake_it/src/ranges.dart';
import 'package:fake_it/src/ranges/collections/lists.dart';
import 'package:fake_it/src/ranges/doubles/all.dart';
import 'package:fake_it/src/ranges/doubles/positives.dart';
import 'package:fake_it/src/ranges/enums/all.dart';
import 'package:fake_it/src/ranges/ints/positives.dart';
import 'package:fake_it/src/ranges/strings/all.dart';
import 'package:fake_it/src/ranges/strings/usernames.dart';

void main() {
  EquatableConfig.stringify = true;

  final factory = FakeItGeneratorImpl();
  factory.addProvider((p1) => _Weapon(p1.get(doubles), p1.get(strings)), maxVariantsCount: 10);
  factory.addProvider((p1) => _Armor(p1.get(strings), p1.get(doubles)), maxVariantsCount: 10);
  factory.addProvider((p1) => _Character(
      p1.get(userNames),
      p1.get(positiveInts),
      p1.get(positiveDoubles),
      p1.get(enums(Class.values)),
      p1.get(lists(SimpleRange.combine(
          [factory.customRange<_Weapon>(), factory.customRange<_Armor>()])))), maxVariantsCount: 20);
  print("Weapons variants===========================================");
  factory.customRange<_Weapon>().values.forEach((element) {
    print(element);
  });
  print("Armor variants===========================================");
  factory.customRange<_Armor>().values.forEach((element) {
    print(element);
  });
  print("Character variants===========================================");
  factory.customRange<_Character>().values.forEach((element) {
    print(element);
  });
}

enum Class { warrior, archer, mage }

class _Character extends Equatable {
  final String userName;
  final int level;
  final double str;
  final Class gameClass;
  final List<_Item> inventory;

  double get defence {
    return str +
        inventory
            .whereType<_Armor>()
            .map((e) => e.defence)
            .reduce((value, element) => value + element);
  }

  double get attack {
    return str +
        inventory
            .whereType<_Weapon>()
            .map((e) => e.dmg)
            .reduce((value, element) => value + element);
  }

  _Character(
      this.userName, this.level, this.str, this.gameClass, this.inventory);

  @override
  List<Object?> get props => [userName, level, str, gameClass, inventory];
}

abstract class _Item extends Equatable {
  String get name;
}

class _Weapon extends _Item {
  @override
  final String name;
  final double dmg;

  _Weapon(this.dmg, this.name);

  @override
  List<Object?> get props => [name, dmg];
}

class _Armor extends _Item {
  @override
  final String name;
  final double defence;

  _Armor(this.name, this.defence);

  @override
  List<Object?> get props => [name, defence];
}
