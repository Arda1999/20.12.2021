import './edit_area.dart';

import './add_area.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Areas',
      home: AreaPage(),
    );
  }
}

class AreaPage extends StatefulWidget {
  @override
  _AreaPageState createState() => _AreaPageState();
}

class _AreaPageState extends State<AreaPage> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text(
          '                       Areas',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              //AddArea sayfasına geçiş için
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AddArea(),
              ));
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              child: Card(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Flexible(
                            child: IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {},
                            ),
                          ),
                          Flexible(
                            child: FlatButton(
                              child: Text('Edit'),
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => EditArea(),
                                  ),
                                );
                              },
                            ),
                          ),
                          Flexible(
                            child: FlatButton(
                              child: Text('Delete'),
                              onPressed: () {},
                            ),
                          ),
                          Flexible(
                            child: Text(
                              'Baslık',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      FlatButton(
                        child: Text(isVisible
                            ? 'Hide Coordinates'
                            : 'Show Coordinates'),
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            if (isVisible)
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Text('1'),
                              ),
                            if (isVisible)
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Text('2'),
                              ),
                            if (isVisible)
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Text('3'),
                              ),
                            if (isVisible)
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Text('4'),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                elevation: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}