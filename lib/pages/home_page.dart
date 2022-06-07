import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_app/const.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageViewController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Padding(
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
              ),
              SizedBox(
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
                    reverse: true,
                    autoPlay: false,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                  itemBuilder: (context, index, pageViewIndex) {
                    return Container(
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
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,
                              ),
                              height: 100,
                              margin:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Chinese Side',
                                    style: TextStyle(
                                        fontSize: Const.headerFontSize,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Row(
                                      children: [
                                        Wrap(
                                          children: List.generate(
                                            5,
                                            (index) => const Text(
                                              '⭐',
                                              style: Const.subHeadingStyle,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Text(
                                          '4.5',
                                          style: Const.subHeadingStyle,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          '128 comments',
                                          style: Const.subHeadingStyle,
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          child: Row(
                                        children: const [
                                          Icon(
                                            Icons.circle,
                                            color: Colors.grey,
                                            size: 16,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'Normal',
                                            style: Const.subHeadingStyle,
                                          ),
                                        ],
                                      )),
                                      Container(
                                          child: Row(
                                        children: const [
                                          Icon(
                                            Icons.location_on,
                                            color: Colors.grey,
                                            size: 16,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text('14km',
                                              style: Const.subHeadingStyle),
                                        ],
                                      )),
                                      Container(
                                          child: Row(
                                        children: const [
                                          Icon(
                                            Icons.timer_outlined,
                                            color: Colors.grey,
                                            size: 16,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '12min',
                                            style: Const.subHeadingStyle,
                                          ),
                                        ],
                                      )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: 5,
                ),
              ),
              SizedBox(
                child: DotsIndicator(
                  dotsCount: 5,
                  position: currentIndex.toDouble(),
                  decorator: DotsDecorator(
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 9.0),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
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
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'))),
                          ),
                        ),
                        Expanded(
                            flex: 4,
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              margin: EdgeInsets.symmetric(vertical: 10),
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
                                  const Text(
                                    'Chinese Side',
                                    style: TextStyle(
                                        fontSize: Const.headerFontSize,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8.0),
                                      child: Text('Thisd is a text')),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          child: Row(
                                        children: const [
                                          Icon(
                                            Icons.circle,
                                            color: Colors.grey,
                                            size: 16,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'Normal',
                                            style: Const.subHeadingStyle,
                                          ),
                                        ],
                                      )),
                                      Container(
                                          child: Row(
                                        children: const [
                                          Icon(
                                            Icons.location_on,
                                            color: Colors.grey,
                                            size: 16,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text('14km',
                                              style: Const.subHeadingStyle),
                                        ],
                                      )),
                                      Container(
                                          child: Row(
                                        children: const [
                                          Icon(
                                            Icons.timer_outlined,
                                            color: Colors.grey,
                                            size: 16,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '12min',
                                            style: Const.subHeadingStyle,
                                          ),
                                        ],
                                      )),
                                    ],
                                  )
                                ],
                              ),
                            ))
                      ],
                    ),
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
