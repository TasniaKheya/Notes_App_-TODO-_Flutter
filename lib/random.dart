import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:math';

class StateFulApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StateFulAppState();
  }

}

class StateFulAppState extends  State<StatefulWidget>  {
  final _wordGenerator = <String>[];
  final _savedWordPair = Set<String>();


  Widget _buildList()
  {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    if(_wordGenerator.isEmpty)
      {

        return Container(
          height: height,
          width : width,
          color: Colors.white,
        );
      }
    else {
      return Stack(
        children: [
          Container(
            height: height,
            width : width,
            color: Colors.white,
          ),

          Container(
            child: ListView.builder(
                padding: EdgeInsets.all(10.0),

                itemBuilder: (context, item) {
                  //_wordGenerator.add(generateWordPairs().take(10) as WordPair);
                  if (item.isOdd) {
                    return Divider();
                  }

                  final index = item ~/ 2;

                 //if (index >= _wordGenerator.length) {

                    // _wordGenerator.addAll(generateWordPairs().take(10) );
                  //}
                  if(index < _wordGenerator.length) {
                    return _buildRow(_wordGenerator[index]);
                  }
                }
            ),
          ),
        ],
      );
    }
  }
  Widget _buildRow(String pair)
  {
    final alreadySaved = _savedWordPair.contains(pair);
    return Container(
      color: Color.fromARGB(
        255,
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
      ),
      child: ListTile(
          title: Text(
              pair,
              style:TextStyle(
                fontSize: 18.0,
              )
          ),
        trailing: Icon(
          alreadySaved ? Icons.favorite : Icons.favorite_border_outlined,
          color: alreadySaved? Colors.red : null,
        ),
        onTap: (){
            setState(() {
              if(alreadySaved)
                {
                  _savedWordPair.remove(pair);
                }
              else
                {
                  _savedWordPair.add(pair);
                }
            });
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("To Do List",style: TextStyle(
          color: Colors.white,
          fontSize: 22,

        ),),),
        backgroundColor: Colors.purple[900],

      ),
      floatingActionButton: FloatingActionButton(onPressed: (){_showDialog();},
      child:Icon(
        Icons.add,
      ),),
      body: _buildList(),
    );

  }

  void _showDialog() {
    TextEditingController _controller = new TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context)
        {
          return AlertDialog(
            title: Text('Note Box'),
            content: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText:"Enter Your Input Here"
              ),
            ),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Cancel"
                  ),
              ),
              TextButton(
                onPressed: (){
                  _wordGenerator.add(_controller.text);
                  Navigator.of(context).pop();
                },
                child: Text(
                    "Add Note"
                ),
              ),
            ],
          );
        }
    );

    _buildList();
  }
}

