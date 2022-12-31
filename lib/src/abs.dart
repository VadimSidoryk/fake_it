import 'package:equatable/equatable.dart';

typedef FieldsGenerator = dynamic Function(FieldToGenerate);

abstract class FakeItGenerator {
  void addProvider<T>(T Function(FakesProvider) provider);

  Range<T> customRange<T>();

  // Future<List<T>> list<T>();

  // Stream<T> stream<T>();
}

abstract class Range<T> {
  const Range();

  List<T> get values;

  Type get type => T;
}

abstract class FakesProvider {
  T get<T>(Range<T> range);
}

class FieldToGenerate<T> extends Equatable {
  final int index;
  final Range<T> range;

  FieldToGenerate(
      {required this.index, required this.range});

  @override
  List<Object?> get props => [index, range];
}

