import 'package:fake_it/fake_it.dart';
import 'package:fake_it/src/ranges.dart';

const Range<bool> booleans = SimpleRange.fromList(_values);

const _values = [
  true,
  false
];