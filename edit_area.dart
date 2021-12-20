import '../models/area.dart';
import 'package:flutter/material.dart';

class EditArea extends StatefulWidget {
  @override
  _EditAreaState createState() => _EditAreaState();
}

class _EditAreaState extends State<EditArea> {
  final List<Area> _areaList = [
    Area(
      areaName: 'Y-11',
      latitude: 39.2345,
      longitude: 41.6543,
    ),
    Area(
      areaName: 'Y-11',
      latitude: 34.2345,
      longitude: 29.6543,
    ),
    Area(
      areaName: 'Y-11',
      latitude: 40.2345,
      longitude: 45.6543,
    ),
    Area(
      areaName: 'Y-11',
      latitude: 31.2345,
      longitude: 33.6543,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text(
          '                   Edit Area',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
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
                child: RaisedButton(child: Text('Save Area'), onPressed: () {}),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: ListView.builder(
                    itemCount: _areaList.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Card(
                        elevation: 50,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey, width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                '${index + 1}       ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 150),
                                child: Text(
                                  '${_areaList[index].latitude.toStringAsFixed(4)}, ${_areaList[index].longitude.toStringAsFixed(4)}',
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                color: Colors.red,
                                onPressed: () {},
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}