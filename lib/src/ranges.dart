import 'package:fake_it/src/abs.dart';

class SimpleRange<T> extends Range<T> {
  const factory SimpleRange.fromList(List<T> variants) =
      SimpleRange<T>._;

  factory SimpleRange.combine(List<Range<T>> ranges) {
    return SimpleRange._(
        [for (Range<T> range in ranges) ...range.values]);
  }

  @override
  final List<T> values;

  const SimpleRange._(this.values);
}
