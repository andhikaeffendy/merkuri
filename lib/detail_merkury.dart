import 'package:flutter/material.dart';
import 'package:merkuri/page_settings.dart';

class DetailMerkury extends StatefulWidget {
  @override
  _DetailMerkuryState createState() => _DetailMerkuryState();
}

class _DetailMerkuryState extends State<DetailMerkury> {
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
              margin: EdgeInsets.only(top: 40.0, left: 16.0, right: 16.0, bottom: 16.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(3.0, 3.0),
                      blurRadius: 5.0,
                      spreadRadius: 2.0,
                      color: Colors.black38
                  ),
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16.0,
                  ),Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Detail Merkurisk',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),SizedBox(
                    height: 16.0,
                  ),Text(
                    'Provinsi',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),SizedBox(
                    height: 8.0,
                  ),Text(
                    'Provinsi saya',
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),SizedBox(
                    height: 16.0,
                  ),Text(
                    'Kota/kab',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),SizedBox(
                    height: 8.0,
                  ),Text(
                    'Kota Saya',
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),SizedBox(
                    height: 16.0,
                  ),Text(
                    'Kecamatan',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),SizedBox(
                    height: 8.0,
                  ),Text(
                    'Kecamatan saya',
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),SizedBox(
                    height: 16.0,
                  ),Text(
                    'Soil',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),SizedBox(
                    height: 8.0,
                  ),Text(
                    'Sooil saya',
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),SizedBox(
                    height: 16.0,
                  ),Text(
                    'Waiter',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),SizedBox(
                    height: 8.0,
                  ),Text(
                    'Waiter saya',
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),SizedBox(
                    height: 16.0,
                  ),Text(
                    'Air',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),SizedBox(
                    height: 8.0,
                  ),Text(
                    'Air saya',
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),SizedBox(
                    height: 16.0,
                  ),Text(
                    'Human',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),SizedBox(
                    height: 8.0,
                  ),Text(
                    'Human saya',
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),SizedBox(
                    height: 16.0,
                  ),Text(
                    'Biodata',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),SizedBox(
                    height: 8.0,
                  ),Text(
                    'Biodata saya',
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),SizedBox(
                    height: 16.0,
                  ),Text(
                    'Sediment',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),SizedBox(
                    height: 8.0,
                  ),Text(
                    'Sediment saya',
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),SizedBox(
                    height: 16.0,
                  ),SizedBox(
                    width: double.infinity,
                    child: FlatButton(
                      onPressed: () {
//                        Navigator.push(
//                          context,
//                          MaterialPageRoute(builder: (context) => MapView()),
//                        );
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.orange,
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Edit',
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
