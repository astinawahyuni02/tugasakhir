import 'package:flutter/material.dart';
import '../helper/constant.dart';
import '../maps.dart';

class tokoinfo extends StatefulWidget {
  List list;
  int index;
  tokoinfo({this.list, this.index});

  @override
  _tokoinfoState createState() => _tokoinfoState();
}

class _tokoinfoState extends State<tokoinfo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ('${widget.list[widget.index]['nama_toko']}'),
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'SF Pro Text',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Image.network(
                image_url + widget.list[widget.index]['gambar'],
                fit: BoxFit.cover,
                // height: 300,
                // width: 400,
              ),
              Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Nama Toko",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'SF Pro Text',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      SelectableText(
                        widget.list[widget.index]['nama_toko'],
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                          fontFamily: 'SF Pro Text',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Divider(thickness: 2),
                      Text(
                        "Alamat",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'SF Pro Text',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      SelectableText(
                        widget.list[widget.index]['alamat'],
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                          fontFamily: 'SF Pro Text',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Divider(thickness: 2),

                      Text(
                        "Keterangan",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'SF Pro Text',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      SelectableText(
                        widget.list[widget.index]['keterangan'],
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                          fontFamily: 'SF Pro Text',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      // Divider(thickness: 2),
                      // Text(
                      //   "Google Maps",
                      //   style: TextStyle(
                      //     fontSize: 14,
                      //     fontFamily: 'SF Pro Text',
                      //     fontStyle: FontStyle.normal,
                      //     fontWeight: FontWeight.w500,
                      //     decoration: TextDecoration.none,
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Text('Tekan gambar dibawah ini :'),
                      // Container(
                      //   color: Colors.white,
                      //   height: 200,
                      //   // width: 375,
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       GestureDetector(
                      //         child: ImageIcon(
                      //           AssetImage(
                      //             "assets/images/gmaps.png",
                      //           ),
                      //           size: 100,
                      //           color: Colors.blue,
                      //         ),
                      //         onTap: () {
                      //           Navigator.push(
                      //               context,
                      //               MaterialPageRoute(
                      //                   builder: (context) => maps()));
                      //         },
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
