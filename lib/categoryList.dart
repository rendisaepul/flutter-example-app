library categorylist;

import 'package:flutter/material.dart';

var category = [
  'satu',
  'dua',
  'tiga',
  'empat',
  'lima',
  'enam',
  'tujuh',
  'delapan',
  'sembilan',
  'sepuluh',
  'sebelas',
  'duabelas'
];

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Category List'),
        ),
        body: ListView.builder(
          itemCount: category.length,
          itemBuilder: (context, int index) {
            return InkWell(
              highlightColor: Colors.greenAccent,
              splashColor: Colors.blueAccent,
              onTap: () {
                // Navigator.pop(context);
                print('Tapppped');
              },
              child: Container(
                color: Colors.black12,
                height: 70.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Icon(
                          Icons.fastfood,
                          size: 40.0,
                          color: Colors.redAccent,
                        ),
                      ),
                      Center(
                        child: Text(
                          category[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.redAccent,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
