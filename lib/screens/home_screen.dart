import 'package:flutter/material.dart';
import 'package:flutterecomapp/database/database.dart';
import 'package:flutterecomapp/model/cart_model.dart';
import 'package:flutterecomapp/screens/cart_screen.dart';
import 'package:flutterecomapp/ui/horizental_ui.dart';
import 'package:flutterecomapp/ui/vertical_ui.dart';
import 'package:flutterecomapp/widget/text_screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: Container(
        color: Colors.white,
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                leading: CustomText(
                  title: "Our Products",
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                trailing: IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CartScreen()));
                    }),
              ),
              ListTile(
                leading: CustomText(
                  title: "Snikkers",
                  fontSize: 20,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w500,
                ),
              ),
              HorizentalListview(height: height / 2.7, width: width),
              ListTile(
                leading: CustomText(
                  title: "Top Collection",
                  fontSize: 20,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Verticlelistview(height: height / 2, width: width)
            ],
          ),
        ),
      ),
    ));
  }
}
