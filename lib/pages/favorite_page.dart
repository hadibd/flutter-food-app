import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/network/network_helper.dart';
import 'package:food_app/utils/functions.dart';
import 'package:food_app/widgets/colors.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  var data = [];

  @override
  void initState() {
    super.initState();

    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Center(
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: FaIcon(
              FontAwesomeIcons.arrowLeft,
              color: AppColor.widgetColor,
            ),
          ),
        ),
        backgroundColor: AppColor.bgColor,
        actions: [
          Center(
            child: FaIcon(
              FontAwesomeIcons.cartShopping,
              color: AppColor.widgetColor,
            ),
          ),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      backgroundColor: AppColor.bgColor,
      body: data.isEmpty
          ? const Center(
              child: CircularProgressIndicator(color: Colors.grey),
            )
          : Container(
              margin: const EdgeInsets.all(16),
              child: GridView.builder(
                  itemCount: data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      childAspectRatio: 200 / 250),
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          height: 300,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              data[index].image)))),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                data[index].name,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                data[index].description,
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\$${data[index].price}',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Network().addToCart(
                                          'email', data[index].id, '1');
                                      Functions.showSnackbar(
                                          context, 'Adde to cart');
                                    },
                                    child: FaIcon(
                                      FontAwesomeIcons.basketShopping,
                                      size: 20,
                                      color: AppColor.widgetColor,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                              onPressed: () {
                                print(data[index].id);
                                Network()
                                    .removeItmeFromFav('email', data[index].id);
                                data.clear;
                                getData();
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.cancel,
                                color: Colors.grey.shade100,
                              )),
                        )
                      ],
                    );
                  }),
            ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: MaterialButton(
            shape: const StadiumBorder(),
            color: AppColor.buttonColor,
            onPressed: () {},
            child: const Text(
              'Remove all 16 item(s)',
              style: TextStyle(color: Colors.white),
            )),
      ),
    ));
  }

  void getData() async {
    data = await Network().getFavoriteFood('email');
    setState(() {});
  }
}
