import 'package:flutter/material.dart';
import 'package:food_delivery_project/components/my_button.dart';
import 'package:food_delivery_project/components/my_cart_tile.dart';
import 'package:food_delivery_project/models/restaurant.dart';
import 'package:food_delivery_project/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        //cart
        final userCart = restaurant.cart;

        //scaffold UI
        return Scaffold(
          appBar: AppBar(
            title: const Text("Cart"),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              //clear cart button
              IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text(
                            "Are you sure you want to clear the cart?"),
                        actions: [
                          //cancel Button
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Cancel")),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                restaurant.clearCart();
                              },
                              child: const Text("Yes"))

                          //yes button
                        ],
                      ),
                    );
                  },
                  icon: Icon(Icons.delete)),

              //IconButton
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: Column(
                  children: [

                    //list of cart

                    userCart.isEmpty
                        ? const Expanded(
                            child: Center(
                              child: Text("Cart is empty..."),
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                                itemCount: userCart.length,
                                itemBuilder: (context, index) {
                                  //get invidual cart item
                                  final cartItem = userCart[index];

                                  //return cart tile UI
                                  return MyCartTile(cartItem: cartItem);
                                }),
                          ),
                  ],
                ),
              ),
              //button to pay
              MyButton(
                text: "Go to checkout",
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(
                  builder: (context) => const PaymentPage(),
                ),
                ),
              ),
              const SizedBox(height: 25,)
            ],
          ),
        );
      },
    );
  }
}
