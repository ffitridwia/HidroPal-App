import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hidropal/Pages/DetailProduct.dart';
import 'package:hidropal/Variable.dart';
import 'package:hidropal/main.dart';
class Katalog extends StatefulWidget {
  // const Katalog({Key? key}) : super(key: key);
  @override
  _KatalogState createState() => _KatalogState();
}

class _KatalogState extends State<Katalog> {
  TextEditingController searchInputController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
      child: ListView(
        children: [
          TextField(
            controller: searchInputController,
            onChanged: (value){
              setState(() {
                searchInput = value;
              });

            },

            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),

              hintText: "Cari",

              suffixIcon: Icon(Icons.search)
            ),
          ),
          for(int i=0; i<katalog.length; i++)
            (katalog[i][0].toString().toLowerCase().contains(searchInput.toLowerCase())) ?
              Card(
                elevation: 3,
                child: InkWell(
                  onTap: (){
                    Navigator.push(context,Transition(DetailProduct(katalog[i][0].toString(),int.parse(katalog[i][1].toString()),katalog[i][2].toString(),katalog[i][3],0)));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    height: 150,
                    child: Row(
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: Container(
                            width: 140,
                            height: 130,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey,width: 0.5),
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage("assets/images/Products/"+katalog[i][2].toString()),
                                fit: BoxFit.cover
                              )
                            ),

                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: Container(
                            padding: EdgeInsets.only(left: 30),
                            width: 140,
                            height: 130,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(katalog[i][0].toString(),style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
                                Text("Rp. "+katalog[i][1].toString(),style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),)
                              ],
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                ),
              )
            : Container(),
          SizedBox(height: 70,)

        ],
      ),
    );
  }
}
