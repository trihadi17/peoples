import 'dart:convert';

import 'package:flutter/material.dart';

// Model
import 'package:peoples/model/people.dart';

// Package
import 'package:http/http.dart' as http;

class PeopleProvider with ChangeNotifier {
  List<PeopleModel> _peoples = [];

  List<PeopleModel> get peoples => _peoples;

  set todos(List<PeopleModel> todos) {
    _peoples = todos;
    notifyListeners();
  }

  // URL API
  String baseUrl = 'https://peoples-fc3cc-default-rtdb.firebaseio.com';

  Future<void> getPeople() async {
    // URL
    Uri url = Uri.parse('$baseUrl/peoples.json');

    // request
    var response = await http.get(
      url,
    );

    // print(json.decode(response.body));

    var dataResponse = json.decode(response.body);
    if (response.statusCode == 200) {
      //* Foreach data
      if (dataResponse != null) {
        dataResponse.forEach((key, value) {
          // print(key);
          // print(value['email']);

          _peoples.add(
            PeopleModel(
              id: key,
              email: value['email'],
              fullname: value['fullname'],
              job: value['job'],
            ),
          );
        });
      }
    } else {
      throw Exception('Failed to get');
    }

    notifyListeners();
  }

  Future<void> addPeople(String email, String fullname, String job) async {
    // URL
    Uri url = Uri.parse('$baseUrl/peoples.json');

    // body (json encode)
    var body = jsonEncode({
      'email': email,
      'fullname': fullname,
      'job': job,
    });

    // request
    var response = await http.post(
      url,
      body: body,
    );

    if (response.statusCode == 200) {
      // print('Success');
      // print(jsonDecode(response.body)['fullname']);

      _peoples.add(
        PeopleModel(
          id: json.decode(response.body)["name"].toString(),
          email: email,
          fullname: fullname,
          job: job,
        ),
      );
    } else {
      throw Exception('Failed to add');
    }

    notifyListeners();
  }
}
