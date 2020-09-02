import 'package:flutter/material.dart';
import 'package:merkuri/apis/api_mercurisks.dart';
import 'package:merkuri/detail_merkury.dart';
import 'package:merkuri/globals/variable.dart';
import 'package:merkuri/models/merkurisk.dart';
import 'package:merkuri/page_settings.dart';

class DataMerkurisk extends StatefulWidget {
  @override
  _DataMerkuriskState createState() => _DataMerkuriskState();
}

class _DataMerkuriskState extends State<DataMerkurisk> {

  List<Merkurisk> litems = new List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.orange,
          ),
          Container(
            child: FutureBuilder(
              future: futureApiMercurisks(current_user.token),
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(
                    child: new CircularProgressIndicator(),
                  );
                } else if(snapshot.connectionState == ConnectionState.done){
                  print(snapshot.data);
                  ApiMercurisk apiMercurisk = snapshot.data;
                  if(apiMercurisk.isSuccess()){
                    litems = apiMercurisk.data;
                    return listDataView();
                  }
                  alertDialog(context, "List Mercurisk", apiMercurisk.message);
                  return Container();
                } else {
                return Container();
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget listDataView(){
    return ListView.builder(
        itemCount: litems.length,
        itemBuilder: (BuildContext context, int index){
          return GestureDetector(
            onTap: () => nextPage(context, DetailMerkury(id:litems[index].id)),
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
                    'Data Mercurisk '+ litems[index].sub_district_name,
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
        });
  }
}
