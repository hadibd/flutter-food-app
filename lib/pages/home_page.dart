// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/const.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:food_app/network/network_helper.dart';
import 'package:food_app/pages/favorite_page.dart';
import 'package:food_app/pages/food_details.dart';
import 'package:food_app/pages/profile_page.dart';
import 'package:food_app/pages/slider_details.dart';
import 'package:food_app/utils/functions.dart';
import 'package:food_app/widgets/colors.dart';
import 'package:food_app/widgets/floating_card.dart';

import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageViewController = PageController();
  int currentIndex = 0;
  int currentPageIndex = 0;
  var data = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    data = await Network().getDataByQuery();
    setState(() {});
    for (var i = 0; i < data.length; i++) {
      // print(data[i].name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: data == null
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  _buildTopBar(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildSlider(),
                          _buildIndicator(),
                          _buildSuggestedFood()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            if (index == 0) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            } else if (index == 1) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FavoritePage()));
            } else if (index == 2) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartPage()));
            } else {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()));
            }
            // setState(() {
            //   currentPageIndex = index;
            // });
          },
          currentIndex: currentPageIndex,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorite'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Cart'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }

  SizedBox _buildIndicator() {
    return SizedBox(
      height: 30,
      child: DotsIndicator(
        dotsCount: 5,
        position: currentIndex.toDouble(),
        decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0))),
      ),
    );
  }

  SizedBox _buildSlider() {
    return SizedBox(
      height: 220,
      width: double.infinity,
      // color: Colors.yellow,
      child: CarouselSlider.builder(
        // controller: pageViewController,

        options: CarouselOptions(
          height: 400,
          onPageChanged: (index, _) {
            setState(() {
              currentIndex = index;
            });
          },
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),

        itemBuilder: (context, index, pageViewIndex) {
          return InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const SliderDetails()));
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              height: double.infinity,
              child: Stack(
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')),
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.green,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: FloatingCard(
                      title: 'Chinese Side $index',
                      time: '15',
                      comments: '128',
                      type: 'Normal',
                      distance: '15km',
                      ratings: '5',
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }

  Padding _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Bangladesh',
                style: TextStyle(color: Colors.grey),
              ),
              Row(
                children: const [
                  Text(
                    'Rangpur',
                    style: Const.subHeadingStyle,
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey,
                  )
                ],
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade300),
            child: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSuggestedFood() {
    return SizedBox(
        height: 15 * (130 + 16),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FoodDetails(
                        name: data[index].name,
                        price: data[index].price,
                        image: data[index].image,
                        description: data[index].description,
                        id: data[index].id,
                      ),
                    ));
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                height: 130,
                decoration: BoxDecoration(
                    // color: Colors.amber,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    data[index].image ?? dummyImage))),
                      ),
                    ),
                    Expanded(
                        flex: 4,
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(16),
                                topRight: Radius.circular(16)),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data[index].name,
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: Const.headerFontSize,
                                    fontWeight: FontWeight.w500),
                              ),
                              Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    data[index].description,
                                    style: const TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                  )),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const FaIcon(
                                        FontAwesomeIcons.dollarSign,
                                        color: Colors.grey,
                                        size: 16,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        data[index].price,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      var scaffold =
                                          ScaffoldMessenger.of(context);
                                      scaffold.showSnackBar(SnackBar(
                                          backgroundColor: AppColor.bgColor,
                                          action: SnackBarAction(
                                              label: 'X',
                                              onPressed: () {
                                                scaffold.hideCurrentSnackBar();
                                              }),
                                          content: const Text(
                                            'Succesfully added to cart',
                                            style: TextStyle(
                                                color: Colors.black54),
                                          )));
                                      // print('object');
                                    },
                                    child: InkWell(
                                      onTap: () {
                                        Network().addToCart(
                                            'email', data[index].id, 1);
                                        Functions.showSnackbar(
                                            context, 'Addet to cart!');
                                      },
                                      child: FaIcon(
                                        FontAwesomeIcons.cartShopping,
                                        size: 20,
                                        color: AppColor.widgetColor,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            );
          },
        ));
  }
}
