import 'package:flutter/material.dart';
import 'categoryList.dart';
import 'fetchData.dart';
// import 'sampleFetch.dart';

// void main() => runApp(new MyApp());

void main() {
  runApp(MaterialApp(
    title: 'Home Page',
    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),
      '/categorylist': (context) => CategoryList(),
      '/fetchdata': (context) => ParentPhotoPage(),
      // '/samplefetch': (context) => MyApp(),
    },
  ));
}

class HelloRectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Container(
          color: Colors.greenAccent,
          width: 300.0,
          height: 400.0,
          child: Center(
            child: Icon(
              Icons.cake,
              size: 100.0,
              color: Colors.redAccent,
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 50.0,
                width: 200.0,
                child: RaisedButton(
                  elevation: 5.0,
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.pushNamed(context, '/fetchdata');
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Icon(
                          Icons.list,
                          size: 20.0,
                        ),
                      ),
                      Center(
                        child: Text('FETCH DATA!!!'),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50.0,
                width: 200.0,
                margin: EdgeInsets.only(top: 20.0),
                child: RaisedButton(
                  elevation: 5.0,
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.pushNamed(context, '/categorylist');
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Icon(
                          Icons.category,
                          size: 20.0,
                        ),
                      ),
                      Center(
                        child: Text('CATEGORY LIST!!!'),
                      ),
                    ],
                  ),
                ),
              ),
              // Container(
              //   height: 50.0,
              //   width: 200.0,
              //   margin: EdgeInsets.only(top: 20.0),
              //   child: RaisedButton(
              //     elevation: 5.0,
              //     color: Colors.blueAccent,
              //     textColor: Colors.white,
              //     onPressed: () {
              //       Navigator.pushNamed(context, '/samplefetch');
              //     },
              //     child: Row(
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: <Widget>[
              //         Padding(
              //           padding: EdgeInsets.only(right: 20.0),
              //           child: Icon(
              //             Icons.category,
              //             size: 20.0,
              //           ),
              //         ),
              //         Center(
              //           child: Text('Sample Fetch!!!'),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
