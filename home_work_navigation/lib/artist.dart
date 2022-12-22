import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:home_work_navigation/artist_page/1.dart';

class ArtistPage extends StatefulWidget {
  const ArtistPage({Key? key}) : super(key: key);

  @override
  State<ArtistPage> createState() => _ArtistPageState();
}

class _ArtistPageState extends State<ArtistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artist'),
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
                  title: Text(showData[index]['name']),
                  subtitle: Text(showData[index]['link']),
                );
            },
          );
        }, future: DefaultAssetBundle.of(context).loadString('assets/artists.json'),
        ),
      )
    );
  }
}
