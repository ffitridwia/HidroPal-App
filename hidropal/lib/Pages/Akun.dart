import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hidropal/Pages/Login.dart';

import '../Variable.dart';

class Akun extends StatefulWidget {
  // const Akun({Key? key}) : super(key: key);
  @override
  _AkunState createState() => _AkunState();
}

class _AkunState extends State<Akun> {
  TextEditingController namaLengkapInput = new TextEditingController()..text = akun[0];

  TextEditingController nomorHandPhoneInput = new TextEditingController()..text = akun[1];

  TextEditingController alamatInput = new TextEditingController()..text = akun[2];

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    namaLengkapInput.dispose();
    nomorHandPhoneInput.dispose();
    alamatInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
      child: ListView(
        children: [
          Center(
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/avatar/avatar1.jpeg"),

              radius: 66,
            ),
          ),
          SizedBox(height: 20,),
          TextField(
            controller: namaLengkapInput,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Nama Lengkap"
            ),
          ),
          SizedBox(height: 20,),
          TextField(
            controller: nomorHandPhoneInput,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Nomor Handphone"
            ),
          ),
          SizedBox(height: 20,),
          TextField(
            controller: alamatInput,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Alamat"
            ),
          ),
          SizedBox(height: 40,),
          InkWell(
            onTap: (){
              setState(() {
                akun[0] = (namaLengkapInput.text);
                akun[1] =(nomorHandPhoneInput.text);
                akun[2] =(alamatInput.text);
              });
            },
            child: Container(
              width: double.infinity,
              height: 53,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.lightGreen,width: 3)
              ),
              child: Center(child: Text("Edit Profil",style: TextStyle(color: Colors.lightGreen,fontSize: 23),),),
            ),
          ),
          SizedBox(height: 20,),
          InkWell(
            onTap: (){
              akun = [];
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()) );
            },
            child: Container(
              width: double.infinity,
              height: 53,
              color: Colors.red,
              child: Center(child: Text("Logout",style: TextStyle(color: Colors.white,fontSize: 23),),),
            ),
          ),
        ],
      ),
    );
  }
}
