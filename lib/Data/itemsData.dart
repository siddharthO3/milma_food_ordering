import 'package:milma_food_ordering/Models/itemWidget.dart';

DateTime currenttime = DateTime.now();
final itemW = [
  Item('assets/food1.jpg', 'Samosa',
      currenttime.add(const Duration(minutes: 10)), 4.5, 120, 20),
  Item('assets/food1.jpg', 'Omlet',
      currenttime.add(const Duration(minutes: 30)), 4, 130, 40),
  Item('assets/food1.jpg', 'Chole Bature',
      currenttime.add(const Duration(minutes: 60)), 3.5, 22, 80),
  Item('assets/food1.jpg', 'Aloo Paratha',
      currenttime.add(const Duration(minutes: 45)), 4.8, 66, 40),
  Item('assets/food1.jpg', 'MoMo', currenttime.add(const Duration(minutes: 30)),
      3.9, 91, 50),
];

List getShuffledItems() {
  List newItemW = itemW;
  newItemW.shuffle();
  return newItemW;
}
