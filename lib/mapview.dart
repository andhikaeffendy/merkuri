import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:merkuri/apis/api_district_mercurisks.dart';
import 'package:merkuri/apis/api_state_mercurisks.dart';
import 'package:merkuri/apis/api_sub_district_mercurisks.dart';
import 'package:merkuri/form_merkurisk.dart';
import 'package:merkuri/globals/variable.dart';
import 'package:merkuri/models/district_mercurisk.dart';
import 'package:merkuri/models/sub_district_mercurisk.dart';
import 'package:merkuri/models/state_mercurisk.dart';

class MapView extends StatefulWidget {
  @override
  State<MapView> createState() => MapViewState();
}

class MapViewState extends State<MapView> {
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController googleMapController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  double zoomVal = 5.0;
  bool _isVisble = false;

  List<dynamic> litems = new List();
  String filter_name = 'Filter By Provinsi';
  List<StateMerkurisk> states = new List();
  Set<Marker> markers = new Set();
  dynamic dataMarker;

  @override
  Widget build(BuildContext context) {
    if(states.isEmpty){
      futureApiStateMercurisks(current_user.token).then((value){
        if(value.isSuccess()){
          setState(() {
            states = value.data;
            litems = states;
            markers = generateMarkers(litems);
          });
        }
      });
    }
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
                onPressed: ()=> nextPage(context, FormMerkurisk()),
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
                if(litems.length == 0){
                  googleMapController.animateCamera(CameraUpdate.newCameraPosition(
                    CameraPosition(
                        target: LatLng(-1.3309122, 116.9796671), zoom: 3),
                  ),);
                  setState(() {
                    litems = states;
                    markers = generateMarkers(litems);
                  });
                } else
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
                              filter_name,
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
                                    return ListTile(
                                      leading: Icon(Icons.opacity),
                                      title: Text(getName(litems[index])),
                                      onTap: (){
                                        Navigator.of(context, rootNavigator: true).pop();
                                        if(filter_name == 'Filter By Provinsi'){
                                          futureApiDistrictMercurisks(current_user.token, getId(litems[index])).then((value){
                                            if(value.isSuccess()) {
                                              googleMapController.animateCamera(CameraUpdate.newCameraPosition(
                                                CameraPosition(
                                                    target: LatLng(getLatitude(litems[index]), getLongitude(litems[index])), zoom: 8.0),
                                              ),);
                                              setState(() {
                                                _isVisble = false;
                                                litems = value.data;
                                                filter_name = 'Filter By Kota/Kabupaten';
                                                markers = generateMarkers(litems);
                                              });
                                            }
                                          });
                                        } else if (filter_name == 'Filter By Kota/Kabupaten'){
                                          futureApiSubDistrictMercurisks(current_user.token, getId(litems[index])).then((value){
                                            if(value.isSuccess()) {
                                              googleMapController.animateCamera(CameraUpdate.newCameraPosition(
                                                CameraPosition(
                                                    target: LatLng(getLatitude(litems[index]), getLongitude(litems[index])), zoom: 9.0),
                                              ),);
                                              setState(() {
                                                _isVisble = false;
                                                litems = new List();
                                                markers = generateMarkers(value.data);
                                              });
                                            }
                                          });
                                        }
                                      },
                                    );
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
          target: LatLng(-1.3309122, 116.9796671),
          zoom: 3,
        ),
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
          _controller.complete(googleMapController);
        },
        markers: markers,
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
                    SizedBox(
                      height: 8.0,
                    ),
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
                         'Nama : ' + getName(dataMarker)
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
                            'Merkuri di udara : ' + getAir(dataMarker).toString()
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
                            'Merkuri di tanah : ' + getSoil(dataMarker).toString()
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
                            'Merkuri di air : ' + getWaiter(dataMarker).toString()
                        )
                      ],
                    ),SizedBox(
                      height: 12.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.data_usage,
                          color: Colors.orange,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                            'Merkuri di Sedimen : ' + getWaiter(dataMarker).toString()
                        )
                      ],
                    ),SizedBox(
                      height: 12.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.perm_data_setting,
                          color: Colors.orange,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                            'Merkuri di Biodata : ' + getWaiter(dataMarker).toString()
                        )
                      ],
                    ),SizedBox(
                      height: 12.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.orange,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                            'Merkuri di Manusia : ' + getWaiter(dataMarker).toString()
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

  String getName(data){
    if(data is StateMerkurisk){
      return data.state_name;
    } else if (data is DistrictMerkurisk){
      return data.district_name;
    } else if (data is SubDistrictMerkurisk){
      return data.sub_district_name;
    } else return data.toString();
  }

  int getId(data){
    if(data is StateMerkurisk){
      return data.state_id;
    } else if (data is DistrictMerkurisk){
      return data.district_id;
    } else if (data is SubDistrictMerkurisk){
      return data.sub_district_id;
    } else return 0;
  }

  double getLatitude(data){
    if(data is StateMerkurisk){
      return data.latitude;
    } else if (data is DistrictMerkurisk){
      return data.latitude;
    } else if (data is SubDistrictMerkurisk){
      return data.latitude;
    } else return 0;
  }

  double getLongitude(data){
    if(data is StateMerkurisk){
      return data.longitude;
    } else if (data is DistrictMerkurisk){
      return data.longitude;
    } else if (data is SubDistrictMerkurisk){
      return data.longitude;
    } else return 0;
  }

  double getWaiter(data){
    if(data is StateMerkurisk){
      return data.waiter;
    } else if (data is DistrictMerkurisk){
      return data.waiter;
    } else if (data is SubDistrictMerkurisk){
      return data.waiter;
    } else return 0;
  }

  double getSoil(data){
    if(data is StateMerkurisk){
      return data.soil;
    } else if (data is DistrictMerkurisk){
      return data.soil;
    } else if (data is SubDistrictMerkurisk){
      return data.soil;
    } else return 0;
  }

  double getAir(data){
    if(data is StateMerkurisk){
      return data.air;
    } else if (data is DistrictMerkurisk){
      return data.air;
    } else if (data is SubDistrictMerkurisk){
      return data.air;
    } else return 0;
  }

  Set<Marker> generateMarkers(List<dynamic> items){
    Set<Marker> result = new Set();
    items.forEach((element) {
      if(getLatitude(element) != 0.0 && getLongitude(element) != 0.0)
        result.add(generateMarker(element, getName(element), getLatitude(element), getLongitude(element)));
    });
    return result;
  }

  Marker generateMarker(dynamic data, String name, double latitude, double longitude){
    return
        Marker(
          markerId: MarkerId(name),
          position: LatLng(latitude, longitude),
          onTap: () {
            setState(() {
              _isVisble = !_isVisble;
              dataMarker = data;
            });
          },
          infoWindow:
          InfoWindow(title: name),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueOrange,
          ),
        )
    ;
  }
}