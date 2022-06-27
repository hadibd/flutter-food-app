import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/const.dart';
import 'package:food_app/widgets/colors.dart';

import '../network/network_helper.dart';
import '../utils/functions.dart';
import '../widgets/topbar_icon.dart';

class FoodDetails extends StatefulWidget {
  const FoodDetails(
      {Key? key,
      required this.name,
      required this.price,
      required this.description,
      required this.id,
      required this.image})
      : super(key: key);

  final name, price, description, id, image;

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  int quantity = 1;
  var description;

  late var firstHalf;
  var desButtonText = 'show more';
  bool isTextExpand = false;

  @override
  void initState() {
    description = widget.description;
    super.initState();
    if (description.length < 200) {
      firstHalf = description;
      // secondHalf = '';
    } else {
      firstHalf = description.substring(0, 200);
      // secondHalf = description.substring(200, )
    }
    print(widget.id);
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
                  shape: const StadiumBorder(),
                  // height: double.infinity,
                  color: AppColor.buttonColorDark,
                  onPressed: () {
                    Network().addToCart('email', widget.id, quantity);
                    Functions.showSnackbar(context, 'Added to cart');
                  },
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(
                        fontSize: Const.headerFontSize,
                        fontWeight: FontWeight.w500),
                  ),
                  InkWell(
                    onTap: () {
                      Network().addToFavorite(widget.id);
                      Functions.showSnackbar(context, 'Added to Favorite list');
                    },
                    child: const Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
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
                      widget.price + '.00',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
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
                fit: BoxFit.cover, image: NetworkImage(widget.image))),
      ),
    );
  }
}
