import 'package:flutter/material.dart';

class PaidPending extends StatefulWidget {
  @override
  _PaidPendingState createState() => _PaidPendingState();
}

class _PaidPendingState extends State<PaidPending> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.01,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.40,
              child: Card(
                elevation: 12,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: constraints.maxHeight * 0.05,
                    ),
                    Container(
                      height: constraints.maxHeight * 0.20,
                      child: Text(
                        'Paid',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.05,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: constraints.maxHeight * 0.2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            // width: constraints.maxWidth * 0.2,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'Order: 3',
                                style: Theme.of(context).textTheme.subtitle1,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          // Container(
                          //   width: constraints.maxWidth * 0.2,
                          //   child: Text(
                          //     '3',
                          //     style: Theme.of(context).textTheme.subtitle1,
                          //     textAlign: TextAlign.center,
                          //     overflow: TextOverflow.ellipsis,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.05,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: constraints.maxHeight * 0.2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            // width: constraints.maxWidth * 0.2,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text('Amount: 650',
                                  style: Theme.of(context).textTheme.subtitle1),
                            ),
                          ),
                          // Container(
                          //   width: constraints.maxWidth * 0.2,
                          //   child: Text(
                          //     '650',
                          //     style: Theme.of(context).textTheme.subtitle1,
                          //     textAlign: TextAlign.center,
                          //     overflow: TextOverflow.ellipsis,
                          //   ),
                          // ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width*0.90 - 2 * MediaQuery.of(context).size.width * 0.41
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.40,
              child: Card(
                elevation: 12,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: constraints.maxHeight * 0.05,
                    ),
                    Container(
                      height: constraints.maxHeight * 0.20,
                      child: Text(
                        'Pending',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.05,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: constraints.maxHeight * 0.2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            // width: constraints.maxWidth * 0.2,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text('Order: 3',
                                  style: Theme.of(context).textTheme.subtitle1,),
                            ),
                          ),
                          // Container(
                          //   width: constraints.maxWidth * 0.2,
                          //   child: Text(
                          //     '1',
                          //     style: Theme.of(context).textTheme.subtitle1,
                          //     textAlign: TextAlign.center,
                          //     overflow: TextOverflow.ellipsis,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.05,
                    ),
                    Container(
                      // decoration: BoxDecoration(
                      //   boxShadow: [
                      //     BoxShadow(
                      //         color: Colors.black45,
                      //         blurRadius: 15,
                      //         offset: Offset(0, )),
                      //   ],
                      // ),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: constraints.maxHeight * 0.2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            // width: constraints.maxWidth * 0.2,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text('Amount: 250',
                                  style: Theme.of(context).textTheme.subtitle1,),
                            ),
                          ),
                          // Container(
                          //   width: constraints.maxWidth * 0.2,
                          //   child: Text(
                          //     '250',
                          //     style: Theme.of(context).textTheme.subtitle1,
                          //     textAlign: TextAlign.center,
                          //     overflow: TextOverflow.ellipsis,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.05,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
          ],
        );
      },
    );
  }
}
