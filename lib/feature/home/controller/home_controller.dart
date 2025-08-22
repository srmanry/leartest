import 'package:get/get.dart';

class Meal {
  String name;
  double price;
  RxBool isSelected;

  Meal({required this.name, required this.price, bool selected = false})
      : isSelected = selected.obs;
}

class MealController extends GetxController {
  // Map for day -> list of meals
  Map<int, List<Meal>> mealsByDay = {
    0: [
      Meal(name: "Pizza", price: 5.0),
      Meal(name: "Burger", price: 3.5),
    ],
    1: [
      Meal(name: "Pasta", price: 4.0),
      Meal(name: "Salad", price: 2.5),
    ],
    2: [
      Meal(name: "Sandwich", price: 3.0),
    ],
    // Add for other days
  };

  RxInt selectedDay = 0.obs;

  List<Meal> get meals => mealsByDay[selectedDay.value] ?? [];

  void toggleSelection(int index) {
    meals[index].isSelected.value = !meals[index].isSelected.value;
  }
}
