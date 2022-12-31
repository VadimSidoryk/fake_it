import 'package:fake_it/fake_it.dart';
import 'package:fake_it/src/ranges.dart';

import 'negatives.dart';
import 'positives.dart';

final Range<int >ints =  SimpleRange.combine([
  negativeInts,
  positiveInts
]);

