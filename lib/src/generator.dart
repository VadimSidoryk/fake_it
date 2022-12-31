import 'dart:math';

import 'package:fake_it/src/errors.dart';
import 'package:fake_it/src/ranges.dart';

import 'abs.dart';
import 'provider.dart';

class FakeItGeneratorImpl extends FakeItGenerator {

  final Map<Type, Range> _customRanges = {};

  @override
  void addProvider<T>(T Function(FakesProvider p1) provider,
      {int maxVariantsCount = 100}) {
    final List<T> variants = _generateVariantsImpl(provider, maxVariantsCount);
    final Range<T> range = SimpleRange.fromList(variants);
    _customRanges[T] = range;
  }

  @override
  Range<T> customRange<T>() {
    if (_customRanges.containsKey(T)) {
      return _customRanges[T]! as Range<T>;
    } else {
      throw MissingProviderException(T);
    }
  }

  List<T> _generateVariantsImpl<T>(
      T Function(FakesProvider p1) provider, int maxVariantsCount) {
    final result = <T>[];
    final random = Random();
    var maxFieldsVariants = 1;
    for (int i = 0; i < maxVariantsCount; i++) {
      if (i > maxFieldsVariants) {
        break;
      }
      result.add(provider.call(FakesProviderImpl(
          defaultRangeProvider: customRange,
          fieldsGenerator: (field) =>
              field.range.values[random.nextInt(field.range.values.length)],
          onField: (field) {
            if (i == 0) {
              maxFieldsVariants *= field.range.values.length;
            }
          })));
    }

    return result;
  }
}
