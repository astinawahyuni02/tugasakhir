import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugasakhir/helper/session_manager.dart';
import 'package:http/http.dart' as http;
import '../model/KamusUser.dart';
import '../helper/constant.dart';

class profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  // Future<List> getUser() async {
  //   SessionManager sm = SessionManager();
  //   String idUser = await sm.getIdUser();
  //   final responseData =
  //       await http.post(Uri.parse((BASE_URL + 'getUser')), body: {
  //     'id_user': idUser,
  //   });
  //   log(responseData.body);
  //   return json.decode(responseData.body)['tabeluser'];
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getUser();
  // }Int

  String id_user, email, fullname, is_active;

  List<Tabeluser> tabeluser=[];
  Future<ModelUser> getDataUser() async {
    var resJson = await http.post(Uri.parse(BASE_URL + "getUser"), body: {
      'id_user': id_user,
      'fullname': fullname,
      'email': email,
      'is_active': is_active,
    });

    List<Tabeluser> user = modelUserFromJson(resJson.body).tabeluser;
    setState(() {
      tabeluser = user;
      log('data user $tabeluser');
    });
  }

  @override
  void initState() {
    sessionManager.getPreferences().then((value) {
      setState(() {
        id_user = sessionManager.id_user;
        // fullname = sessionManager.fullname;
        email = sessionManager.email;
        // is_active = sessionManager.is_active;
      });
    });
    getDataUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                'Profile',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            width: 130,
            height: 140,
            child: Card(
              color: Colors.grey[300],
              child: Row(
                children: [
                  Flexible(
                      child: Image.asset(
                    "assets/images/profile.jpg",
                    fit: BoxFit.cover,
                  ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          // Container(
          //   height: 25,
          //   child: Center(
          //     child: Text(
          //       'Tentang mu :',
          //       style: TextStyle(
          //         fontSize: 18,
          //         fontWeight: FontWeight.bold,
          //         color: Colors.black,
          //       ),
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 30,
          // ),
          Container(
            height: 55,
            width: 350,
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey[300], width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Nomor id    :   ${id_user}',
                      style: TextStyle(
                          fontSize: 16,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 55,
            width: 350,
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey[300], width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Fullname    :   ${fullname}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 55,
            width: 350,
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey[300], width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Email          :   ${email}',
                      style: TextStyle(
                          fontSize: 16,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 150,
          ),
          Container(
            color: Colors.white,
            height: 65,
            width: 375,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: ImageIcon(
                    AssetImage(
                      "assets/images/logout.png",
                    ),
                    size: 25,
                    color: Colors.red,
                  ),
                  onTap: () {
                    sessionManager.clearSession(context);
                  },
                ),
                SizedBox(
                  width: 16.5,
                ),
                Text(
                  "Keluar",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
    // return Scaffold(
    //   body: FutureBuilder<List>(
    //     future: getUser(),
    //     builder: (context, snapshot) {
    //       if (snapshot.hasError) print(snapshot.error);
    //       return snapshot.hasData
    //           ? DetailProfile(history: snapshot.data)
    //           : Center(
    //               child: CircularProgressIndicator(),
    //             );
    //     },
    //   ),
    // );
  }
}

// class DetailProfile extends StatelessWidget {
//   final List history;
//   DetailProfile({this.history});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Column(children: [
//       AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         toolbarHeight: 10,
//       ),
//       Center(
//         child: Padding(
//           padding: EdgeInsets.only(bottom: 20),
//           child: Text(
//             'Profile',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.w600,
//               color: Colors.black,
//             ),
//           ),
//         ),
//       ),
//       SizedBox(
//         height: 10,
//       ),
//       Container(
//         alignment: Alignment.center,
//         width: 130,
//         height: 140,
//         child: Card(
//           color: Colors.grey[300],
//           child: Row(
//             children: [
//               Flexible(
//                   child: Image.asset(
//                 "assets/images/profile.jpg",
//                 fit: BoxFit.cover,
//               ))
//             ],
//           ),
//         ),
//       ),
//       SizedBox(
//         height: 50,
//       ),
//       // Container(
//       //   height: 25,
//       //   child: Center(
//       //     child: Text(
//       //       'Tentang mu :',
//       //       style: TextStyle(
//       //         fontSize: 18,
//       //         fontWeight: FontWeight.bold,
//       //         color: Colors.black,
//       //       ),
//       //     ),
//       //   ),
//       // ),
//       // SizedBox(
//       //   height: 30,
//       // ),
//       SingleChildScrollView(
//         child: Container(
//           height: 55,
//           width: 350,
//           child: ListView.builder(
//             itemCount: history.length,
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemBuilder: (context, index) {
//               return Card(
//                 shape: RoundedRectangleBorder(
//                   side: BorderSide(color: Colors.grey[300], width: 1),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 8, right: 5),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Nomor id    :   ${history[index]["id_user"]}',
//                         style: TextStyle(
//                           fontSize: 16,
//                         ),
//                         textAlign: TextAlign.start,
//                       ),
//                       Text(
//                         'Fullname    :   ${history[index]["fullname"]}',
//                         style: TextStyle(
//                           fontSize: 16,
//                         ),
//                         textAlign: TextAlign.start,
//                       ),
//                       Text(
//                         'Email          :   ${history[index]["email"]}',
//                         style: TextStyle(
//                           fontSize: 16,
//                         ),
//                         textAlign: TextAlign.start,
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//       SizedBox(
//         height: 150,
//       ),
//       Container(
//         color: Colors.white,
//         height: 65,
//         width: 375,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             GestureDetector(
//               child: ImageIcon(
//                 AssetImage(
//                   "assets/images/logout.png",
//                 ),
//                 size: 25,
//                 color: Colors.red,
//               ),
//               onTap: () {
//                 sessionManager.clearSession(context);
//               },
//             ),
//             SizedBox(
//               width: 16.5,
//             ),
//             Text(
//               "Keluar",
//               style: TextStyle(
//                 color: Colors.red,
//                 fontSize: 18,
//               ),
//             ),
//           ],
//         ),
//       )
//     ]));
//   }
// }
