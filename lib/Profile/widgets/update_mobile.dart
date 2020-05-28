import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:monthly_pay_admin/Customer_Dashboard/CustomerDashboard.dart';

class updateMobile extends StatefulWidget {
  final File img;
  final String mobNum;
  updateMobile(this.img,this.mobNum);
  @override
  _updateMobileState createState() => _updateMobileState();
}

class _updateMobileState extends State<updateMobile>
    with SingleTickerProviderStateMixin {
  Animation cardAnimation, delayedCardAnimation;
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    cardAnimation = Tween(begin: 0.75, end: 0)
        .animate(CurvedAnimation(curve: Curves.ease, parent: controller));

    delayedCardAnimation = Tween(begin: -0.75, end: 0)
        .animate(CurvedAnimation(curve: Curves.ease, parent: controller));
  }

  @override
  Widget build(BuildContext context) {

    Future<bool> VerifyOTP() {
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Center(child: Text('Enter OTP')),
            actions: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 50,
                    decoration: BoxDecoration(),
                    margin: EdgeInsets.only(top: 40),
                    child: TextField(

                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintStyle: Theme.of(context).textTheme.subtitle2,
                        hintText: 'Enter OTP',
                        border: const OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(40))),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Material(
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: FlatButton(
                      child: Text(
                        'Verify OTP',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      onPressed: () {
                        return Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => CustomerDashboard()));
                      },
                    ),
                  )
                ],
              ),
            ],
          ));
    }
    final devWidth = MediaQuery.of(context).size.width;
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text('Add Mobile Number',
                style: Theme.of(context).textTheme.headline5),
            backgroundColor: Theme.of(context).primaryColor,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 25,
              ),
              onPressed: Navigator.of(context).pop,
            ),
          ),
          body: SingleChildScrollView(
              child: Column(children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.35,

                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight:Radius.elliptical(40, 30)
                          ,bottomLeft:Radius.elliptical(40, 30)
                      ),
                      color: Colors.lightBlue),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 140,
                        width: 140,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60)),
                        child: widget.img != null
                            ? new Container(
                                width: 190.0,
                                height: 190.0,
                                decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                        fit: BoxFit.fill,
                                        image: FileImage(widget.img))))
                            : IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.account_circle,
                                    color: Theme.of(context).accentColor),
                                iconSize: 140,
                              )),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      transform: Matrix4.translationValues(
                          cardAnimation.value * devWidth, 0, 0),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          margin: EdgeInsets.only(left: 15, top: 15),
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Mobile No. 1 : ',
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '9876543456',
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              transform: Matrix4.translationValues(
                  delayedCardAnimation.value * devWidth, 0, 0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 4,
                child: Container(
                  padding:
                      EdgeInsets.only(bottom: 25, left: 8, right: 8, top: 8),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 50,
                        decoration: BoxDecoration(),
                        margin: EdgeInsets.only(top: 40),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          initialValue: widget.mobNum,

                          decoration: InputDecoration(
                            hintStyle: Theme.of(context).textTheme.subtitle2,
                            hintText:"Enter Mobile Number",
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Material(
                        color: Colors.lightBlue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: FlatButton(
                          child: Text(
                            'Send OTP',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          onPressed: () {
                            VerifyOTP();
                          },
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            )
          ])),
        );
      },
    );
  }

  Widget tile(BuildContext context, String str) {
    return TextField(
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
          hintText: str, hintStyle: Theme.of(context).textTheme.subtitle2),
    );
  }

  void _Fade(BuildContext context, Widget widget) {
    Navigator.of(context).push(PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 600),
        pageBuilder: (context, animation, secondaryAnimation) {
          return widget;
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        }));
  }
}
