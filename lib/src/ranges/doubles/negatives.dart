import 'package:fake_it/src/abs.dart';
import 'package:fake_it/src/ranges.dart';

const Range<double> negativeDoubles = SimpleRange.fromList(_values);

const _values = <double>[
  -double.maxFinite,
  -5000,
  -100,
  -1
];