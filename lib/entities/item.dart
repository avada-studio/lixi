import 'package:lixi/enums/item_type.dart';

class Item {
  String title;
  String message;
  ItemType type;
  int range;

  Item(this.title, this.message, this.type, this.range);
}