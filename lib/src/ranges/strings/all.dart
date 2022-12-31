import 'package:fake_it/src/abs.dart';
import 'package:fake_it/src/ranges.dart';

import 'firstnames.dart';
import 'guids.dart';
import 'usernames.dart';

final Range<String> strings =
    SimpleRange.combine([firstNames, guids, userNames]);
