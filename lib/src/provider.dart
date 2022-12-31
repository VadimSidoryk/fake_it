import 'package:fake_it/src/abs.dart';

class FakesProviderImpl extends FakesProvider {
  final Range<T> Function<T>() defaultRangeProvider;
  final FieldsGenerator? fieldsGenerator;
  final Function(FieldToGenerate)? onField;
  int fieldIndex = 0;

  FakesProviderImpl(
      {required this.defaultRangeProvider, required this.fieldsGenerator, this.onField});

  @override
  T get<T>(Range<T> range) {
    return _getImpl(range);
  }

  T _getImpl<T>(
    Range<T> range,
  ) {
    final fieldToGenerate = FieldToGenerate(index: fieldIndex++, range: range);
    onField?.call(fieldToGenerate);
    final result = fieldsGenerator!.call(fieldToGenerate);
    return result;
  }
}
