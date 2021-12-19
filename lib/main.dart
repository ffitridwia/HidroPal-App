import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hidropal/Pages/Akun.dart';
import 'package:hidropal/Pages/Home.dart';
import 'package:hidropal/Pages/Katalog.dart';
import 'package:hidropal/Pages/Login.dart';
import 'package:hidropal/Pages/Troli.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),

      // home: MyCustomBottomNavigationBar()

    );
  }
}





class MyCustomBottomNavigationBar extends StatefulWidget {
  int currentValue;
  MyCustomBottomNavigationBar(this.currentValue);
  @override
  _MyCustomBottomNavigationBarState createState() =>
      _MyCustomBottomNavigationBarState();
}

class _MyCustomBottomNavigationBarState
    extends State<MyCustomBottomNavigationBar> with TickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  late AnimationController _controller2;
  late Animation<double> _animation2;

  late AnimationController _controller3;
  late Animation<double> _animation3;

  late AnimationController _controller4;
  late Animation<double> _animation4;

  late AnimationController _controller5;
  late Animation<double> _animation5;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween<double>(begin: 25, end: 33).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.easeIn))
      ..addListener(() {
        setState(() {});
      });

    _controller2 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation2 = Tween<double>(begin: 25, end: 33).animate(CurvedAnimation(
        parent: _controller2,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.easeIn))
      ..addListener(() {
        setState(() {});
      });

    _controller3 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation3 = Tween<double>(begin: 25, end: 33).animate(CurvedAnimation(
        parent: _controller3,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.easeIn))
      ..addListener(() {
        setState(() {});
      });

    _controller4 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation4 = Tween<double>(begin: 25, end: 33).animate(CurvedAnimation(
        parent: _controller4,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.easeIn))
      ..addListener(() {
        setState(() {});
      });

    _controller5 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation5 = Tween<double>(begin: 25, end: 33).animate(CurvedAnimation(
        parent: _controller5,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.ease))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        backgroundColor: Color.fromRGBO(244, 255, 236, 1),
        title: Text(widget.currentValue == 0 ? "Hidropal" : widget.currentValue == 1 ? "Katalog" : widget.currentValue == 2 ? "Troli" : "Akun Pengguna",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20,

        ),),
      ),
      body: Stack(
        children: [
          // HOME PAGE
          SizedBox(
            height: size.height,
            width: size.width,
            child: widget.currentValue == 0 ? HomePages() : widget.currentValue == 1 ? Katalog() : widget.currentValue == 2 ? Troli() : Akun(),
          ),

          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: size.width * .14,
              width: size.width,
              // margin: EdgeInsets.all(size.width * .04),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.home,
                      color: widget.currentValue == 0 ? Colors.black : Colors.black38,
                      size: _animation.value,
                    ),
                    onPressed: () {
                      setState(() {
                        widget.currentValue = 0;
                        _controller.forward();
                        _controller2.reverse();
                        _controller3.reverse();
                        _controller4.reverse();
                        _controller5.reverse();
                        HapticFeedback.lightImpact();
                      });
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  IconButton(
                    icon: Image.asset('assets/icon/katalog.png'
                    , color: widget.currentValue == 1 ? Colors.black : Colors.black38,
                      // scale: _animation2.value,
                      width: _animation2.value,
                      height: _animation2.value,

                    ),
                    onPressed: () {
                      setState(() {
                        widget.currentValue = 1;
                        _controller2.forward();
                        _controller.reverse();
                        _controller3.reverse();
                        _controller4.reverse();
                        _controller5.reverse();
                        HapticFeedback.lightImpact();
                      });
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),

                  IconButton(
                    icon: Image.asset('assets/icon/troli.png',
                      color: widget.currentValue == 2 ? Colors.black : Colors.black38,
                      width: _animation4.value,
                      height: _animation4.value,
                    ),
                    onPressed: () {
                      setState(() {
                        widget.currentValue = 2;
                        _controller4.forward();
                        _controller.reverse();
                        _controller2.reverse();
                        _controller3.reverse();
                        _controller5.reverse();
                        HapticFeedback.lightImpact();
                      });
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.person,
                      color: widget.currentValue == 3 ? Colors.black : Colors.black38,
                      size: _animation5.value,
                    ),
                    onPressed: () {
                      setState(() {
                        widget.currentValue = 3;
                        _controller5.forward();
                        _controller.reverse();
                        _controller2.reverse();
                        _controller3.reverse();
                        _controller4.reverse();
                        HapticFeedback.lightImpact();
                      });
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



class Transition extends PageRouteBuilder {
  final Widget page;

  Transition(this.page)
      : super(
    pageBuilder: (context, animation, anotherAnimation) => page,
    transitionDuration: Duration(milliseconds: 1000),
    reverseTransitionDuration: Duration(milliseconds: 200),
    transitionsBuilder: (context, animation, anotherAnimation, child) {
      animation = CurvedAnimation(
          curve: Curves.fastLinearToSlowEaseIn,
          parent: animation,
          reverseCurve: Curves.fastOutSlowIn);
      return Align(
        alignment: Alignment.centerRight,
        child: SizeTransition(
          axis: Axis.horizontal,
          sizeFactor: animation,
          child: page,
          axisAlignment: 0,
        ),
      );
    },
  );
}
