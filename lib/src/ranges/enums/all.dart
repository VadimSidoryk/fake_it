import 'package:fake_it/src/abs.dart';
import 'package:fake_it/src/ranges.dart';

Range<T> enums<T extends Enum>(List<T> values) => SimpleRange.fromList(values);