import 'dart:convert';
import 'dart:core';

import 'package:apiapplication/services/user_api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:convert/convert.dart';
import 'model/post.dart';
import 'model/user.dart';
import 'model/user_name.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<user> h = [];

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  // Future<post>? postData;
  //
  // Future<post> getPostbyId() async {
  //   http.Response postfuture = await http
  //       .get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));
  //   if (postfuture.statusCode == 200) {
  //     print("======================================================");
  //     print(postfuture.body);
  //     print("========================================================");
  //     return post.fromJson(json.decode(postfuture.body));
  //   } else {
  //     throw Exception('can not load post data');
  //   }
  // }

  // @override
  // void initState() {
  //   // postData = getPostbyId();
  //
  //   super.initState();
  // }
  bool show = false;
  bool indicator = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("API"),
        ),
        body:  Container(
          height: MediaQuery.of(context).size.height,
          width: double.maxFinite,
          transformAlignment: Alignment.center,
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black, width: 2)),
          child: h.length != 0
              ? RefreshIndicator(
                  onRefresh: () async {
                    await fetchData();
                  },
                  child: ListView.builder(
                      itemCount: h.length,
                      itemBuilder: (context, index) {
                        final user = h[index];
                        return Container(
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(color: Colors.black, width: 2)),
                            child: ListTile(
                              title: Text(h[index].name.title +
                                  " " +
                                  h[index].name.first +
                                  " " +
                                  h[index].name.last),
                              subtitle:
                                  Text(h[index].email + "   " + h[index].nat),
                              leading: Container(
                                width: 84,
                                child: Row(
                                  children: [
                                    Text(
                                      (index + 1).toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: 49,
                                        height: MediaQuery.of(context).size.longestSide,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.blueAccent,
                                                width: 3),
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Image.network(
                                              (h[index].picture.thumbnail)),
                                        )),
                                  ],
                                ),
                              ),
                            ));
                      }),
                )
              : Text("Not show Data"),
        )
            // Center(
            //     //     child: FutureBuilder<post>(
            //     //   future: postData,
            //     //   builder: (context, snapshot) {
            //     //     if (snapshot.hasData) {
            //     //       return Text(snapshot.data!.body.toString());
            //     //     } else if (snapshot.hasError) {
            //     //       return Text("error: " + snapshot.error.toString());
            //     //     } else {
            //     //       return CircularProgressIndicator(
            //     //         color: Colors.green,
            //     //         strokeWidth: 2,
            //     //       );
            //     //     }
            //     //   },
            //     // )
            //     ),
            ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed:
        //       // Fluttertoast.showToast(msg: 'show data',fontSize: 20,backgroundColor: Colors.green,
        //       // );
        //       fetchData,
        //   child: Icon(Icons.slideshow_rounded),
        // ),

    );
  }

  Future<void> fetchData() async {
    final response = await userApi().fetchData();
    setState(() {
      h = response;
    });
    print(h[1].email.toString() + "   kkkk");
  }
}
