import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:monthly_pay_admin/Common_Widgets/curve_painter.dart';
import 'package:monthly_pay_admin/Profile/models/request_class.dart';

import 'send_request.dart';

class request extends StatefulWidget {
  List<RequestClass> newRequest;
  request(this.newRequest);

  @override
  _requestState createState() => _requestState();
}

class _requestState extends State<request> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Request',
        ),
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 25,
          ),
          onPressed: Navigator.of(context).pop,
        ),
        actions: [
          FlatButton(
            child:Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              _Fade(context, sendRequest());
            },
          )
        ],
      ),
      body: CustomPaint(
        painter: CurvePainter(),
        child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            child: widget.newRequest.isEmpty
                ? Text('No Requsts')
                : ListView.builder(
                    itemBuilder: (inf, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          margin:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                          elevation: 5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FittedBox(
                                      child: Container(
                                        width: MediaQuery.of(context).size.width / 3,
                                        child: Text(
                                          widget.newRequest[index].name,
                                          style:
                                              Theme.of(context).textTheme.subtitle1,
                                              overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      widget.newRequest[index].mobile.toString(),
                                      style:
                                          Theme.of(context).textTheme.subtitle2,
                                    ),
                                    SizedBox(height: 10),
                                    FittedBox(
                                      child: Text(
                                          widget.newRequest[index].description,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FittedBox(
                                      child: Text(
                                        DateFormat.yMMMd().format(
                                            widget.newRequest[index].date),
                                        style:
                                            Theme.of(context).textTheme.subtitle1,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    FittedBox(
                                      child: Text(widget.newRequest[index].status,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: widget.newRequest.length,
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
