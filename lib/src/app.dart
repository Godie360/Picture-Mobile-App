import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'dart:convert';
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  createState() {
    return AppState();
  }

}

class AppState extends State<App>{
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter++;
    final response = await get(Uri.parse('https://jsonplaceholder.typicode.com/photos/$counter'));
    final imageModel = ImageModel.fromJson(json.decode(response.body));
    setState(() {
      images.add(imageModel);
    });
  }



  Widget build(context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: ImageList(images),
      floatingActionButton: FloatingActionButton(
        child : Icon(Icons.add),
        onPressed: fetchImage,
      ),
      appBar: AppBar(
        title: Text('Let See Some Images!'),
        backgroundColor: Colors.blue
      ),
      
    ),
  );
  }
}