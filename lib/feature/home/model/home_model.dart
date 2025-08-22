import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Meal {
  final String label;
  final String name;
  final double price;
  final String image;
  RxBool isSelected = false.obs;

  Meal({
    required this.label,
    required this.name,
    required this.price,
    required this.image,
  });
}