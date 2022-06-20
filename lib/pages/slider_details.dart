import 'package:flutter/material.dart';
import 'package:food_app/dimesion.dart';
import 'package:food_app/widgets/topbar_icon.dart';

import '../const.dart';

class SliderDetails extends StatefulWidget {
  const SliderDetails({Key? key}) : super(key: key);

  @override
  State<SliderDetails> createState() => _SliderDetailsState();
}

class _SliderDetailsState extends State<SliderDetails> {
  int quantity = 1;
  var description =
      'Veniam ut pariatur dolore ipsum cupidatat reprehenderit laboris excepteur dolore qui ut eu sint. Ad voluptate ut voluptate laboris. Irure pariatur magna consequat esse ex tempor. Pariatur irure non velit laborum aliquip mollit anim deserunt do labore in. Exercitation do in veniam cupidatat tempor incididunt ipsum quis. loUt eu voluptate dolor ut anim fugiat esse sint cillum aute duis. Magna in excepteur enim esse aliqua nisi cupidatat incididunt non incididunt laborum do eu magna. Magna nisi aliqua voluptate duis qui officia nisi ad dolore do cupidatat incididunt. Velit veniam sit anim tempor anim reprehenderit. Aliqua aliquip mollit ad consectetur irure fugiat mollit amet Lorem. Sunt duis mollit occaecat et consectetur. Minim adipisicing quis pariatur quis dolor ex sint ad esse.';

  late var firstHalf;
  var desButtonText = 'show more';
  bool isTextExpand = false;

  @override
  void initState() {
    super.initState();
    if (description.length < 200) {
      firstHalf = description;
      // secondHalf = '';
    } else {
      firstHalf = description.substring(0, 200);
      // secondHalf = description.substring(200, )
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          _buildCoverImage(),
          _buildTopBar(),
          _buildBodyContent()
        ]),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Color(0xff51E1ED),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                // padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          if (quantity > 1) {
                            quantity--;
                          }
                        });
                      },
                      child: const Text('-'),
                    ),
                    Text('$quantity'),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                      child: const Text('+'),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 24,
            ),
            Expanded(
                flex: 1,
                child: MaterialButton(
                  shape: StadiumBorder(),
                  // height: double.infinity,
                  color: Color(0xff207398),
                  onPressed: () {},
                  child: const Text('Add to cart',
                      style: TextStyle(color: Colors.white)),
                ))
          ],
        ),
      ),
    );
  }

  Positioned _buildBodyContent() {
    return Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        top: 200,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          height: 100,
          margin: const EdgeInsets.only(left: 0, right: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Chinese Side',
                style: TextStyle(
                    fontSize: Const.headerFontSize,
                    fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
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
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.location_on,
                        color: Colors.grey,
                        size: 16,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('14km', style: Const.subHeadingStyle),
                    ],
                  ),
                  Row(
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
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 12),
                child: const Text(
                  'Descriptions',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                  child: ListView(
                children: [
                  Text(isTextExpand ? description : firstHalf + '...'),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isTextExpand = !isTextExpand;
                          });
                        },
                        child: Text(isTextExpand ? 'show less' : 'show more'),
                      ),
                      Icon(isTextExpand
                          ? Icons.arrow_drop_up
                          : Icons.arrow_drop_down)
                    ],
                  )
                ],
              ))
            ],
          ),
        ));
  }

  Positioned _buildTopBar() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        width: double.infinity,
        // color: Colors.amber,
        margin: const EdgeInsets.all(16),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TopBarIcon(
                myIcon: Icons.arrow_back,
                onClick: () => Navigator.pop(context)),
            TopBarIcon(myIcon: Icons.shopping_cart, onClick: () {}),
          ],
        ),
      ),
    );
  }

  Positioned _buildCoverImage() {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      child: Container(
        height: 250,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(dummyImage))),
      ),
    );
  }
}
