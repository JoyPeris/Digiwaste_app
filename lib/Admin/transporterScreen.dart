import 'dart:convert';
<<<<<<< HEAD
import 'package:digiwaste_dev/Admin/paymentsScreen.dart';
import 'package:dio/dio.dart';

=======
>>>>>>> e9ffc5b8adbc76fad136e8268beb073b36261621
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:digiwaste_dev/Login/loginScreen.dart';
import 'package:digiwaste_dev/Admin/SearchUser.dart';
import 'package:digiwaste_dev/Admin/scheduleScreen.dart';
import 'package:digiwaste_dev/Api/api.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';

class Transporter extends StatefulWidget {
  @override
  _TransporterState createState() => _TransporterState();
}

class _TransporterState extends State<Transporter>  {
  var userData;
  @override
  void initState() {
    _getUserInfo();
    super.initState();
  }

  void _getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    var user = json.decode(userJson);
    setState(() {
      userData = user;
    });

  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Future<List> fetchData() async{

<<<<<<< HEAD
    final response = await http.get(CallApi().returnUrl()+"transporters");
=======
    final response = await CallApi().getData('transporters');
>>>>>>> e9ffc5b8adbc76fad136e8268beb073b36261621
    final dynamic data= json.decode(response.body);
    print(data['transporters']);
    return data['transporters'] ;


  }

  void _searchUser() {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => SearchUser()));
  }

  void logout() async{

    var res = await CallApi().getData('logout');
    var body = json.decode(res.body);
    if(body['success']){
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.remove('token');
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => LogIn()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
<<<<<<< HEAD
      appBar:AppBar(
=======
      appBar: AppBar(
>>>>>>> e9ffc5b8adbc76fad136e8268beb073b36261621
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.bars),
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();

            }),
<<<<<<< HEAD
        title:Text('Transporter'),centerTitle: true,),
=======
        title: Text("Transporters"),
        centerTitle: true,
      ),
>>>>>>> e9ffc5b8adbc76fad136e8268beb073b36261621
      body: FutureBuilder<List>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData ? new ItemList(list: snapshot.data,)
              : new Center(
            child:  CircularProgressIndicator(),
          );
        },
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Icon(
                FontAwesomeIcons.userCircle,
                size: 100.0,
                color: Color(0xFF9b9b9b),
              ),
              decoration: BoxDecoration(
                color: Color(0xFFFF835F),
              ),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.truck),
              title: Text('Transporters'),
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => Transporter()));
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.calendar),
              title: Text('Schedules'),
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
<<<<<<< HEAD
                        builder: (context) => Transporter()));
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.truck),
              title: Text('Payment'),
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => Home()));
=======
                        builder: (context) => Schedule()));
>>>>>>> e9ffc5b8adbc76fad136e8268beb073b36261621
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.signOutAlt),
              title: Text('Logout'),
              onTap: () {
                logout();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _searchUser,
        child: Icon(FontAwesomeIcons.plus),
      ),

    );
<<<<<<< HEAD
  }
  void logout() async{
    // logout from the server ...
    var res = await CallApi().getData('logout');
    var body = json.decode(res.body);
    if(body['success']){
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.remove('token');
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => LogIn()));
    }

  }
  void _searchUser() {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => SearchUser()));
  }
}
=======
  }}

>>>>>>> e9ffc5b8adbc76fad136e8268beb073b36261621
class ItemList extends StatelessWidget{
  List list;
  ItemList({this.list});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return Container(
              padding: const EdgeInsets.all(10),
              child: Card(
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[

                      Text(list[i]['firstName']),

                      SizedBox(width: 5,),
                      Text(list[i]['lastName']),
                    ],
                  ),

                  leading: Icon(Icons.assignment_ind),
                  subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
<<<<<<< HEAD
                        Text('Phone Number : '),
                        Text(list[i]['phone'])
                      ],
                    ),
                    SizedBox(height: 2,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text('Region : '),
                        Text(list[i]['region'])
                      ],
                    ),
=======
                        SizedBox(height: 2,),
                        Row(

                          mainAxisAlignment: MainAxisAlignment.start,

                          children: <Widget>[
                            Text('Email Address : '),

                            Text(list[i]['email'])
                          ],
                        ),
                        SizedBox(height: 2,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text('Phone Number : '),
                            Text(list[i]['phone'])
                          ],
                        ),

//                    SizedBox(height: 2,),
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      children: <Widget>[
//                        Text('Status : '),
//                        Text(list[i]['status'])
//                      ],
//                    ),
>>>>>>> e9ffc5b8adbc76fad136e8268beb073b36261621
//                    SizedBox(height: 2,),
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      children: <Widget>[
//                        Text('National ID : '),
//                        Text(list[i]['address'])
//                      ],
//                    ),
//                    SizedBox(height: 2,),
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      children: <Widget>[
//                        Text('Age : '),
//                        Text(list[i]['age'])
//                      ],
//                    ),
//
//                  ],
//                ),

                      ]),
                  /* trailing:
                Switch(
                  onChanged: (val) => setState(() => _isSwitched = val),
                  value: _isSwitched,
                ),*/

                ),
              )
          );
        })
    ;
  }}


<<<<<<< HEAD
=======









>>>>>>> e9ffc5b8adbc76fad136e8268beb073b36261621






