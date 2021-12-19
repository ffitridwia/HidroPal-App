import 'package:flutter/material.dart';
import 'package:hidropal/Pages/Akun.dart';
import 'package:hidropal/Variable.dart';
import 'package:hidropal/main.dart';
class Troli extends StatefulWidget {
  const Troli({Key? key}) : super(key: key);

  @override
  _TroliState createState() => _TroliState();
}

class _TroliState extends State<Troli> {
  @override
  Widget build(BuildContext context) {
    var totalHarga = 0;
    for(int i=0; i<troli.length; i++){
      totalHarga += int.parse(troli[i][1].toString())*int.parse(troli[i][3].toString());
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
      child: ListView(
        children: [
          Card(
            child: Container(
              color: Color.fromRGBO(0, 0, 0, 0.05),
              padding: EdgeInsets.symmetric(horizontal: 19,vertical: 21),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Alamat Pengiriman",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        Text(akun[2],style: TextStyle(fontSize: 17),),
                      ],
                    ),
                  ),
                  Builder(builder: (context){
                    return IconButton(
                      onPressed: (){
                        Navigator.push(context, Transition(Scaffold(body: Akun(),)));
                      },
                      icon: Icon(Icons.create_outlined),
                    );
                  })
                ],
              ),

            ),
          ),
          for(int i=0; i<troli.length; i++)
            Card(
              elevation: 5,
              child: InkWell(
                onTap: (){},
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
                                  image: AssetImage("assets/images/Products/"+troli[i][2].toString()),
                                  fit: BoxFit.cover
                              )
                          ),

                        ),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Container(
                          padding: EdgeInsets.only(left: 20),
                          width: 140,
                          height: 130,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(troli[i][0].toString(),style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
                              Text("Rp. "+(int.parse(troli[i][1].toString())*int.parse(troli[i][3].toString())).toString(),style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),),
                              Card(
                                elevation: 4,

                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      onPressed: (){
                                        setState(() {
                                          troli[i][3] = int.parse(troli[i][3].toString()) + 1;
                                        });
                                      },
                                      icon: Icon(Icons.add)
                                    ),
                                    Text(troli[i][3].toString()),
                                    IconButton(
                                        onPressed: (){
                                          setState(() {
                                            troli[i][3] = int.parse(troli[i][3].toString()) - 1;
                                          });
                                        },
                                        icon: Icon(Icons.remove)
                                    ),
                                  ],
                                ),
                              )

                            ],
                          ),
                        ),
                      )

                    ],
                  ),
                ),
              ),
            ),
          SizedBox(height: 20,),
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Biaya Pengiriman",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20)),
                  Text("Rp. 8000",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),)
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          Card(
            elevation: 1,
            child: Container(
              color: Colors.green,
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text("Total",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 20)),
                      Text("Rp. "+totalHarga.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 18),)
                    ],
                  ),
                  Card(
                    elevation: 3,
                    color: Colors.white,
                    child: InkWell(

                      onTap: (){},
                      child: Container(
                        width: 101,
                        height: 48,
                        child: Center(child: Text("Beli",style: TextStyle(color: Colors.black,fontSize: 24))),
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),
          SizedBox(height: 70,)
        ],
      ),
    );
  }
}
