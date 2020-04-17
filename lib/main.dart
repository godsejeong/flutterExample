import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
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
  List<String> _listItems = [];
  
  Widget _addItem(){
    return ListView.builder(
      padding : EdgeInsets.all(0.0),
      itemCount: _listItems.length,
      itemBuilder: (context,index){
        return Center(child : Image.asset(_listItems[index]));
      }
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TutroailMemo"),
      ),
      body : Center(
        child: _addItem()
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed:()
          {
          _listItems.add('assets/images/one.jpeg');
          setState((){});
          ShowToast("add New Item");
        },
        child: Icon(Icons.add),
      ),
    );
  }
  
  void ShowToast(String msg,){
    Toast.show(msg, context,duration:2,gravity : 0);
  }
  }
