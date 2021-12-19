import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hidropal/Pages/Registrasi.dart';
import 'package:hidropal/Variable.dart';
import 'package:hidropal/Variable.dart';
import 'package:hidropal/Variable.dart';
import 'package:hidropal/Variable.dart';
import 'package:hidropal/main.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController noHandPhone = new TextEditingController();
  TextEditingController password = new TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    noHandPhone.dispose();
    password.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        backgroundColor: Color.fromRGBO(244, 255, 236, 1),
        title: Text("Masuk Ke Hidropal",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20,

        ),),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
        child: ListView(
          children: [
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
            SizedBox(height: 20,),
            Row(
              children: [
                Text("Lupa Password? "),
                Text(" Reset Password ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
              ],
            ),
            InkWell(
              onTap: (){
                // print(noHandPhone.text);
                // print(password.text);
                bool isValidate = false;
                for (int i = 0; i < listUser.length; i++) {
                  if (noHandPhone.text == listUser[i][1] && password.text == listUser[i][3]){
                    akun = listUser[i];
                    print("yes");
                    isValidate = true;
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyCustomBottomNavigationBar(0)) );
                    break;

                  }
                }
                if(isValidate == false){
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Warning"),
                          content: Text("No Handphone atau Password yang Anda Masukan Salah!"),
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
                margin: EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                height: 40,
                color: Colors.green,
                child: Center(
                  child: Text("Login",style: TextStyle(fontSize: 20,color: Colors.white),),
                ),
              )
            ),
            Text("Belum Punya Akun ?",textAlign: TextAlign.center,style: TextStyle(fontSize: 18),),
            SizedBox(height: 20,),
            InkWell(
                onTap: (){
                  Navigator.push(context, Transition(Registrasi()));
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
