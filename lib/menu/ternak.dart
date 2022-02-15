import 'dart:async';
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tugasakhir/menu/ternakinfo.dart';
import '../helper/constant.dart';

final List<String> imgList = [
  'a.jpg',
  'b.jpg',
  'c.jpg',
  'd.jpg',
];

class ternak extends StatefulWidget {
  @override
  _ternakState createState() => _ternakState();
}

class _ternakState extends State<ternak> {
  Future<List> getData() async {
    final responseData =
        await http.get(Uri.parse((BASE_URL + "Peternakan_get")));
    print(responseData.body);
    return json.decode(responseData.body)['peternakan'];
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
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                'Peternakan Sapi',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
                // aspectRatio: 2.0,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                scrollDirection: Axis.horizontal,
                // initialPage: 2,
                autoPlay: true,
                height: 160.0),
            items: imgList.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: 450,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage('assets/images/${i}'),
                            fit: BoxFit.cover),
                        // color: Colors.blue
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Lihat sampai habis',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Daftar Ternak',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 400,
            child: ListView.builder(
              itemCount: list == null ? 0 : list.length,
              itemBuilder: (context, i) {
                return Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ternakinfo(
                                      list: list,
                                      index: i,
                                    )));
                          },
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Card(
                                elevation: 5,
                                child: ListTile(
                                    leading: Container(
                                      height: 100,
                                      width: 100,
                                      child: Image.network(
                                        image_url + list[i]['gambar'],
                                        // width: 315,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    title: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 12, 0, 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            list[i]['nama_peternakan'],
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.all(3)),
                                          Text(
                                            list[i]['alamat'],
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
