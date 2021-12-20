import 'dart:collection';
import 'dart:math';
import 'package:flutter_application_6/area_main.dart';
import 'package:flutter_application_6/login.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:async';
import 'asilmain.dart';


                          
                   

var arda,peker;
var tempLong,tempLat;
var metin;
var fark1,fark2;
var distanceInMeters;
var now;
var now2;
var hiz;
var newLat,newLong;
var ang;
var count =0;

void main() {
    runApp(MyApp()); 
}
class MyApp extends StatelessWidget { 
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
  
}

class _MyHomePageState extends State<MyHomePage> {

  MapType _currentMapType = MapType.normal;
   
  LatLng _initialcameraposition = LatLng(20.5937, 18.9629);
  late GoogleMapController _controller;
  final Location _location = Location();
//
  List<Polyline> myPolyline = [];
//




//App bar'a basinca yandan menu acilmasi.
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  get polylinePoints => null;
  @override

//Circle olusturmaaaaaaaaaaaaaa
 /*Set<Circle> circles = Set.from([
  Circle(
     circleId: CircleId('1'),
     center:LatLng(arda,peker),
     radius: 1,
     strokeWidth: 10,
     
   ),   
 ]);*/
///////////////////////////////
    
     bool First = true;
     bool pb = false;
    List<LatLng> data =[];
//Veri guncellendikce fonksiyonda degisiklik icin setState kullan.
 void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
     _setPolygons();
      createPloyLineRotaEkle();
    
