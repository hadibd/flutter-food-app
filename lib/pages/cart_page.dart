import 'package:flutter/material.dart';
import 'package:food_app/const.dart';
import 'package:food_app/pages/home_page.dart';
import 'package:food_app/pages/main_page.dart';
import 'package:food_app/utils/functions.dart';
import 'package:food_app/widgets/colors.dart';

import '../network/network_helper.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int quantity = 1;
  var cartFood = [];

  @override
  void initState() {
    super.initState();
    getCartFood();
  }

  getCartFood() async {
    cartFood = await Network().getCartFood('email');
    // print(cartFood);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 0,
        backgroundColor: AppColor.bgColor,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.grey,
            ),
          )
        ],
      ),
      body: cartFood.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              constraints: const BoxConstraints.expand(),
              child: ListView.builder(
                  itemCount: cartFood.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      height: 120,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        NetworkImage(cartFood[index].image))),
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    cartFood[index].name,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.keyboard_control))
                                ],
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                cartFood[index].type,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\$ ${cartFood[index].price}',
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            quantity--;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.remove_circle,
                                          color: Colors.grey.shade700,
                                        ),
                                      ),
                                      Text(quantity.toString()),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (quantity > 1) {
                                              quantity++;
                                            }
                                          });
                                        },
                                        icon: Icon(
                                          Icons.add_circle,
                                          color: Colors.grey.shade700,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ))
                        ],
                      ),
                    );
                  }),
            ),
      bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
          decoration: BoxDecoration(
              color: Colors.grey.shade600,
              borderRadius:
                  const BorderRadius.only(topLeft: Radius.circular(32))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  child: Text('Total: \$120')),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                color: Colors.white,
                onPressed: () {},
                child: const Text('Checkout'),
              )
            ],
          )),
    );
  }
}
