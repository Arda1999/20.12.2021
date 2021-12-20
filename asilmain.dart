
import 'package:flutter/material.dart';
import 'package:flutter_application_6/main.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        
        primarySwatch: Colors.blue,
        
      ),
      
      
      home:  MyHomePage(),
     
    );
  }
}
class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
     
     
    );
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(title: Text('Profile Page')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Profile PAGE'),
        //ElevatedButton(child: Text('Git -> Route Grey'), onPressed: () {
           
          
          
       // }),
        ElevatedButton(child: Text('Geri Dön'), onPressed: () {
          
                  Navigator.pop(context);

        }),
      ])),
    );
  }
}
class Layer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(title: Text('Layer Page')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('LAYER PAGE'),
        //ElevatedButton(child: Text('Git -> Route Grey'), onPressed: () {
           
          
          
        //}),
        ElevatedButton(child: Text('Geri Dön'), onPressed: () {
                  Navigator.pop(context);

        }),
      ])),
    );
  }
}
