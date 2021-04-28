import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

import 'favorite_list_page.dart';

Set<WordPair> _saved = Set<WordPair>();

class WordListPage extends StatelessWidget {
  const WordListPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello My First app"),
        actions: [
          IconButton(
            icon:Icon(Icons.favorite),
            onPressed: (){
              print("Click action button");
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return FavoriteListPage(_saved.toList());
              }));
          },)
        ],
      ),
      body: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {

  List<WordPair> words = [];

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return ListView.builder(
      itemBuilder: (BuildContext context, int index){
        if(index>=words.length) words.addAll(generateWordPairs().take(10));
        return _getRow(words[index]);
      },
    );
  }

  Widget _getRow(WordPair wordPair){

    bool _isAlreadySaved = _saved.contains(wordPair);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(wordPair.asPascalCase),
          trailing: Icon(
            _isAlreadySaved?Icons.favorite:Icons.favorite_border,
            color: _isAlreadySaved?Colors.redAccent:Colors.grey,
          ),
          onTap: (){
            setState(() {
              if(_isAlreadySaved) {
                _saved.remove(wordPair);
              } else {
                _saved.add(wordPair);
              }
            });
          },
        ),
        Divider(),
      ],
    );
  }
}
