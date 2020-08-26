import 'package:flutter/material.dart';
import 'package:merkuri/detail_merkury.dart';
import 'package:merkuri/mapview.dart';

class FormMerkurisk extends StatefulWidget {
  @override
  _FormMerkuriskState createState() => _FormMerkuriskState();
}

class _FormMerkuriskState extends State<FormMerkurisk> {

  listDropDown selectedProvinsi;
  listDropDown selectedKota;
  listDropDown selectedKecamatan;
  List<listDropDown> provinsi = <listDropDown>[
    const listDropDown('Jawa Barat'),
    const listDropDown('Jawa Timur'),
    const listDropDown('Jawa Tengah')
  ];
  List<listDropDown> kota = <listDropDown>[
    const listDropDown('Jawa Barat'),
    const listDropDown('Jawa Timur'),
    const listDropDown('Jawa Tengah')
  ];
  List<listDropDown> kecamatan = <listDropDown>[
    const listDropDown('Jawa Barat'),
    const listDropDown('Jawa Timur'),
    const listDropDown('Jawa Tengah')
  ];

  @override
  Widget build(BuildContext context) {
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
                  DropdownButton<listDropDown>(
                    isExpanded: true,
                    hint: new Text("Pilih Provinsi"),
                    value: selectedProvinsi,
                    onChanged: (listDropDown newValue) {
                      setState(() {
                        selectedProvinsi = newValue;
                      });
                    },
                    items: provinsi.map((listDropDown user) {
                      return new DropdownMenuItem<listDropDown>(
                        value: user,
                        child: new Text(
                          user.name,
                          style: new TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                  ),SizedBox(
                    height: 16.0,
                  ),DropdownButton<listDropDown>(
                    isExpanded: true,
                    hint: new Text("Pilih Kota/Kab"),
                    value: selectedKota,
                    onChanged: (listDropDown newValue) {
                      setState(() {
                        selectedKota = newValue;
                      });
                    },
                    items: kota.map((listDropDown user) {
                      return new DropdownMenuItem<listDropDown>(
                        value: user,
                        child: new Text(
                          user.name,
                          style: new TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                  ),SizedBox(
                    height: 16.0,
                  ),DropdownButton<listDropDown>(
                    isExpanded: true,
                    hint: new Text("Pilih Kecamatan"),
                    value: selectedKecamatan,
                    onChanged: (listDropDown newValue) {
                      setState(() {
                        selectedKecamatan = newValue;
                      });
                    },
                    items: kecamatan.map((listDropDown user) {
                      return new DropdownMenuItem<listDropDown>(
                        value: user,
                        child: new Text(
                          user.name,
                          style: new TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                  ),TextFormField(
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DetailMerkury()),
                        );
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
