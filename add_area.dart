import 'package:flutter/material.dart';

class AddArea extends StatefulWidget {
  @override
  _AddAreaState createState() => _AddAreaState();
}

class _AddAreaState extends State<AddArea> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text(
          '                   Add Area',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green[800]
      ),
      body: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Area Name:'),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Container(
                        width: 100,
                        child: TextField(
                          decoration: InputDecoration(labelText: 'Latitude'),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        width: 100,
                        child: TextField(
                          decoration: InputDecoration(labelText: 'Longitude'),
                        ),
                      ),
                    ),
                    Container(
                        width: 70,
                        child:
                            RaisedButton(child: Text('Add'), onPressed: () {})),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 60),
                  alignment: Alignment.center,
                  child:
                      RaisedButton(child: Text('Save Area'), onPressed: () {})),
            ],
          ),
        ),
      ),
    );
  }
}