import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../model/user.dart';
import '../model/user_name.dart';

class userApi {
  Future<List<user>> fetchData() async {
    List<user> users;
    final url = Uri.parse("https://randomuser.me/api/?results=100");
    Fluttertoast.showToast(
        msg: 'waiting',
        fontSize: 20,
        backgroundColor: Colors.green,
        toastLength: Toast.LENGTH_LONG);

    final response = await http.get(url);
    final json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final result = json['results'] as List<dynamic>;

      users = result.map((e) {
        return user(
            name: username(
                title: e['name']['title'],
                first: e['name']['first'],
                last: e['name']['last']),
            gender: e['gender'],
            email: e['email'],
            phone: e['phone'],
            cell: e['cell'],
            nat: e['nat'],
            picture: pictur(thumbnail: e['picture']['thumbnail']));
      }).toList();
      // show = true;
      // indicator = false;
    } else {
      throw Exception("error");
    }

    Fluttertoast.showToast(
        msg: 'was show data',
        fontSize: 20,
        backgroundColor: Colors.green,
        toastLength: Toast.LENGTH_SHORT);
    print(users);
    return users;
  }
}
