import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:monthly_pay_admin/Common_Widgets/bottomNavigationBar.dart';
import 'package:monthly_pay_admin/Customer_Dashboard/CustomerDashboard.dart';
import 'package:monthly_pay_admin/Profile/models/request_class.dart';
import 'package:monthly_pay_admin/Profile/widgets/request.dart';
import 'package:monthly_pay_admin/Profile/widgets/update_mobile.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name;
  File _image;

  Future getImage() async{
    final image= await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image!=null)
    {
      setState(() {
      _image=image;
       });
    }
  }

   Future<bool> _backPressed() {
    return Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => CustomerDashboard()));
  }

  int _currentTab = 3;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _backPressed,
          child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
              'My Profile',
              style: Theme.of(context).textTheme.headline5
          ),
          backgroundColor: Theme.of(context).primaryColor,
          
          actions: [
            FlatButton(
              child: Text(
                'Log Out',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
              onPressed: (){},
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.25,
                    color: Theme.of(context).primaryColor,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: getImage,
                        child: Container(
                          height: 140,
                         width: 140,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(60)
                         ),
                         child: _image!=null ? new Container(
                             width: 190.0,
                             height: 190.0,
                             decoration: new BoxDecoration(
                                 shape: BoxShape.circle,
                                 image: new DecorationImage(
                                     fit: BoxFit.fill,
                                     image: FileImage(_image)
                                 )
                             )):
                         Stack(
                           children: [
                             IconButton(
                              icon: Icon(
                                  Icons.account_circle,
                                  color: Theme.of(context).accentColor),
                              iconSize: 140,
                              onPressed: getImage,
                            ),
                             Positioned(
                               left: 100,
                               top: 100,
                               child: CircleAvatar(
                                   child: IconButton(
                                     onPressed: getImage,
                                       icon:Icon(Icons.edit)
                                   )
                               ),
                             )
                           ],
                         )
                        ),
                      )  ,
                       name!=null && name!=' ' ?
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 20),
                              Text(
                              name,style: Theme.of(context).textTheme.headline5,
                            ),
                            ],
                          ): Text(
                         '',
                         style: Theme.of(context).textTheme.headline5,
                       )
                    ],
                  ),
                ]
              ),
              ListTile(
                title: Text(
                  'Name',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                subtitle: TextField(
                  decoration: InputDecoration(
                    hintStyle: Theme.of(context).textTheme.subtitle2,
                    hintText: 'Full Name'
                  ),
                  onSubmitted: (value){
                    setState(() {
                      name=value;
                    });
                  },
                )
              ),
              SizedBox(height: 20),
              ListTile(
                title: Text(
                  'Contacts',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                subtitle: Column(
                  children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: <Widget>[
                     Text('Enter Mobile Number',style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 22),),
                     IconButton(icon: Icon(Icons.edit), onPressed:() => _Fade(context, updateMobile(_image)))
                   ],),
                    TextField(
                      style: TextStyle(
                          color: Colors.black
                      ),
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon:Icon(Icons.edit),
                            onPressed: (){},
                          ),
                          hintText: 'Enter Email',
                          hintStyle: Theme.of(context).textTheme.subtitle2
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              ListTile(
                title: Text(
                'Address Detail',
                style: Theme.of(context).textTheme.subtitle1,
              ),
                subtitle: Column(
                  children: [
                    tile(context,'State'),
                    tile(context,'District'),
                    tile(context,'City'),
                    tile(context,'Pin'),
                    tile(context,'Landmark'),
                  ],
                ),
              ),
              SizedBox(height: 20),

            ],
          ),
        ),

        bottomNavigationBar: NavigationBar(currentTab: _currentTab,),
      ),
    );
  }
  Widget tile(BuildContext context,String str){
    return TextField(
      style: TextStyle(
          color: Colors.black
      ),
      decoration: InputDecoration(
          hintText: str,
          hintStyle: Theme.of(context).textTheme.subtitle2
      ),
    );
  }

  void _Fade(BuildContext context,Widget widget){
    Navigator.of(context).push(
        PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 600),
            pageBuilder: (context,animation,secondaryAnimation){
              return widget;
            },
            transitionsBuilder: (context,animation,secondaryAnimation,child){
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            }
        )
    );
  }
}


