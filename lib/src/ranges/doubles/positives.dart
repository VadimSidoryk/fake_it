import 'package:fake_it/src/abs.dart';
import 'package:fake_it/src/ranges.dart';

const Range<double> positiveDoubles =  SimpleRange.fromList(_values);

const _values = [
  0.0,
  1.0,
  100.0,
  5000.0,
  double.maxFinite
];