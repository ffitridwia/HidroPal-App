import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/widgets.dart';
import 'package:hidropal/Pages/Katalog.dart';
import 'package:hidropal/Variable.dart';

import '../main.dart';
import 'DetailProduct.dart';

class HomePages extends StatefulWidget {
  // const HomePages({Key? key}) : super(key: key);

  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: ListView(
        children: [
          Card(
            elevation: 2,
            child: Container(
              width: double.infinity,
              height: 282,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/img1.jpeg",
                      ),
                      fit: BoxFit.cover)),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 130, top: 90),
                child: Text(
                  "We provide fresh vegetable for your family",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  Transition(Scaffold(
                    body: Katalog(),
                  )));
            },
            child: Row(
              children: [
                Text(
                  "Lihat Katalog",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.arrow_forward)
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Card(
                  elevation: 3,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          Transition(DetailProduct(
                              katalog[2][0].toString(),
                              int.parse(katalog[2][1].toString()),
                              katalog[2][2].toString(),
                              katalog[2][3],
                              0)));
                    },
                    child: Container(
                      // height: 223,
                      padding:
                          EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image: AssetImage("assets/images/Products/" +
                                katalog[2][2].toString()),
                          ),
                          Text(
                            katalog[2][0].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          Text(
                            "Rp. " + katalog[2][1].toString(),
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Card(
                  elevation: 3,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          Transition(DetailProduct(
                              katalog[1][0].toString(),
                              int.parse(katalog[1][1].toString()),
                              katalog[1][2].toString(),
                              katalog[1][3],
                              0)));
                    },
                    child: Container(
                      // height: 223,
                      padding:
                          EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image: AssetImage("assets/images/Products/" +
                                katalog[1][2].toString()),
                          ),
                          Text(
                            katalog[1][0].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          Text(
                            "Rp. " + katalog[1][1].toString(),
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
