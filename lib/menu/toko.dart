import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tugasakhir/menu/tokoinfo.dart';
import '../helper/constant.dart';

class toko extends StatefulWidget {
  @override
  _tokoState createState() => _tokoState();
}

class _tokoState extends State<toko> {
  Future<List> getData() async {
    final responseData = await http.get(Uri.parse((BASE_URL + "getToko")));
    print(responseData.body);
    return json.decode(responseData.body)['tb_toko'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? Itemlist(list: snapshot.data)
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class Itemlist extends StatelessWidget {
  final List list;
  Itemlist({this.list});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 10,
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Text(
              'Toko Peralatan Ternak',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Container(
          height: 620,
          child: ListView.builder(
            // shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: list == null ? 0 : list.length,
            itemBuilder: (context, i) {
              return Container(
                child: SingleChildScrollView(
                    child: Column(children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => tokoinfo(
                                  list: list,
                                  index: i,
                                )));
                      },
                      child: Card(
                        elevation: 5,
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              child: Column(children: [
                                Image.network(
                                  image_url + list[i]['gambar'],
                                  height: 200,
                                  width: 400,
                                  fit: BoxFit.cover,
                                ),
                              ]),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  list[i]['nama_toko'],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Source Sans Pro',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  list[i]['alamat'],
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ]),
                      )),
                ])),
              );
            },
          ),
        ),
      ],
    ));
  }
}
