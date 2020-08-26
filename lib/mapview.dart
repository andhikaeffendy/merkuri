import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:merkuri/form_merkurisk.dart';
import 'package:merkuri/page_settings.dart';

class MapView extends StatefulWidget {
  @override
  State<MapView> createState() => MapViewState();
}

class MapViewState extends State<MapView> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  double zoomVal = 5.0;
  bool _isVisble = false;

  List<String> litems = ["1","2","Third","4"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _googleMap(context),
//          _zoomMinusFunction(context),
//          _zoomPlusFunction(context),
          _isVisble ? _buildContainer(context) : Container(),
          Positioned(
            bottom: 10.0,
            left: 150.0,
            child: Center(
              child: FlatButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FormMerkurisk()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 4, color: Colors.white)),
                  child: Icon(
                    Icons.add_circle,
                    color: Colors.white,
                    size: 40.0,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 20.0,
            right: 0.0,
            child: FlatButton(
              onPressed: (){
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context){
                      return Container(
                        height: 200.0,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              'Filter By Provinsi',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold
                              ),
                            ),SizedBox(
                              height: 16.0,
                            ),Expanded(
                              child: ListView.builder(
                                  itemCount: litems.length,
                                  itemBuilder: (BuildContext context, int index){
                                    return _createListModel(context, 'Jawa Barat', Icons.opacity);
                                  }),
                            )
                          ],
                        ),
                      );
                    }
                );
              },
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 4, color: Colors.white)),
                child: Icon(
                  Icons.filter_list,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _googleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        mapToolbarEnabled: false,
        myLocationEnabled: true,
        initialCameraPosition: CameraPosition(
          target: LatLng(-6.914864, 107.608238),
          zoom: 12,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          Marker(
            markerId: MarkerId('Antapani'),
            position: LatLng(-6.918583, 107.660007),
            onTap: () {
              setState(() {
                _isVisble = !_isVisble;
              });
            },
            infoWindow: InfoWindow(
                title: 'Antapani'),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueOrange,
            ),
          ),
          Marker(
            markerId: MarkerId('Batununggal'),
            position: LatLng(-6.919484, 107.636330),
            onTap: () {
              setState(() {
                _isVisble = !_isVisble;
              });
            },
            infoWindow:
                InfoWindow(title: 'Buah Batu'),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueOrange,
            ),
          )
        },
      ),
    );
  }

  Widget _buildContainer(BuildContext context) {
    return Visibility(
      visible: _isVisble,
      child: Positioned(
        top: 20,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 12.0),
                margin: EdgeInsets.only(left: 16.0, right: 16.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Layer Info'),
                    SizedBox(
                      height: 12.0,
                    ),
                   Row(
                     children: [
                       Icon(
                         Icons.location_city,
                         color: Colors.orange,
                       ),SizedBox(
                         width: 8.0,
                       ),
                       Text(
                         'Nama Provinsi : Jawa'
                       )
                     ],
                   ),SizedBox(
                      height: 12.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.airplay,
                          color: Colors.orange,
                        ),SizedBox(
                          width: 8.0,
                        ),
                        Text(
                            'Kadar merkuri dalam udara : 30'
                        )
                      ],
                    ),SizedBox(
                      height: 12.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.trending_up,
                          color: Colors.orange,
                        ),SizedBox(
                          width: 8.0,
                        ),
                        Text(
                            'Kadar merkuri dalam Tanah : 30'
                        )
                      ],
                    ),SizedBox(
                      height: 12.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.opacity,
                          color: Colors.orange,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                            'Kadar merkuri dalam Air : 30'
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

ListTile _createListModel(BuildContext context, String name, IconData icon){
  return ListTile(
    leading: Icon(icon),
    title: Text( name
    ),onTap: (){
      Navigator.of(context);
  },
  );
}