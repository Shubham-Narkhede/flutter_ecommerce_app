import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterecomapp/model/cart_model.dart';
import 'package:flutterecomapp/screens/description_screen.dart';
import 'package:flutterecomapp/widget/route_transition.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  final Cart product;

  ProductCard({@required this.product});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Padding(
        padding: EdgeInsets.only(bottom: 25, right: 15),
        child: InkWell(
          child: Container(
            height: height / 5,
            width: width / 2,
            decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.grey.shade50, Colors.white]),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(2, 2),
                    spreadRadius: 2,
                    blurRadius: 4)
              ],
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
//            color: Colors.black,
                  height: height / 4.2,
                  width: width / 2.7,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(product.image),
                  ),
                ),
                Expanded(
                    child: Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Center(
                        child: Text(
                      product.name,
                      style: GoogleFonts.zillaSlab(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    )),
                  ),
                ))
              ],
            ),
          ),
          onTap: () {
            Navigator.pushReplacement(
                context,
                SizeRoute(
                    page : DescriptionPage(
                          name: product.name,
                          image: product.image,
                          description: product.description,
                          price: product.price,
                        )));
          },
        ));
  }
}

class ListProductCard extends StatelessWidget {
  final Cart product;

  ListProductCard({@required this.product});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Padding(
        padding: EdgeInsets.only(bottom: 25, right: 15),
        child: InkWell(
          child: Container(
            height: height / 5,
            width: width / 2,
            decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.grey.shade50, Colors.white]),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(1, 1),
                    spreadRadius: 1,
                    blurRadius: 4)
              ],
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                   height: height / 4.2,
                  width: width / 2.7,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(product.image),
                  ),
                ),
                Expanded(
                    child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: Center(
                            child: Text(
                          product.name,
                          style: GoogleFonts.zillaSlab(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.yellow,
                                gradient: LinearGradient(
                                    colors: [Colors.yellow, Colors.deepOrange]),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    bottomLeft: Radius.circular(40))),
                            height: 50,
                            width: 100,
                            child: Icon(Icons.forward),
                          ),
                        ),
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
          onTap: () {
            Navigator.pushReplacement(
                context,
                ScaleRoute(
                    page: DescriptionPage(
                          name: product.name,
                          image: product.image,
                          description: product.description,
                          price: product.price,
                        )));
          },
        ));
  }
}
