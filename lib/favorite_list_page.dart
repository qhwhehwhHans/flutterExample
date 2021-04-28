import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class FavoriteListPage extends StatelessWidget {

  final List<WordPair> favorites;

  FavoriteListPage(this.favorites);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("this favority items"),
      ),
      body: ListView.separated(itemBuilder: (BuildContext context, int index){
        return ListTile(
          title: Text(
            favorites[index].asPascalCase,
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
          ),
        );
      }, separatorBuilder: (BuildContext context,int index){
        return Divider();
      }, itemCount: favorites.length),
    );
  }
}

class items extends StatefulWidget {
  @override
  _itemsState createState() => _itemsState();
}

class _itemsState extends State<items> {
  @override
  Widget build(BuildContext context) {
    return Text("test1");
  }
}

