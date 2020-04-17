import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  BuildContext ctx;
  
  @override
  Widget build(BuildContext context) {
    ctx = context;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

 @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _idController = TextEditingController();
  static String id = 'eDEFolvLn0A';

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: id,
    flags: YoutubePlayerFlags(autoPlay: true),
  );

  @override
  Widget build(BuildContext context) {
  TextEditingController _idController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: 
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              YoutubePlayer(
              controller: _controller,
              liveUIColor: Colors.amber,
              ),

             Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: _idController,
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Input Youtobe Video Code',
                )
              ),
            ),

            RaisedButton(
                onPressed: () {
                  setState(() {
                    id = _idController.text;
                    debugPrint('id: $id');
                    _controller.load(id);
                    
                  });
                },
                child: Text("Play"),
              ),
            ],
          ),
        ),        
      );
    
   
  }
}
  
  // void ShowToast(String msg){
  //   Toast.show(msg, context,duration:2,gravity : 0);
  // }
