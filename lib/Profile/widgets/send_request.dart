import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:monthly_pay_admin/Common_Widgets/curve_painter.dart';
import 'package:monthly_pay_admin/Profile/models/request_class.dart';

class sendRequest extends StatefulWidget {
  @override
  _sendRequestState createState() => _sendRequestState();
}

class _sendRequestState extends State<sendRequest> {
  List<RequestClass> NewRequest = [
    RequestClass(
        name: 'N.D.P.S',
        mobile: 1234567890,
        description: 'Description',
        date: DateTime.now(),
        status: 'Accepted',
        amount: 1000),
    RequestClass(
        name: 'Shivani Jaiswal',
        mobile: 9876944585,
        description: 'Description',
        date: DateTime.now(),
        status: 'Accepted',
        amount: 4000),
    RequestClass(
        name: 'Shivani Jaswal',
        mobile: 9876944585,
        description: 'Description',
        date: DateTime.now(),
        status: 'Rejected',
        amount: 2000)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Send Request'),
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
      body: CustomPaint(
        painter: CurvePainter(),
        child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            child: NewRequest.isEmpty
                ? Text('No Requsts')
                : ListView.builder(
                    itemBuilder: (inf, index) {
                      return Card(
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                        elevation: 5,
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(8),
                              child: Text(
                                NewRequest[index].name,
                                style: Theme.of(context).textTheme.subtitle1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    NewRequest[index].mobile.toString(),
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    DateFormat.yMMMd()
                                        .format(NewRequest[index].date),
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    NewRequest[index].description,
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '₹ ${NewRequest[index].amount.toString()}',
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                IconButton(
                                  icon: FittedBox(
                                    child: Icon(
                                      Icons.send,
                                      size: 25,
                                    ),
                                  ),
                                  onPressed: () {},
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: NewRequest.length,
                  )),
      ),
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
