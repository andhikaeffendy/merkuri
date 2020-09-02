import 'package:flutter/material.dart';
import 'package:merkuri/apis/api_create_mercurisk.dart';
import 'package:merkuri/apis/api_districts.dart';
import 'package:merkuri/apis/api_states.dart';
import 'package:merkuri/apis/api_sub_districts.dart';
import 'package:merkuri/detail_merkury.dart';
import 'package:merkuri/globals/variable.dart';
import 'package:merkuri/mapview.dart';
import 'package:merkuri/models/district.dart';
import 'package:merkuri/models/province.dart';
import 'package:merkuri/models/sub_district.dart';

class FormMerkurisk extends StatefulWidget {
  @override
  _FormMerkuriskState createState() => _FormMerkuriskState();
}

class _FormMerkuriskState extends State<FormMerkurisk> {

  List<District> listDistricts = new List();
  List<SubDistrict> listSubDistricts = new List();

  Province selectedProvince;
  District selectedDistrict;
  SubDistrict selectedSubDistrict;

  final soilController = TextEditingController();
  final airController = TextEditingController();
  final waiterController = TextEditingController();
  final humanController = TextEditingController();
  final biotaController = TextEditingController();
  final sedimentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if(provinces == null){
      futureApiState(current_user.token).then((value){
        setState(() {
          provinces = value.data;
        });
      });
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.orange,
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(
                  top: 40.0, left: 16.0, bottom: 16.0, right: 16.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(3.0, 3.0),
                      blurRadius: 5.0,
                      spreadRadius: 2.0,
                      color: Colors.black38),
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    'Buat Data Merkurisk',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  DropdownButton<Province>(
                    isExpanded: true,
                    hint: new Text("Pilih Provinsi"),
                    value: selectedProvince,
                    onChanged: (value) {
                      showCircular(context);
                      futureApiDistrict(current_user.token, value.id).then((apiValue){
                        Navigator.of(context, rootNavigator: true).pop();
                        if(apiValue.isSuccess()){
                          setState(() {
                            listDistricts = apiValue.data;
                            selectedProvince = value;
                          });
                        }
                      });
                    },
                    items: provinces.map((province) {
                      return new DropdownMenuItem<Province>(
                        value: province,
                        child: new Text(
                          province.name,
                          style: new TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                  ),SizedBox(
                    height: 16.0,
                  ),DropdownButton<District>(
                    isExpanded: true,
                    hint: new Text("Pilih Kota/Kab"),
                    value: selectedDistrict,
                    onChanged: (value) {
                      showCircular(context);
                      futureApiSubDistrict(current_user.token, value.id).then((apiValue){
                        Navigator.of(context, rootNavigator: true).pop();
                        if(apiValue.isSuccess()){
                          setState(() {
                            listSubDistricts = apiValue.data;
                            selectedDistrict = value;
                          });
                        }
                      });
                    },
                    items: listDistricts.map((district) {
                      return new DropdownMenuItem<District>(
                        value: district,
                        child: new Text(
                          district.name,
                          style: new TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                  ),SizedBox(
                    height: 16.0,
                  ),DropdownButton<SubDistrict>(
                    isExpanded: true,
                    hint: new Text("Pilih Kecamatan"),
                    value: selectedSubDistrict,
                    onChanged: (value) {
                      setState(() {
                        selectedSubDistrict = value;
                      });
                    },
                    items: listSubDistricts.map((subdistrict) {
                      return new DropdownMenuItem<SubDistrict>(
                        value: subdistrict,
                        child: new Text(
                          subdistrict.name,
                          style: new TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                  ),TextFormField(
                    controller: soilController,
                    decoration: new InputDecoration(
                      labelText: "Soil",
                      fillColor: Colors.white,

                      //fillColor: Colors.green
                    ),
                    keyboardType: TextInputType.emailAddress,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),SizedBox(
                    height: 16.0,
                  ),TextFormField(
                    controller: waiterController,
                    decoration: new InputDecoration(
                      labelText: "Walter",
                      fillColor: Colors.white,

                      //fillColor: Colors.green
                    ),
                    keyboardType: TextInputType.emailAddress,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),SizedBox(
                    height: 16.0,
                  ),TextFormField(
                    controller: airController,
                    decoration: new InputDecoration(
                      labelText: "Air",
                      fillColor: Colors.white,

                      //fillColor: Colors.green
                    ),
                    keyboardType: TextInputType.emailAddress,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),SizedBox(
                    height: 16.0,
                  ),TextFormField(
                    controller: humanController,
                    decoration: new InputDecoration(
                      labelText: "Human",
                      fillColor: Colors.white,

                      //fillColor: Colors.green
                    ),
                    keyboardType: TextInputType.emailAddress,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),SizedBox(
                    height: 16.0,
                  ),TextFormField(
                    controller: biotaController,
                    decoration: new InputDecoration(
                      labelText: "Biodata",
                      fillColor: Colors.white,

                      //fillColor: Colors.green
                    ),
                    keyboardType: TextInputType.emailAddress,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),SizedBox(
                    height: 16.0,
                  ),TextFormField(
                    controller: sedimentController,
                    decoration: new InputDecoration(
                      labelText: "Sedimen",
                      fillColor: Colors.white,

                      //fillColor: Colors.green
                    ),
                    keyboardType: TextInputType.emailAddress,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),SizedBox(
                    height: 24.0,
                  ),SizedBox(
                    width: double.infinity,
                    child: FlatButton(
                      onPressed: () {
                        showCircular(context);
                        futureApiCreateMercurisk(current_user.token, selectedProvince.id,
                            selectedDistrict.id, selectedSubDistrict.id, int.parse(airController.text),
                            int.parse(waiterController.text), int.parse(soilController.text),
                            int.parse(humanController.text), int.parse(biotaController.text),
                            int.parse(sedimentController.text)).then((value){
                              Navigator.of(context, rootNavigator: true).pop();
                              if(value.isSuccess()){
                                Navigator.of(context, rootNavigator: true).pop();
                              } else {
                                alertDialog(context, "Input Mercurisk Gagal", value.message);
                              }
                        });
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.orange,
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Input',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class listDropDown {
  const listDropDown(this.name);

  final String name;
}
