import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'helper/constant.dart';
import 'helper/session_manager.dart';

class DataPasien extends StatefulWidget {
  @override
  _DataPasienState createState() => _DataPasienState();
}

class _DataPasienState extends State<DataPasien> {
  Future<List> getProfile() async {
    SessionManager sm = SessionManager();
    String idUser = await sm.getIdUser();
    final responseData =
        await http.post(Uri.parse((BASE_URL + 'getUser')), body: {
      'id_user': idUser,
    });
    log(responseData.body);
    return json.decode(responseData.body)['tabeluser'];
  }

  @override
  void initState() {
    super.initState();
    getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List>(
        future: getProfile(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? DetailProfile(history: snapshot.data)
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class DetailProfile extends StatelessWidget {
  final List history;
  DetailProfile({this.history});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
              itemCount: history.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  // color: Colors.black12,
                  height: 600,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 30, bottom: 30),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${history[index]['email']}",
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "${history[index]['fullname']}",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
