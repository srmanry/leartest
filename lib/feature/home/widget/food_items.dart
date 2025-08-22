import 'package:flutter/material.dart';

class FoodItemsWidgets extends StatelessWidget {
  final String foodImage;
  final String name;
  final double price;
  final bool isSelected;
  final VoidCallback onTap;

  const FoodItemsWidgets({
    super.key,
    required this.foodImage,
    required this.name,
    required this.price,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              foodImage,
              fit: BoxFit.cover,
              width: double.infinity,
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) {
                return Center(child: Icon(Icons.broken_image, size: 50));
              },
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          name,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          "€${price.toStringAsFixed(2)}",
          style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: onTap,
            style: OutlinedButton.styleFrom(
              backgroundColor: isSelected ? Colors.green : Colors.white,
              side: BorderSide(
                color: isSelected ? Colors.green : Colors.redAccent,
                width: 2,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
            ),
            child: Text(
              isSelected ? "Selected" : "Select ✔",
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.redAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
