import 'package:flutter/material.dart';

import '../Variable.dart';
import '../main.dart';
import 'Login.dart';

class Registrasi extends StatefulWidget {
  const Registrasi({Key? key}) : super(key: key);

  @override
  _RegistrasiState createState() => _RegistrasiState();
}

class _RegistrasiState extends State<Registrasi> {
  TextEditingController namaLengkap = new TextEditingController();
  TextEditingController alamat = new TextEditingController();
  TextEditingController noHandPhone = new TextEditingController();
  TextEditingController password = new TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    namaLengkap.dispose();
    alamat.dispose();
    noHandPhone.dispose();
    password.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 2,
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromRGBO(244, 255, 236, 1),
          title: Row(
            children: [
              IconButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back,color: Colors.black,)),
              Text("Daftar Ke Hidropal",style: TextStyle(color: Colors.black),),
            ],
          )


      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
        child: ListView(
          children: [
            TextField(
              controller: namaLengkap,
              decoration: InputDecoration(
                labelText: "Nama Lengkap",
              ),
            ),
            TextField(
              controller: noHandPhone,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "No. Handphone",
              ),
            ),
            TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
              ),

            ),
            TextField(
              controller: alamat,
              decoration: InputDecoration(
                labelText: "Alamat",
              ),
            ),
            SizedBox(height: 20,),

            SizedBox(height: 20,),
            InkWell(
                onTap: (){
                  bool isValidate = true;
                  var dataInput = [
                    namaLengkap.text,noHandPhone.text,alamat.text,password.text
                  ];
                  for(int i=0; i<dataInput.length;i++){
                    if(dataInput[i] == ""){
                      isValidate = false;
                      break;
                    }
                  }
                  if(isValidate == true){
                    listUser.add(dataInput);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()) );
                  }
                  else{
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Warning"),
                            content: Text("Form Tidak Boleh Ada yang Kosong!"),
                            actions: [

                              FlatButton(
                                onPressed: () {
                                  setState(() {
                                    Navigator.of(context).pop(true);
                                  });
                                },
                                child: Text("OK", style: TextStyle(color: Colors.blue)),
                              )
                            ],
                          );
                        }).then((value) => null);
                  }
                },
                child: Container(
                  // margin: EdgeInsets.symmetric(vertical: 20),
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black,width: 1)
                  ),
                  child: Center(
                    child: Text("Registrasi",style: TextStyle(fontSize: 20),),
                  ),
                )
            ),

          ],
        ),
      ),
    );
  }
}
