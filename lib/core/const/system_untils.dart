import 'package:flutter/foundation.dart';

void dprint(Object? obj) {
  if (kDebugMode) {
    print('$obj');
  }
}

extension SelectionSet on Set {
  Set selection(Object item) {
    contains(item) ? remove(item) : add(item);
    return this;
  }
}
