// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app/network/network_helper.dart';

import '../widgets/profile_body_item.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var db = FirebaseFirestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Network().getDataByQuery();
  }

  @override
  Widget build(BuildContext context) {
    var screenHieght = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            height: screenHieght * .25,
            width: double.maxFinite,
            color: Colors.amber,
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                        'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80',
                      ))),
                ),
                Positioned(
                  left: screenWidth * .5,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                        color: Colors.amber, shape: BoxShape.circle),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: const Icon(Icons.add_a_photo_outlined),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ProfileBodyItem(
            title: 'Name',
            data: 'Zakariya Hossain',
            onClick: () {},
          ),
          ProfileBodyItem(
            title: 'Email',
            data: 'example@mail.com',
            onClick: () {},
          ),
          ProfileBodyItem(
            title: 'Phone',
            data: '+880123455677',
            onClick: () {},
          ),
          ProfileBodyItem(
            title: 'Address',
            data: '12 road, b block',
            onClick: () {},
          ),
          ProfileBodyItem(
            title: 'City',
            data: 'Rangpur',
            onClick: () {},
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_box),
          )
        ],
      ),
    );
  }
}
