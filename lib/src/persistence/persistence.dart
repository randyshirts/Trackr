import 'package:trackr/src/model/data_item.dart';

abstract class Persistence {
  Future<void> initialize();
  Future<void> insertItem(DataItem dataItem);
}
