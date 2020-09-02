import 'package:flutter/material.dart';
import 'package:merkuri/apis/api_detail_mercurisk.dart';
import 'package:merkuri/globals/variable.dart';
import 'package:merkuri/models/merkurisk.dart';

class DetailMerkury extends StatefulWidget {
  @override
  _DetailMerkuryState createState() => _DetailMerkuryState(id);

  final int id;

  const DetailMerkury({Key key, @required this.id})
      : super(key: key);
}

class _DetailMerkuryState extends State<DetailMerkury> {
  final int id;
  Merkurisk mercurisk;
  _DetailMerkuryState(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.orange,
          ),
          FutureBuilder(
            future: futureApiDetailMercurisk(current_user.token, id),
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(
                  child: new CircularProgressIndicator(),
                );
              } else if(snapshot.connectionState == ConnectionState.done){
                ApiMercurisk apiMercurisk = snapshot.data;
                if(apiMercurisk.isSuccess()){
                  mercurisk = apiMercurisk.merkurisk;
                  return detailView();
                }
                alertDialog(context, "List Mercurisk", apiMercurisk.message);
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget detailView(){
    return SingleChildScrollView(
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
              mercurisk.state_name,
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
              mercurisk.district_name,
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
              mercurisk.sub_district_name,
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
              mercurisk.soil.toString(),
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
              mercurisk.waiter.toString(),
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
              mercurisk.air.toString(),
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
              mercurisk.human.toString(),
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
              mercurisk.biota.toString(),
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
              mercurisk.sediment.toString(),
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),SizedBox(
              height: 16.0,
            ),SizedBox(
              width: double.infinity,
//              child: FlatButton(
//                onPressed: () {
////                        Navigator.push(
////                          context,
////                          MaterialPageRoute(builder: (context) => MapView()),
////                        );
//                },
//                shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.circular(10.0),
//                ),
//                color: Colors.orange,
//                child: Container(
//                  padding: EdgeInsets.all(8.0),
//                  child: Text(
//                    'Edit',
//                    style: TextStyle(
//                        fontSize: 18.0,
//                        fontWeight: FontWeight.bold,
//                        color: Colors.white),
//                  ),
//                ),
//              ),
            )
          ],
        ),
      ),
    );
  }
}
