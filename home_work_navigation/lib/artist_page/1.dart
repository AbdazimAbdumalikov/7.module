import 'package:flutter/material.dart';
import 'dart:convert';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('name'),
      ),
      body: Center(
        child: FutureBuilder(builder: (context, snapshot) {
          var showData = jsonDecode(snapshot.data.toString());
          return ListView.builder(
            itemCount: showData.length,
            itemBuilder: (BuildContext context, int index){
              return ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FirstPage())
                  );
                },
                title: Text(showData[index]['about']),
              );
            },
          );
        }, future: DefaultAssetBundle.of(context).loadString('assets/artists.json'),
        ),
      )
    );
  }
}
