import 'package:fake_it/src/abs.dart';
import 'package:fake_it/src/ranges.dart';

import 'negatives.dart';
import 'positives.dart';

final Range<double> doubles =  SimpleRange.combine([
  negativeDoubles,
  positiveDoubles
]);

