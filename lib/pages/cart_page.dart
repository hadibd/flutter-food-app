import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_app/const.dart';
import 'package:food_app/pages/main_page.dart';
import 'package:food_app/widgets/topbar_icon.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MainPage()));
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MainPage()));
            },
            icon: const Icon(
              Icons.home,
              color: Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.grey,
            ),
          )
        ],
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: ListView.builder(itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            height: 120,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(dummyImage))),
                  ),
                ),
                Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Title name this',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        const Text(
                          'Type',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '\$110',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
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
    );
  }
}