    //Rota takibiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii  
     if(pb==true)
    {
        if(First)
        {
          First = false;
          LatLng _new = LatLng(newLat, newLong);
          data.add(_new);

        }
        LatLng _news = LatLng(arda,peker);
        data.add(_news);   
    }
   createPloyLineKonumTakip();    
      ///////////////////////////////////////////////////

   
  }

   //Bir kez calican fonksiyonlar initStatede.
   void iniState() {
    super.initState();
     
    } 
 
   

  //Hiz almaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
   late StreamSubscription<Position> _positionStream;
   double _speed = 0.1;
  
  void initState() {
    _positionStream =
        Geolocator.getPositionStream()
            .listen((position) {
      _onSpeedChange(position == null ? 0.0 : (position.speed * 18) / 5); // m/s den km/hr ye cevirme.
    });
    super.initState();
  }
   void _onSpeedChange(double newSpeed) {
    setState(() {
      _speed = newSpeed;
       
    });
  }
  @override
  //State nesnesi kaldırılırken kalıcı olan nesneler kaldırılır 
  void dispose() {
    _positionStream.cancel();
    super.dispose();
  }
  ///////////////////////////////////////////////////


 
  //Rota Takibiiiiiiiiiiiiiiiiiiiiiiiiiiiiii
    createPloyLineKonumTakip(){     
         myPolyline.add(
          Polyline(
          polylineId: PolylineId('1'),
          color: Colors.blue,
          width: 5,
          points: data,
          
        ),
      );                          
    }
  ////////////////////////////////////////// 
  
  // Profil EKLEMEEEEEEEEEEEEEEEEEEEEEEEEEEEe
  //polyline id'yi 2 verme sebebim createPloyLine'da yani rota takibinde id 1 karismasin diye buna 2 verdim.
    createPloyLineRotaEkle(){ 
         myPolyline.add(
          Polyline(
          polylineId: PolylineId('2'),
          color: Colors.red,
          width: 3,
          points: [
        
          
           
            LatLng(39.890755,32.720318),
            LatLng(39.890656, 32.710251),
            LatLng(39.879768, 32.707500),
            LatLng(39.877289, 32.717312 ),
           
          
            //LatLng(a,b),
            ]

        ),
        
      );   
    }  
  ////////////////////////////////////////////  
  // AREA EKLEMEEEEEEEEEEEEEEEEEEEEEEEEEEEe
  Set<Polygon> _polygons = HashSet<Polygon>();
   void _setPolygons() {
    List<LatLng> polygonLatLongs = <LatLng>[];
    polygonLatLongs.add(LatLng(39.888172, 32.718889));
    polygonLatLongs.add(LatLng(39.890800, 32.720300));
    polygonLatLongs.add(LatLng(39.891800, 32.720000));
    polygonLatLongs.add(LatLng(39.889500, 32.715540));              
    _polygons.add(
      Polygon(     
        polygonId: PolygonId("0"),
        points: polygonLatLongs,
      //arealarin colorlarini selected index ile degistirebiliriz.
        // fillColor: selectedIndex == index ? Colors.pink: Colors.blue,
        fillColor: Colors.white70,      
        strokeWidth: 2,
      ),
    );
  }
   /////////////////////////////////////////
  
  //Icona Basinca Renginin Degismesi.
   Color _iconColor1 = Colors.white;
   Color _iconColor2 = Colors.white;
   Color _iconColor3 = Colors.white;

  /////////////////////////////////////////

  Widget build(BuildContext context){
    //Denizcanin ekledigi 
    final Size size = MediaQuery.of(context).size;   
    /////////////////////  
    
    return Scaffold( 
      
     
       bottomNavigationBar: new BottomAppBar(
          notchMargin: 5.0,
              shape: CircularNotchedRectangle(),

        color: Colors.green[800],
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
             SizedBox(
                            width: size.width * 0.03,
                          ),
           IconButton(padding: new EdgeInsets.only(bottom: 4),
           
                              onPressed: () {
                                      setState(() {
                                         if(_iconColor3 == Colors.white){
                                                _iconColor3 = Colors.black;
                                                  if(_iconColor1 == Colors.black)
                                                  {
                                                    _iconColor1 = Colors.white;
                                                  }
                                                  if(_iconColor2 == Colors.black)
                                                  {
                                                    _iconColor2 =Colors.white;
                                                  }
                                             }
                                            else{
                                                _iconColor3 = Colors.white;
                                              }
                                          pb = true;
                                             

                                        });
                                                                                    
                      }, icon: Icon(Icons.play_circle_fill_sharp),color:_iconColor3),
                     Text('Start',
                      style: TextStyle(
              fontSize: 15,          
              fontWeight: FontWeight.w700,
                  color: Colors.white,
                 ),
                 ),
                       SizedBox(
                            width: size.width * 0.06,
                          ),
                           IconButton(padding: new EdgeInsets.only(bottom: 4,),
                          
                              onPressed: () {
                                if(_iconColor2 == Colors.white){
                                              _iconColor2 = Colors.black;
                                                if(_iconColor1 == Colors.black)
                                                  {
                                                    _iconColor1 = Colors.white;
                                                  }
                                               if(_iconColor3 == Colors.black)
                                              {
                                                _iconColor3 =Colors.white;
                                              }
                                        }
                                        
                                        else{
                                            _iconColor2 = Colors.white;
                                        }
                                 pb = false;
                                 
                                        

                              },
                              
                              icon: Icon(Icons.pause),color:_iconColor2),
                         Text('Pause',
                      style: TextStyle(
              fontSize: 15,          
              fontWeight: FontWeight.w700,
                  color: Colors.white
                 ),
                 ),
                          
                           SizedBox(
                            width: size.width * 0.06,
                          ),
                          IconButton(padding: new EdgeInsets.only(bottom: 4),
                              onPressed: () {
                                 if(_iconColor1 == Colors.white){
                                            _iconColor1 = Colors.black;
                                              if(_iconColor2 == Colors.black || _iconColor3 == Colors.black)
                                                  {
                                                    _iconColor2 =Colors.white;
                                                    _iconColor3 = Colors.white;
                                                  }
                                        }else{
                                          _iconColor1 = Colors.white;
                                        }

                                data.clear();
                                pb = false;
                                
                                       
                                }, icon: Icon(Icons.stop),color:_iconColor1),
                                Text('Stop',
                      style: TextStyle(
              fontSize: 15,          
              fontWeight: FontWeight.w700,
                  color: Colors.white,
                 ),
                 ),
          ],
        ),
      ),
   
  
      //enlem ve boylami gostercek
     /* bottomNavigationBar :Container(                  
      height: 20,
      color: Colors.transparent,
      //color: Colors.grey[150],
      alignment: Alignment.topLeft,
      child:Text( 
            
        //eger distance kontorlu yapmak istersek bunu asagi yapistir, calculateDistance(39.890755, 32.720318, 39.8949023, 32.7048104)        
      " do not Follow   Stop                                      Pause        Start",
      style: TextStyle(
              fontSize: 15,          
              fontWeight: FontWeight.w700,
                  color: Colors.grey[1000],
                 ),
                 
                 textAlign: TextAlign.center,
    
      ),        
      ), */  
      //App bar'a basinca yandan menu acilmasi.
      key: _scaffoldKey,
      
      drawer:Drawer(   
        child: Container(
         color:Colors.black12,
         margin: EdgeInsets.zero,
         padding: EdgeInsets.all(1.0),
        //Drawer'a sayfalari ekliyoruz.
        child: ListView(     
          children:[
            const DrawerHeader(
               decoration: BoxDecoration( 
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),      
                image: DecorationImage(
                  image: AssetImage('lib/assets/drawer.jpg'),
                  fit: BoxFit.cover,             
                ),
               ),
              child: Text('Tactical Tracking System',
               style: TextStyle(
              fontSize: 25,          
              fontWeight: FontWeight.w700,
              color: Colors.white38            
                 ),
                 textAlign: TextAlign.center,

                 
              ),
             
              ),
              
            const SizedBox(height: 0),           
            ListTile(
              leading: Icon(Icons.home,color: Colors.black,),
             title: const Text('Active Mission',
             style: TextStyle(
              fontSize: 15,          
              fontWeight: FontWeight.w700,            
                 ),
               textAlign: TextAlign.start,

             ),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder:(context)=>MyHomePage()));
              
              },
            ),
           
             Divider(              
             height: 5,
             color: Colors.black,
             ),
            ListTile(
               leading: Icon(Icons.directions,color: Colors.black,),
             title: const Text('Profile',
             style: TextStyle(
              fontSize: 15,          
              fontWeight: FontWeight.w700,            
                 ),
               textAlign: TextAlign.start,

             ),
              onTap: () {
                    
                if(1==1){
                  Navigator.push(context,MaterialPageRoute(builder:(context)=>LoginPage()));


                }
                else{

                
                 Navigator.push(context,MaterialPageRoute(builder:(context)=>Profile()));   
                }  
                //Profile sayfasina gideriz.         
              //Navigator.push(context,MaterialPageRoute(builder:(context)=>Profile()));

              
              
              },
            ),
            Divider(
            height: 5,
            color: Colors.black,
             ),
            ListTile(
               leading: Icon(Icons.map,color: Colors.black,),
             title: const Text('Layers',
             style: TextStyle(
              fontSize: 15,          
              fontWeight: FontWeight.w700,            
                 ),
               textAlign: TextAlign.start,

             ),
              onTap: () {
                    
                if(1==1){
                    Navigator.push(context,MaterialPageRoute(builder:(context)=>LoginPage()));
                }
                else{
               
                 Navigator.push(context,MaterialPageRoute(builder:(context)=>Layer()));   
                }  
               //  Navigator.push(context,MaterialPageRoute(builder:(context)=>Layer()));
                
              },
            ),
             Divider(
            height: 12,
            color: Colors.black,
             ),
            ListTile(
               leading: Icon(Icons.aspect_ratio_rounded,color: Colors.black,),
             title: const Text('Areas',
             style: TextStyle(
              fontSize: 15,          
              fontWeight: FontWeight.w700,            
                 ),
               textAlign: TextAlign.start,

             ),
              onTap: () {
                
                if(1==1){
                                  Navigator.push(context,MaterialPageRoute(builder:(context)=>LoginPage()));


                }
                else{

                
                 Navigator.push(context,MaterialPageRoute(builder:(context)=>AreaPage()));   
                }          
              },
            ),
             Divider(
            height: 5,
            color: Colors.black,
             ), 
            /*RaisedButton(       
            onPressed: () {},
            color: Colors.transparent,
            elevation: 0.0,
            child: Text('${_speed.toInt()} km/h',
            style: TextStyle(
              fontSize: 15,          
              fontWeight: FontWeight.w700,            
                 ),
           textAlign: TextAlign.start,

            )
          ),   
          RaisedButton(
            
            onPressed: () {},
             color: Colors.transparent,
            elevation: 0.0,
            child: Text('${ang}°',
            style: TextStyle(
              fontSize: 15,          
              fontWeight: FontWeight.w700,            
                 ),
           textAlign: TextAlign.start,

            )
          ),     
          RaisedButton(
            onPressed: () {},
             color: Colors.transparent,
            elevation: 0.0,
            child: Text('    Longitude = ${arda}',
            style: TextStyle(
              fontSize: 15,          
              fontWeight: FontWeight.w700,            
                 ),
           textAlign: TextAlign.start,

            )
          ),     
          RaisedButton(
            
            onPressed: () {},
             color: Colors.transparent,
            elevation: 0.0,
            child: Text(' Latitude = ${peker}',
            style: TextStyle(
              fontSize: 15,          
              fontWeight: FontWeight.w700,            
                 ),
           textAlign: TextAlign.start,

            )
          ),
             */           
            const SizedBox(height: 310),     
            Divider(
            height: 12,
            color: Colors.black,
             ),
         ListTile(
               leading: Icon(Icons.account_box_rounded,color: Colors.black,),
             title: const Text('Login',
             style: TextStyle(
              fontSize: 15,          
              fontWeight: FontWeight.w700,            
                 ),
               textAlign: TextAlign.start,

             ),
              onTap: () {
                
                if(1==1){
                                  Navigator.push(context,MaterialPageRoute(builder:(context)=>LoginPage()));


                }
                else{

                
                 Navigator.push(context,MaterialPageRoute(builder:(context)=>AreaPage()));   
                }          
              },
            ),
            Divider(
            height: 12,
            color: Colors.black,
             ),           
          ],
        ),
      ),        
    ),
    
      appBar: PreferredSize(               
        preferredSize: Size.fromHeight(35.0),//app bar yuksekligi.      
        child: AppBar(     
          backgroundColor: Colors.green[800],

              
          //backgroundColor: Colors.transparent,
          elevation: 0.8,            
          title: Text(
            '                       Active Mission',                   
            style: TextStyle(
              fontSize: 15.7,          
              color: Colors.white,
              fontWeight: FontWeight.w500,            
            ),
          ),      
          //App bar'a basinca yandan menu acilmasi.
          leading: new IconButton(
          icon: const Icon(Icons.menu,color: Colors.white,),
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
           ),
          ),
      ),
  
      ////////////////////////////////////////////////
   
      //////////////////////////////////////////////
      body: Stack(    
        children: <Widget>[
          
          _buildGoogleMap(context),
          _buildCompass(),
          _printMapAppBar(),
      
         
         /* Positioned(
            bottom: 0,
            left: 0,
         
            
            child: Container(
              

              //width: size.width,
              height: 60,
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(size.height, 10),
                  //  painter: BNBCustomPainter(),
                  ),
                
                  Container(
                      
                    width: size.width,
                    height: 50,
                    
                    child: Row(
                      
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                            IconButton(padding: new EdgeInsets.only(top: 20),
                              onPressed: () {
                                      setState(() {
                                          pb = true;
                                              if(_iconColor3 == Colors.black){
                                                _iconColor3 = Colors.white;
                                                  if(_iconColor1 == Colors.white)
                                                  {
                                                    _iconColor1 = Colors.black;
                                                  }
                                                  if(_iconColor2 == Colors.white)
                                                  {
                                                    _iconColor2 =Colors.black;
                                                  }
                                             }
                                            else{
                                                _iconColor3 = Colors.black;
                                              }

                                        });
                                                                                    
                      }, icon: Icon(Icons.play_circle_fill_sharp),color:_iconColor3),
                           IconButton(padding: new EdgeInsets.only(top: 20),
                          
                              onPressed: () {
                                 pb = false;
                                 
                                        if(_iconColor2 == Colors.black){
                                              _iconColor2 = Colors.white;
                                                if(_iconColor1 == Colors.white)
                                                  {
                                                    _iconColor1 = Colors.black;
                                                  }
                                               if(_iconColor3 == Colors.white)
                                              {
                                                _iconColor3 =Colors.black;
                                              }
                                        }
                                        
                                        else{
                                            _iconColor2 = Colors.black;
                                        }

                              },
                              
                              icon: Icon(Icons.pause),color:_iconColor2),
                         
                          

                          IconButton(padding: new EdgeInsets.only(top: 20),
                              onPressed: () {
                                data.clear();
                                pb = false;
                                
                                        if(_iconColor1 == Colors.black){
                                            _iconColor1 = Colors.white;
                                              if(_iconColor2 == Colors.white || _iconColor3 == Colors.white)
                                                  {
                                                    _iconColor2 =Colors.black;
                                                    _iconColor3 = Colors.black;
                                                  }
                                        }else{
                                          _iconColor1 = Colors.black;
                                        }

                                }, icon: Icon(Icons.stop),color:_iconColor1),
                          SizedBox(
                            width: size.width * 0.20,
                          ),
                          
                          
                              
                         
                        
                        ]),
                  )
                ],
              ),
            ),
          ),*/
          
        ], 
        
      ),
     
      
       //floationg action button'u haraket ettirdik.
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: SpeedDial(
           icon: Icons.add,
          
          
        
          backgroundColor: Colors.amber,
          children: [           
            SpeedDialChild(
              child: Icon(Icons.map),              
              label: 'Operation 1/1.000.000', 
               labelStyle: TextStyle(color: Colors.grey[1000], fontSize: 13,
               ),           
              backgroundColor: Colors.amberAccent,
              onTap: () { 
                      setState(() {
                      
                      this._currentMapType=MapType.none;
                      
                    });                   
              },
            ),
            SpeedDialChild(
              child: Icon(Icons.map),
              label: 'Agean Operation 1/500.000',
               labelStyle: TextStyle(color: Colors.grey[1000], fontSize: 13,
               ),
              backgroundColor: Colors.amberAccent,
              onTap: () { 

                  setState(() {
                      
                      this._currentMapType=MapType.satellite;
                      
                    });
              }
            ),
            SpeedDialChild(
              child: Icon(Icons.map),
              label: 'Transparent Instrument Charts',
               labelStyle: TextStyle(color: Colors.grey[1000], fontSize: 13,
               ),
              backgroundColor: Colors.amberAccent,
              onTap: () {
                setState(() {
                      
                      this._currentMapType=MapType.terrain;
                      
                    });
              },
            ),
            SpeedDialChild(
              child: Icon(Icons.reply),
              label: 'Reset',
               labelStyle: TextStyle(color: Colors.grey[1000], fontSize: 13,
               ),
              backgroundColor: Colors.amberAccent,
              onTap: () {
                
                  setState(() {
                      
                      this._currentMapType=MapType.normal;
                    });
              },
            ),
          ]),
             
    ); 
  }
  Widget _buildGoogleMap(BuildContext context) {
  late GoogleMapController _controller;  
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            GoogleMap(    
                            
             initialCameraPosition: CameraPosition(target: _initialcameraposition),
             //Zoom yapip, yapmamayi saglar.
             zoomGesturesEnabled: true,
             //Sagdaki Zoom In Zoom Out tuslarinin gorunurlugu.
             zoomControlsEnabled: false,
             mapType: _currentMapType,
             //onMapCreated: _onMapCreated, 
              myLocationEnabled: true,
                 polygons: _polygons,
                 polylines: myPolyline.toSet(),
                 //circles: circles,
              myLocationButtonEnabled: true,
              onMapCreated:(GoogleMapController _cntlr){
              _controller = _cntlr;          
              _location.onLocationChanged.listen((l) {  
             _controller.animateCamera(
               CameraUpdate.newCameraPosition(
              CameraPosition(
                    target: LatLng(                      
                       l.latitude!, 
                       l.longitude!),   
                                    
                      //zoom:20
                      zoom:18.2               
                      ),                      
                  ),

              );  
              
             
        newLat = tempLat;
        newLong = tempLong;
        tempLat =l.latitude;
        tempLong = l.longitude;

        //set state ile biz konumlarin her aliminda fonksiyonu guncelliyoruz ve her defasinda konumda haraket ettikce, degisen latitude ve longitude bilgilerinin guncel degerlerini yazdiriyoruz.     
        setState(() {  
        
           arda  = l.latitude ;
           peker = l.longitude; 
                   
         
              
               
        });           
      });  
          
             },           
            ),         
          ],          
        ),  
             
      );         
    }

 

    //Pusla Derecesiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii
    Widget _buildCompass() {
    return StreamBuilder<CompassEvent>(
      stream: FlutterCompass.events,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error : ${snapshot.error}');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        double? direction = snapshot.data!.heading;
        if (direction == null)
          return Center(
            child: Text("Cihazin sensoru yok !"),
          );
        ang = (direction.round());
        return Stack(
          children: [
            Container(
              child: Transform.rotate(
              angle: ((direction) * (3.1415926535897932 / 180) * -1),
                //child: Image.asset('assets/compass.png'),
              ),
            ),
            //Center ile sayfanin ortasinda deger gorunuyor teyit etmek icin kodu acabilirsin.
            /*Center(
              child: Text(
                "$ang",
                style: TextStyle(
                  color: Color(0xFFEBEBEB),
                  fontSize: 56,
                ),
              ),
            ),*/
            //////////////////
            /*
            Positioned(
              left: (width / 2) - ((width / 80) / 2),
              top: (height - width) / 2,
              child: SizedBox(
                width: width / 80,
                height: width / 10,
                child: Container(
                  //color: HSLColor.fromAHSL(0.85, 0, 0, 0.05).toColor(),
                  color: Color(0xBBEBEBEB),
                ),
              ),
            ),
            */
          ],
        );
      },
    );
  }
  ////////////////////////////////////////////////////
  
  //Speed Compass Location bilgilerinin containerlariiiiii
  
  Widget _printMapAppBar() {
    final Size size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.topRight,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:  1, right: 8.0,left: 13.0),
            child: Column(
              children: [
                   Row(
                  children: [
                    Container(
                      
                      padding: new EdgeInsets.only(top: 1.0),
                      
                     
                      child:Icon(
                      Icons.speed_rounded,
                      color: Colors.black,
                      size: 25.0,
                    ),
                      
                      
                      width: 100.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                           color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.0),
                          topRight: Radius.circular(5.0),
                          //bottomLeft: Radius.circular(5.0),
                          //bottomRight: Radius.circular(5.0),
                        ),
                      ),
                     
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: new EdgeInsets.only(top: 1.0),
                      child:Icon(
                      Icons.explore_outlined  ,
                      color: Colors.black,
                      size: 25.0,
                    ), 
                      width: 105.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                            color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.0),
                          topRight: Radius.circular(5.0),
                          //bottomLeft: Radius.circular(5.0),
                          //bottomRight: Radius.circular(5.0),
                        ),
                      ),
                     
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: new EdgeInsets.only(top: 1.0),
                      
                      child:Icon(
                      Icons.location_on_outlined,
                      color: Colors.black,
                      size: 25.0,
                    ),              
                      width: 130.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6.0),
                          topRight: Radius.circular(6.0),
                         // bottomLeft: Radius.circular(6.0),
                          //bottomRight: Radius.circular(6.0),
                        ),
                      ),
                    
                    ),
                    
                  ],
                ),
                 Row(
                  children: [
                    Container(
                      padding: new EdgeInsets.only(top: 5.0),
                      child: new Text('${_speed.toInt()}',
                      
                      style: TextStyle(
                        fontSize: 16.50,          
                        fontWeight: FontWeight.w700,
                        color: Colors.black            
                          ),
                          textAlign: TextAlign.center,),   

                      width: 100.0,
                      height: 40.0,
                      
                      decoration: BoxDecoration(
                           color: Colors.white,
                           
                        borderRadius: BorderRadius.only(
                          //topLeft: Radius.circular(5.0),
                          //topRight: Radius.circular(5.0),
                          bottomLeft: Radius.circular(5.0),
                          bottomRight: Radius.circular(5.0),
                          
                        ),
                        
                      ),                    
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: new EdgeInsets.only(top: 5.0),
                      child: new Text('${ang}°',
                      style: TextStyle(
                        fontSize: 16.50,          
                        fontWeight: FontWeight.w700,
                        color: Colors.black            
                          ),
                          
                          textAlign: TextAlign.center,),   
                      width: 105.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                            color: Colors.white,
                        borderRadius: BorderRadius.only(
                          //topLeft: Radius.circular(5.0),
                          //topRight: Radius.circular(5.0),
                          bottomLeft: Radius.circular(5.0),
                          bottomRight: Radius.circular(5.0),
                        ),
                      ),
                     
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: new EdgeInsets.only(top: 1.0),
                      child: new Text('Lat:${arda} Lon:${peker}',
                      style: TextStyle(
                        fontSize: 14.50,          
                        fontWeight: FontWeight.w700,
                        color: Colors.black            
                          ),
                          textAlign: TextAlign.center,),                
                      width: 130.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          //topLeft: Radius.circular(6.0),
                          //topRight: Radius.circular(6.0),
                          bottomLeft: Radius.circular(6.0),
                          bottomRight: Radius.circular(6.0),
                        ),
                      ),
                    
                    ),
                    
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  //////////////////////////////////////////////////

}

  

 
