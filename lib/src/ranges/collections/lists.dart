import 'package:fake_it/src/abs.dart';

Range<List<T>> lists<T>(Range<T> itemsProvider) {
  return ListsVariantsRange._(itemsProvider.values);
}

class ListsVariantsRange<T> extends Range<List<T>> {
  final List<T> itemValues;

  ListsVariantsRange._(this.itemValues);

  Type get itemsType => T;

  @override
  List<List<T>> get values {
    return [
      [],
      [itemValues.first],
      itemValues
    ];
  }
}
