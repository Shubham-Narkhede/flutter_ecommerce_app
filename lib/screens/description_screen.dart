import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterecomapp/database/database.dart';
import 'package:flutterecomapp/model/cart_model.dart';
import 'package:flutterecomapp/screens/home_screen.dart';
import 'package:flutterecomapp/widget/route_transition.dart';
import 'package:flutterecomapp/widget/text_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'cart_screen.dart';

class DescriptionPage extends StatefulWidget {
  var name;
  var description;
  var price;
  var image;

  DescriptionPage({this.description, this.price, this.name, this.image});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _descriptionScreen();
  }
}

class _descriptionScreen extends State<DescriptionPage> {
  @override
  initState() {
    super.initState();
  }

  Future<bool> willPopCallback() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MyHomePage()));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await DBProvider.db.addToCart(
                Cart(
                    name: widget.name.toString(),
                    image: widget.image.toString(),
                    description: widget.description.toString(),
                    price: widget.price.toString()),
              );
              Fluttertoast.showToast(
                  msg: "Successfully added to Cart",
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  gravity: ToastGravity.CENTER);
              Navigator.pushReplacement(
                  context, FadeRouteBuilder(page: CartScreen()));
            },
            child: Icon(Icons.add_shopping_cart, color: Colors.white),
            backgroundColor: Colors.red.shade900,
          ),
          body: SafeArea(
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: height / 2,
                      child: Image.network(widget.image),
                    ),
                    ListTile(
                      title: CustomText(
                        title: widget.name,
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                      trailing: CustomText(
                        title: "\$ ${widget.price.toString()}",
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      height: 10,
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: CustomText(
                          title: widget.description,
                          fontSize: 20,
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        onWillPop: willPopCallback);
  }
}
