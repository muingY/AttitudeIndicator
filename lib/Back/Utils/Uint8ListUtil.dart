// ignore_for_file: file_names
import 'dart:typed_data';

Uint8List combineUint8List(Uint8List list1, Uint8List list2) {
  int newSize = list1.length + list2.length;
  Uint8List combined = Uint8List(newSize);

  combined.setRange(0, list1.length, list1);
  combined.setRange(list1.length, newSize, list2);

  return combined;
}
