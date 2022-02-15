import 'package:flutter/material.dart';
import 'package:tugasakhir/maps.dart';
// import 'package:sipers_padang/User/MapsTernak.dart';
import '../helper/constant.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tugasakhir/helper/session_manager.dart';

class ternakinfo extends StatefulWidget {
  List list;
  int index;
  ternakinfo({this.list, this.index});

  @override
  _ternakinfoState createState() => _ternakinfoState();
}

class _ternakinfoState extends State<ternakinfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          ('${widget.list[widget.index]['nama_peternakan']}'),
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
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Image.network(image_url + widget.list[widget.index]['gambar']),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Nama Peternakan",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'SF Pro Text',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Text(
                      widget.list[widget.index]['nama_peternakan'],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontFamily: 'SF Pro Text',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Divider(thickness: 2),
                    // SizedBox(
                    //   height: 8,
                    // ),

                    Text(
                      "Jenis Kelamin",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'SF Pro Text',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Text(
                      widget.list[widget.index]['jekel'],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontFamily: 'SF Pro Text',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Divider(thickness: 2),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    Text(
                      "Umur",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'SF Pro Text',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Text(
                      widget.list[widget.index]['umur'],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontFamily: 'SF Pro Text',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Divider(thickness: 2),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    Text(
                      "Pendidikan",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'SF Pro Text',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Text(
                      widget.list[widget.index]['pendidikan'],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontFamily: 'SF Pro Text',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Divider(thickness: 2),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    Text(
                      "Tanggungan Keluarga",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'SF Pro Text',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Text(
                      widget.list[widget.index]['tanggungan_keluarga'],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontFamily: 'SF Pro Text',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Divider(thickness: 2),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    Text(
                      "Status Ternak",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'SF Pro Text',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Text(
                      widget.list[widget.index]['status_ternak'],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontFamily: 'SF Pro Text',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Divider(thickness: 2),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    Text(
                      "Pengalaman Beternak",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'SF Pro Text',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Text(
                      widget.list[widget.index]['pengalaman_beternak'],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontFamily: 'SF Pro Text',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Divider(thickness: 2),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    Text(
                      "Status Lahan",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'SF Pro Text',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Text(
                      widget.list[widget.index]['status_lahan'],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontFamily: 'SF Pro Text',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Divider(thickness: 2),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    Text(
                      "Alamat",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'SF Pro Text',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Text(
                      widget.list[widget.index]['alamat'],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontFamily: 'SF Pro Text',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Divider(thickness: 2),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    Text(
                      "Modal Tetap",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'SF Pro Text',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Text(
                      widget.list[widget.index]['modal_tetap'],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontFamily: 'SF Pro Text',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Divider(thickness: 2),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    Text(
                      "Tenaga Kerja",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'SF Pro Text',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Text(
                      widget.list[widget.index]['tenaga_kerja'],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontFamily: 'SF Pro Text',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Divider(thickness: 2),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    Text(
                      "Bibit Sapi",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'SF Pro Text',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Text(
                      widget.list[widget.index]['bibit_sapi'],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontFamily: 'SF Pro Text',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Divider(thickness: 2),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    Text(
                      "Penghasilan",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'SF Pro Text',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Text(
                      widget.list[widget.index]['penghasilan'],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontFamily: 'SF Pro Text',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Divider(thickness: 2),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    Text(
                      "Mutasi Ternak",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'SF Pro Text',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Text(
                      widget.list[widget.index]['mutasi_ternak'],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontFamily: 'SF Pro Text',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Divider(thickness: 2),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    Text(
                      "Permasalahan",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'SF Pro Text',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Text(
                      widget.list[widget.index]['permasalahan'],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontFamily: 'SF Pro Text',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Divider(thickness: 2),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    Text(
                      "Google Maps",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'SF Pro Text',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Tekan gambar dibawah ini :'),
                    Container(
                      color: Colors.white,
                      height: 200,
                      // width: 375,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: ImageIcon(
                              AssetImage(
                                "assets/images/gmaps.png",
                              ),
                              size: 100,
                              color: Colors.blue,
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => maps()));
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
