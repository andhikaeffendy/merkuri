import 'package:flutter/material.dart';
import 'package:merkuri/detail_merkury.dart';
import 'package:merkuri/page_settings.dart';

class DataMerkurisk extends StatefulWidget {
  @override
  _DataMerkuriskState createState() => _DataMerkuriskState();
}

class _DataMerkuriskState extends State<DataMerkurisk> {

  List<String> litems = ["1","2","Third","4"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.orange,
          ),
          Container(
            child: ListView.builder(
              itemCount: litems.length,
              itemBuilder: (BuildContext context, int index){
              return GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailMerkury()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Data Mercurisk 1',
                        style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                      ),SizedBox(
                        height: 8.0,
                      ),Text(
                        'polusi data',
                        style: TextStyle(fontSize: 14.0),
                      )
                    ],
                  ),
                ),
              );
          }),
          )
        ],
      ),
    );
  }
}
