import 'package:flutter/material.dart';

class DateSelect extends StatefulWidget {
  @override
  _DateSelectState createState() => _DateSelectState();
}

class _DateSelectState extends State<DateSelect> {
  DateTime _fromDate;
  DateTime _toDate;

  @override
  Widget build(BuildContext context) {
    final Color ddMMBox = Theme.of(context).accentColor;
    final Color ddMM = Theme.of(context).primaryColor;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 45,
              child: Text(
                'From Date',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            GestureDetector(
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2001),
                  lastDate: _toDate == null ? DateTime(2222) : _toDate,
                ).then((value) {
                  setState(() {
                    _fromDate = value;
                  });
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  _fromDate == null
                      ? 'DD-MM'
                      : '${_fromDate.day} / ${_fromDate.month} / ${_fromDate.year}',
                  style: _fromDate == null
                      ? Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(color: ddMM,fontWeight: FontWeight.bold)
                      : Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontSize: 25, color: ddMM,fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ddMMBox,
                ),
              ),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 45,
              child: Text(
                'To Date',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            GestureDetector(
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: _fromDate == null ? DateTime.now() : _fromDate,
                  firstDate: _fromDate == null ? DateTime(2001) : _fromDate,
                  lastDate: DateTime(2222),
                ).then((value) {
                  setState(() {
                    _toDate = value;
                  });
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                    _toDate == null
                        ? 'DD-MM'
                        : '${_toDate.day} / ${_toDate.month} / ${_toDate.year}',
                    style: _toDate == null
                        ? Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(color: ddMM,fontWeight: FontWeight.bold)
                        : Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontSize: 25, color: ddMM,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ddMMBox,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
