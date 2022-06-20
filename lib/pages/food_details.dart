import 'package:flutter/material.dart';
import 'package:food_app/const.dart';

import '../widgets/topbar_icon.dart';

class FoodDetails extends StatefulWidget {
  const FoodDetails({Key? key}) : super(key: key);

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  bool isExpanded = false;
  late var firstHalf;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (dummyText5p.length < 200) {
      firstHalf = dummyText5p;
    } else {
      firstHalf = dummyText5p.substring(0, 300);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // floating: true,
            toolbarHeight: 60,
            backgroundColor: Colors.grey,
            expandedHeight: 250,
            elevation: 0,
            // leading: const Icon(Icons.arrow_back),
            automaticallyImplyLeading: false,
            pinned: true,
            title: Container(
              width: double.infinity,
              // color: Colors.amber,
              margin: const EdgeInsets.all(16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TopBarIcon(
                    myIcon: Icons.arrow_back,
                    onClick: () => Navigator.pop(context),
                  ),
                  TopBarIcon(myIcon: Icons.shopping_cart, onClick: () {}),
                ],
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: Container(
                padding: const EdgeInsets.all(16),
                width: double.maxFinite,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Hello Foodie',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(16)),
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),

            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                dummyImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      isExpanded ? dummyText5p : firstHalf + '...',
                      textAlign: TextAlign.justify,
                    ),
                    TextButton.icon(
                      onPressed: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      icon: Text(isExpanded ? 'Show less' : 'Show more'),
                      label: Icon(isExpanded
                          ? Icons.arrow_drop_up
                          : Icons.arrow_drop_down),
                    )
                  ],
                )),
          )
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                shape: const StadiumBorder(),
                onPressed: () {},
                child: const Icon(Icons.remove_circle),
              ),
              Text('\$12.5 x 0)'),
              MaterialButton(
                shape: const StadiumBorder(),
                onPressed: () {},
                child: const Icon(Icons.add_circle),
              ),
            ],
          ),
          MaterialButton(
            height: 50,
            minWidth: double.infinity,
            color: Colors.grey,
            shape: const StadiumBorder(),
            onPressed: () {},
            child: Text(
              '\$28 | Add to cart',
              style: TextStyle(color: Colors.white),
            ),
          )
        ]),
      ),
    );
  }
}
