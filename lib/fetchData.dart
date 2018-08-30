import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response =
      await client.get('https://jsonplaceholder.typicode.com/albums/1/photos');
  // return parsePhotos(response.body);
  return compute(parsePhotos, response.body);
}

List<Photo> parsePhotos(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

class Photo {
  final int id;
  final String title;
  final String thumbnailUrl;

  Photo({this.id, this.title, this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'] as int,
      title: json['title'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}

class ParentPhotoPage extends StatefulWidget {
  ParentPhotoPage({Key key}) : super(key: key);

  @override
  PhotoPage createState() => PhotoPage();
}

class PhotoPage extends State<ParentPhotoPage> {
  // PhotoPage({Key key}) : super(key: key);
  int _counter = 0;

  void incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('List Photo'),
              Text('$_counter'),
            ],
          ),
        ),
        body: Center(
          child: FutureBuilder<List<Photo>>(
            future: fetchPhotos(http.Client()),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return PhotoList(
                  photos: snapshot.data,
                  increment: incrementCounter,
                );
              } else if (snapshot.hasError) {
                print(snapshot.error);
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

class PhotoList extends StatelessWidget {
  final photos;
  final increment;

  PhotoList({Key key, this.photos, this.increment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            increment();
          },
          leading: CircleAvatar(
            child: Image.network(photos[index].thumbnailUrl),
          ),
          subtitle: Text(photos[index].title),
          title: Text(photos[index].id.toString()),
        );
      },
    );
  }
}
