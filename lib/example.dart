// // import 'dart:convert';
// // import 'dart:developer';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// //
// // import 'helper/constant.dart';
// // import 'helper/session_manager.dart';
// //
// // class DataPasien extends StatefulWidget {
// //   @override
// //   _DataPasienState createState() => _DataPasienState();
// // }
// //
// // class _DataPasienState extends State<DataPasien> {
// //   Future<List> getProfile() async {
// //     SessionManager sm = SessionManager();
// //     String idUser = await sm.getIdUser();
// //     final responseData =
// //         await http.post(Uri.parse((BASE_URL + 'getUser')), body: {
// //       'id_user': idUser,
// //     });
// //     log(responseData.body);
// //     return json.decode(responseData.body)['tabeluser'];
// //   }
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     getProfile();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: FutureBuilder<List>(
// //         future: getProfile(),
// //         builder: (context, snapshot) {
// //           if (snapshot.hasError) print(snapshot.error);
// //           return snapshot.hasData
// //               ? DetailProfile(history: snapshot.data)
// //               : Center(
// //                   child: CircularProgressIndicator(),
// //                 );
// //         },
// //       ),
// //     );
// //   }
// // }
// //
// // class DetailProfile extends StatelessWidget {
// //   final List history;
// //   DetailProfile({this.history});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: SingleChildScrollView(
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             ListView.builder(
// //               itemCount: history.length,
// //               shrinkWrap: true,
// //               physics: NeverScrollableScrollPhysics(),
// //               itemBuilder: (context, index) {
// //                 return Container(
// //                   // color: Colors.black12,
// //                   height: 600,
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Padding(
// //                         padding: const EdgeInsets.only(
// //                             left: 20, right: 20, top: 30, bottom: 30),
// //                         child: Column(
// //                           children: [
// //                             Row(
// //                               children: [
// //                                 Text(
// //                                   "${history[index]['email']}",
// //                                 ),
// //                               ],
// //                             ),
// //                             SizedBox(
// //                               height: 10,
// //                             ),
// //                             Row(
// //                               children: [
// //                                 Text(
// //                                   "${history[index]['fullname']}",
// //                                 ),
// //                               ],
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 );
// //               },
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:apss_mahasiswa_firebase/auth_service.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'login.dart';
//
// class RegisterPage extends StatefulWidget{
//   @override
//   _RegisterPageState createState()=> _RegisterPageState();
// }
//
// class _RegisterPageState extends State<RegisterPage>{
//   List<String> listjurusan= ['Teknik Elektronika', 'Tekni Sipil', 'Teknik Mesin',
//     'Teknologi Informasi', 'Akutansi', 'Administrasi Niaga', 'Bahasa Inggris'];
//   String njurusan ="Teknik Elektronika";
//   int nilaijurusan;
//
//   void pilihJurusan(String value){
//     setState(() {
//       njurusan = value;
//     });
//   }
//
//   TextEditingController email= TextEditingController();
//   TextEditingController password= TextEditingController();
//   TextEditingController cpassword= TextEditingController();
//   TextEditingController dname= TextEditingController();
//   TextEditingController nim= TextEditingController();
//   TextEditingController jurusan= TextEditingController();
//   TextEditingController prodi= TextEditingController();
//
//   var auth_service;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(8),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Image.asset(
//                   'images/pnp.png',
//                   height: 100.0,
//                   width: 100.0,
//                 ),
//                 SizedBox(height: 20,),
//                 TextFormField(
//                   controller: email,
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: InputDecoration(
//                       hintText: "Email",
//                       prefixIcon: Icon(Icons.email),
//                       fillColor: Colors.white,
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)
//                       )
//                   ),
//                 ),
//                 SizedBox(height: 10,),
//                 TextFormField(
//                   controller: password,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                       hintText: "Password",
//                       fillColor: Colors.white,
//                       prefixIcon: Icon(Icons.vpn_key),
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)
//                       )
//                   ),
//                 ),
//                 SizedBox(height: 10,),
//                 TextFormField(
//                   controller: cpassword,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                       hintText: "Confirm Password",
//                       fillColor: Colors.white,
//                       prefixIcon: Icon(Icons.vpn_key),
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)
//                       )
//                   ),
//                 ),
//                 SizedBox(height: 10,),
//                 TextFormField(
//                   controller: dname,
//                   keyboardType: TextInputType.text,
//                   decoration: InputDecoration(
//                       hintText: "Full Name",
//                       fillColor: Colors.white,
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)
//                       )
//                   ),
//                 ),
//                 SizedBox(height: 10,),
//                 TextFormField(
//                   controller: nim,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                       hintText: "NIM",
//                       fillColor: Colors.white,
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)
//                       )
//                   ),
//                 ),
//                 SizedBox(height: 10,),
//                 DropdownButton(
//                   onChanged: (String value){
//                     setState(() {
//                       pilihJurusan(value);
//                       nilaijurusan = listjurusan.indexOf(value);
//                     });
//                   },
//                   value: njurusan,
//                   items: listjurusan.map(
//                           (String value){
//                         return DropdownMenuItem(
//                           child: Text(value),
//                           value: value,
//                         );
//                       }).toList(),
//                 ),
//
//                 SizedBox(height: 10,),
//                 TextFormField(
//                   controller: prodi,
//                   keyboardType: TextInputType.text,
//                   decoration: InputDecoration(
//                       hintText: "Prodi",
//                       fillColor: Colors.white,
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)
//                       )
//                   ),
//                 ),
//                 SizedBox(height: 10,),
//                 Container(
//                   width: double.infinity,
//                   child: RaisedButton(
//                     onPressed: () async {
//                       SignInSignUpResult result = await AuthSercive().createUser(
//                           email: email.text,
//                           pass: password.text);
//                       if (result.user != null) {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => LoginPage()
//                             )
//                         );
//                       } else {
//                         showDialog(
//                             context: context,
//                             builder: (context) => AlertDialog(
//                               title: Text('Eror'),
//                               content: Text(result.message),
//                               actions: <Widget>[
//                                 TextButton(
//                                   onPressed: () {
//                                     Navigator.pop(context);
//                                   },
//                                   child: Text('Ok'),
//                                 )
//                               ],
//                             ));
//                       }
//                     },
//                     child: Text(
//                         'Register'
//                     ),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     color: Colors.blueGrey,
//                     elevation: 0,
//                     padding: EdgeInsets.symmetric(vertical: 16),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Container(
//                     alignment: Alignment.bottomCenter,
//                     margin: EdgeInsets.only(bottom: 20),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: <Widget>[
//                         Text(
//                           "Already Have Account",
//                           style: TextStyle(color: Colors.black),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                                 context, MaterialPageRoute(builder: (context) => LoginPage()));
//                           },
//                           child: Text(
//                             "Login Here",
//                             style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
//                           ),
//                         ),
//                       ],
//                     )
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }