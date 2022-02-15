import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../helper/constant.dart';

class info extends StatefulWidget {
  @override
  _infoState createState() => _infoState();
}

class _infoState extends State<info> {
  Future<List> getData() async {
    final responseData = await http.get(Uri.parse((BASE_URL + "getInfo")));
    print(responseData.body);
    return json.decode(responseData.body)['info'];
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
                'Informasi Sipers Padang',
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
                // scrollDirection: Axis.vertical,
                // shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: list == null ? 0 : list.length,
                itemBuilder: (context, i) {
                  return Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Container(
                              child: Card(
                                elevation: 5,
                                child: ListTile(
                                  title: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          list[i]['judul_info'],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 19,
                                            color: Colors.black87,
                                            fontFamily: 'Source Sans Pro',
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          list[i]['deskripsi'],
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black54,
                                            fontFamily: 'Source Sans Pro',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
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
