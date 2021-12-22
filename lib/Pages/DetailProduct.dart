import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hidropal/Variable.dart';
import 'package:hidropal/main.dart';

class DetailProduct extends StatefulWidget {
  String namaBarang;
  int harga;
  String img;
  var deskripsi;
  int totalPesanan;
  DetailProduct(
      this.namaBarang, this.harga, this.img, this.deskripsi, this.totalPesanan);

  // const DetailProduct({Key? key}) : super(key: key);

  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (widget.totalPesanan > 0) {
            setState(() {
              troli.add([
                widget.namaBarang,
                widget.harga,
                widget.img,
                widget.totalPesanan
              ]);
            });
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) {
              return MyCustomBottomNavigationBar(2);
            }));
          }
        },
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Colors.green,
      ),
      appBar: AppBar(
          elevation: 2,
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromRGBO(244, 255, 236, 1),
          title: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
              Text(
                "Detil Produk",
                style: TextStyle(color: Colors.black),
              ),
            ],
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView(
          children: [
            Card(
              elevation: 4,
              child: Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/images/Products/" + widget.img))),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              widget.namaBarang,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 18,
            ),
            Text("Rp. " + widget.harga.toString(),
                style: TextStyle(
                  fontSize: 18,
                )),
            SizedBox(
              height: 18,
            ),
            Text(
              "Deskripsi Produk : ",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            for (int i = 0; i < widget.deskripsi.length; i++)
              Text(
                widget.deskripsi[i],
                style: TextStyle(fontSize: 15),
              ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Jumlah Pesan : ",
                  style: TextStyle(fontSize: 18),
                ),
                Card(
                  // margin: EdgeInsets.symmetric(horizontal: 80),
                  elevation: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            if (widget.totalPesanan > 0) {
                              setState(() {
                                widget.totalPesanan = widget.totalPesanan - 1;
                                // print(widget.totalPesanan);
                              });
                            }
                          },
                          icon: Icon(Icons.remove)),
                      Text(
                        widget.totalPesanan.toString(),
                        style: TextStyle(fontSize: 18),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              widget.totalPesanan = widget.totalPesanan + 1;
                              // print(widget.totalPesanan);
                            });
                          },
                          icon: Icon(Icons.add)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
