import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterecomapp/database/database.dart';
import 'package:flutterecomapp/model/cart_model.dart';
import 'package:flutterecomapp/screens/home_screen.dart';
import 'package:flutterecomapp/widget/text_screen.dart';

class CartScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _cartScreen();
  }
}

class _cartScreen extends State<CartScreen> {
  @override
  initState() {
    myCount = 0;
    super.initState();
  }

  Future<bool> willPopCallback() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MyHomePage()));
    return true;
  }

  int myCount;
  int a;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
        child: Scaffold(
          body: SafeArea(
              child: Container(
                  child: Column(
            children: [
              Expanded(
                child: FutureBuilder<List<Cart>>(
                  future: DBProvider.db.getCartDart(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Cart>> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == snapshot.data.length) {
                            return Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                    height: 100,
                                    child: snapshot.data.length == 0
                                        ? Center(
                                            child: CustomText(
                                              title: "No Product in your Cart",
                                            ),
                                          )
                                        : Column(
                                            children: [
                                              Container(
                                                height: 25,
                                              ),
                                              CustomText(
                                                title:
                                                    "Total Product:  ${snapshot.data.length.toString()}",
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal,
                                              ),
                                              Container(
                                                height: 10,
                                              ),
                                              CustomText(
                                                  title:
                                                      "Total Price: \$ ${myCount.toString()}",
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ],
                                          )));
                          }

                          Cart item = snapshot.data[index];
                          a = int.parse(item.price.toString());
                          myCount += a;

                          return Padding(
                              padding:
                                  EdgeInsets.only(left: 10, right: 10, top: 20),
                              child: ListTile(
                                title: CustomText(
                                  title: item.name.toString(),
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                ),
                                subtitle: CustomText(
                                  title: "Price: \$ ${item.price.toString()}",
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                ),
//                                Text("\$ ${item.price.toString()}"),
                                leading: CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.white,
                                  backgroundImage: NetworkImage(item.image),
                                ),
                                trailing: Icon(
                                  Icons.favorite,
                                  color: Colors.pinkAccent,
                                ),
                              ));
                        },
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20, top: 10),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                  child: CustomText(
                    title: "Proceed To Checkout",
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                  color: Colors.pink,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                ),
              )
            ],
          ))),
        ),
        onWillPop: willPopCallback);
  }
}
