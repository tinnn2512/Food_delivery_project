import 'package:flutter/material.dart';
import 'package:food_delivery_project/components/my_button.dart';
import 'package:food_delivery_project/main.dart';
import 'package:food_delivery_project/models/food.dart';
import 'package:food_delivery_project/models/restaurant.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addons, bool> selectedAddons = {};
  FoodPage({
    super.key,
    required this.food,
  }) {
    //initialize selected addons to be false
    for (Addons addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  //method to add to cart
  void addToCart(Food food, Map<Addons, bool> selectedAddons) {

    //close the current food page to go back to menu
    Navigator.pop(context);

    //format the selected addons

    List<Addons> currentlySelectedAddons = [];
    for (Addons addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }
    //add to cart
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Scaffold UI
        Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    // Food image
                    Image.asset(widget.food.imagePath),

                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Food name
                          Text(
                            widget.food.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),

                          // Food price
                          Row(
                            children: [
                              Text(
                                '\$${widget.food.price}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),

                          // Food description
                          Text(widget.food.description),
                          const SizedBox(height: 10),

                          Divider(
                              color: Theme.of(context).colorScheme.secondary),
                          const SizedBox(height: 10),

                          // Add-ons
                          Text(
                            "Add-ons",
                            style: TextStyle(
                              color:
                              Theme.of(context).colorScheme.inversePrimary,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),

                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemCount: widget.food.availableAddons.length,
                              itemBuilder: (context, index) {
                                // Get individual addon
                                Addons addon =
                                widget.food.availableAddons[index];

                                // Return checkbox UI
                                return CheckboxListTile(
                                  title: Text(addon.name),
                                  subtitle: Text(
                                    '\$${addon.price}',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                  ),
                                  value: widget.selectedAddons[addon],
                                  onChanged: (bool? value) {
                                    setState(() {
                                      widget.selectedAddons[addon] = value!;
                                    });
                                    // Handle checkbox change
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Button --> Add to cart
                    MyButton(
                      onTap: () => addToCart(widget.food, widget.selectedAddons) ,
                      text: 'Add to cart',
                    ),

                    const SizedBox(height: 25),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Back button
        Positioned(
          top: 40,
          left: 10,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_rounded),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ],
    );
  }
}
