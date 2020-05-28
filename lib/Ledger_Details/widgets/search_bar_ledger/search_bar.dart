import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';

import 'post.dart';


class SearchUserBar extends StatelessWidget{
  Future<List<Post>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(search.length, (int index) {
      return Post(
        "Title : $search $index",
        "Description :$search $index",
      );
    });

  }
  @override
  Widget build(BuildContext context) {
    Color c1 = Theme.of(context).primaryColor;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: c1,
          centerTitle: true,
          title: Text("Search",style: TextStyle(color: Colors.white,fontFamily: 'Viaoda Libre'),),
        ),
      body: SafeArea(child:Padding(padding: const EdgeInsets.all(10.0),
      child: SearchBar<Post>(
        icon: Icon(Icons.search,color: c1,size: 30,),
        loader: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            ),
        onSearch: search,
        onError: (error) {
          return Center(
            child: Text("Error occurred : $error"),
          );
        },
          emptyWidget: Center(
            child: Text("No Record Found"),
          ),
        onItemFound: (Post post, int index) {
          return Card(
            elevation:10,
            child: ListTile(
              title: Text(post.title),
              subtitle: Text(post.description),
            ),

          );
        },

      ),)),
    );
  }
}