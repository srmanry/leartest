import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class HomeScreenView extends StatelessWidget {
   HomeScreenView({super.key});
  final MealController controller = Get.put(MealController());
  final List<String> days = ["Saturday","Sunday","Monday", "Tuesday", "Wednesday", "Thursday", "Friday"];
  final RxInt selectedDay = 3.obs;
  @override
  Widget build(BuildContext context) {
return




        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            elevation: 0,
            toolbarHeight: 100,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Preissler's Lunch",
                        style: TextStyle(fontWeight: FontWeight.w800,fontSize: 28, color: Colors.black)),
                    SizedBox(height: 4),
                    Text("Please Order Until 9 AM",
                        style: TextStyle(fontSize: 16, color: Color(0xFFF30000,))),
                  ],
                ),
               CircleAvatar(
                 radius: 30,
                 backgroundColor: Colors.black12,
                 child:  Icon(Icons.location_city,size: 30,),)
               // ClipRRect(borderRadius: BorderRadius.circular(48),child: Image.asset("",height: 48,width: 48,)),
              ],
            ),
          ),
          body: Column(
            children: [
              // Day Tabs
              Obx(() => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(days.length, (index) {
                    bool isActive = selectedDay.value == index;
                    return GestureDetector(
                      onTap: () => selectedDay.value = index,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: isActive ? Colors.redAccent : Colors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          days[index],
                          style: TextStyle(
                            color: isActive ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              )),
              SizedBox(height: 10),

              Expanded(
                child: Obx(() {
                  var meals = controller.meals;
                  if (meals.isEmpty) {
                    return Center(child: Text("No Data Found"));
                  }
                  return GridView.builder(
                    padding: EdgeInsets.all(10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.55,
                    ),
                    itemCount: meals.length,
                    itemBuilder: (context, index) {
                      final meal = meals[index];
                      return Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  "https://images.theconversation.com/files/368263/original/file-20201109-22-lqiq5c.jpg",
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              meal.name,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              "€${meal.price.toStringAsFixed(2)}",
                              style: TextStyle(color: Colors.redAccent),
                            ),
                            SizedBox(height: 8),
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: () => controller.toggleSelection(index),
                                style: OutlinedButton.styleFrom(
                                  backgroundColor:
                                  meal.isSelected.value ? Colors.green : Colors.white,
                                  side: BorderSide(
                                    color: meal.isSelected.value
                                        ? Colors.green
                                        : Colors.redAccent,
                                    width: 2,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                ),
                                child: Text(
                                  meal.isSelected.value ? "Selected" : "Select ✔",
                                  style: TextStyle(
                                    color:
                                    meal.isSelected.value ? Colors.white : Colors.redAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }),
              ),


              // Meals Grid
              // Expanded(
              //   child: LayoutBuilder(
              //     builder: (context, constraints) {
              //       double width = constraints.maxWidth;
              //       int crossAxisCount = width < 600 ? 3 : 3;
              //       double spacing = 10;
              //       double childAspect = 0.55;
              //
              //       return Obx(
              //             () =>
              //                 selectedDay.value==0?
              //                 GridView.builder(
              //           padding: EdgeInsets.all(spacing),
              //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //             crossAxisCount: crossAxisCount,
              //             crossAxisSpacing: spacing,
              //             mainAxisSpacing: spacing,
              //             childAspectRatio: childAspect,
              //           ),
              //           itemCount: controller.meals.length,
              //           itemBuilder: (context, index) {
              //             final meal = controller.meals[index];
              //
              //             return Container(
              //               padding: EdgeInsets.all(8),
              //               decoration: BoxDecoration(
              //                 color: Colors.white,
              //                 borderRadius: BorderRadius.circular(12),
              //                 boxShadow: [
              //                   BoxShadow(
              //                     color: Colors.black26,
              //                     blurRadius: 4,
              //                     offset: Offset(2, 2),
              //                   ),
              //                 ],
              //               ),
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Expanded(
              //                     child: ClipRRect(
              //                       borderRadius: BorderRadius.circular(8),
              //                       child: Image.network(
              //                         "https://images.theconversation.com/files/368263/original/file-20201109-22-lqiq5c.jpg?ixlib=rb-4.1.0&rect=10%2C0%2C6699%2C4476&q=45&auto=format&w=926&fit=clip",
              //                         fit: BoxFit.cover,
              //                         height: 70,
              //                         width: double.infinity,
              //                         loadingBuilder: (context, child, progress) {
              //                           if (progress == null) return child;
              //                           return Center(child: CircularProgressIndicator());
              //                         },
              //                         errorBuilder: (context, error, stackTrace) {
              //                           return Center(child: Icon(Icons.broken_image, size: 50));
              //                         },
              //                       ),
              //                     ),
              //                   ),
              //                   SizedBox(height: 8),
              //                   Text(
              //                     meal.name,
              //                     style: TextStyle(
              //                         fontWeight: FontWeight.bold,
              //                         fontSize: 16,
              //                         color: Colors.black),
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   Text(
              //                     "€${meal.price.toStringAsFixed(2)}",
              //                     style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w500),
              //                   ),
              //                   SizedBox(height: 8),
              //                   Obx(
              //                         () => SizedBox(
              //                       width: double.infinity,
              //                       child: OutlinedButton(
              //                         onPressed: () => controller.toggleSelection(index),
              //                         style: OutlinedButton.styleFrom(
              //                           backgroundColor: meal.isSelected.value ? Colors.green : Colors.white,
              //                           side: BorderSide(
              //                             color: meal.isSelected.value ? Colors.green : Colors.redAccent,
              //                             width: 2,
              //                           ),
              //                           shape: RoundedRectangleBorder(
              //                               borderRadius: BorderRadius.circular(6)),
              //                         ),
              //                         child: Text(
              //                           meal.isSelected.value ? "Selected" : "Select  ✓",
              //                           style: TextStyle(
              //                             color: meal.isSelected.value ? Colors.white : Colors.redAccent,
              //                             fontWeight: FontWeight.bold,
              //                           ),
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             );
              //           },
              //         ):Text("Not Data F")
              //       );
              //     },
              //   ),
              // ),


              // Next Button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {
                    var selected = controller.meals.where((m) => m.isSelected.value).toList();
                    Get.snackbar("Order", "You selected ${selected.length} meals");
                  },
                  child: Text("Next ➝", style: TextStyle(color: Colors.white)),
                ),
              )
            ],
          ),

        );


  }
}






