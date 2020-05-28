import 'package:flutter/material.dart';

import 'package:monthly_pay_admin/Common_Widgets/bottomNavigationBar.dart';
import 'package:monthly_pay_admin/Common_Widgets/curve_painter.dart';
import 'package:monthly_pay_admin/Customer_Dashboard/widgets/active_order.dart';
import 'package:monthly_pay_admin/Customer_Dashboard/widgets/inactive_order.dart';
import 'package:monthly_pay_admin/Customer_Dashboard/widgets/paid_pending.dart';
import 'package:monthly_pay_admin/Profile/models/request_class.dart';
import 'package:monthly_pay_admin/Profile/widgets/request.dart';

class CustomerDashboard extends StatefulWidget {
  @override
  _CustomerDashboardState createState() => _CustomerDashboardState();
}

class _CustomerDashboardState extends State<CustomerDashboard>
    with SingleTickerProviderStateMixin {
  //Animation Fast in Slow out
  Animation animationForPaidPending;
  Animation animationForActiveOrder;
  Animation animationForInactiveOrder;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    animationForPaidPending = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animationForActiveOrder = Tween(begin: 2.5, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animationForInactiveOrder = Tween(begin: 3.5, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animationController.forward();
  }

   void _fadeTransitionWithPush(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: Duration(
          milliseconds: 600,
        ),
        pageBuilder: (context, animation, secondaryAnimation) {
          return widget;
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  int _currentTab = 0;
   List<RequestClass> newRequest=[
    RequestClass(
        name: 'N.D.P.S',
        mobile: 1234567890,
        description: 'Description',
        date: DateTime.now(),
        status: 'Accepted'
    ),
    RequestClass(
        name: 'Shivani Jaiswal',
        mobile: 9876944585,
        description: 'Description',
        date: DateTime.now(),
        status: 'Accepted'
    ),
    RequestClass(
        name: 'Shivani Jaiswal',
        mobile: 9876944585,
        description: 'Description',
        date: DateTime.now(),
        status: 'Rejected'
    )
  ];

  

  Future<bool> _backPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Do you really want to exit the app ?'),
              actions: <Widget>[
                FlatButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text(
                      'Yes',
                      style: TextStyle(fontSize: 20),
                    )),
                FlatButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text(
                      'No',
                      style: TextStyle(fontSize: 20),
                    )),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {

    AppBar appBar = AppBar(
    elevation: 0.0,
    title: Text('Dashboard'),
    actions: <Widget>[
      IconButton(
          icon: Icon(
            Icons.notifications,
          ),
          onPressed: () {
            _fadeTransitionWithPush(context, request(newRequest));
          })
    ],
  );
  
    final _heightOfScreen = MediaQuery.of(context).size.height * 0.93 -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    final _widthOfScreen = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return WillPopScope(
          onWillPop: _backPressed,
          child: Scaffold(
            bottomNavigationBar: NavigationBar(
              currentTab: _currentTab,
            ),
            appBar: appBar,
            body: CustomPaint(
              painter: CurvePainter(),
              child: Container(
                height: _heightOfScreen,
                child: Column(
                  children: <Widget>[
                    Transform(
                      transform: Matrix4.translationValues(
                        animationForPaidPending.value * _widthOfScreen,
                        0,
                        0,
                      ),
                      child: Container(
                        height: _heightOfScreen / 3,
                        child: PaidPending(),
                      ),
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                        animationForActiveOrder.value * _widthOfScreen,
                        0,
                        0,
                      ),
                      child: Container(
                        height: _heightOfScreen / 3,
                        width: _widthOfScreen * 0.96,
                        child: ActiveOrder(),
                      ),
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                        animationForInactiveOrder.value * _widthOfScreen,
                        0,
                        0,
                      ),
                      child: Container(
                        height: _heightOfScreen / 3,
                        width: _widthOfScreen * 0.96,
                        child: InactiveOrder(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
