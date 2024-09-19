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

  // Membuat Method yang return nya sebuah Map (PeopleModel)
  // Jika ingin fleksibel/dynamic buat aja nama methodnya langsung, bisa pakai return/tidak
  PeopleModel getPeopleById(String id) {
    return _peoples.firstWhere((element) => element.id == id);
  }

  Future<void> updatePeople(PeopleModel people) async {
    // URL
    Uri url = Uri.parse('$baseUrl/peoples/${people.id}.json');

    // body (json encode) -> MANUAL
    // var body = json.encode({
    //   'email': people.email,
    //   'fullname': people.fullname,
    //   'job': people.job,
    // });

    // request
    var response = await http.patch(
      url,
      body: jsonEncode(people.toJson()),
    );

    if (response.statusCode == 200) {
      // Get data by Id
      PeopleModel peopleData =
          _peoples.firstWhere((element) => element.id == people.id);

      // Update data
      peopleData.email = people.email;
      peopleData.fullname = people.fullname;
      peopleData.job = people.job;
    } else {
      throw Exception(
          'Failed to update : Status Code (${response.statusCode})');
    }

    notifyListeners();
  }

  Future<void> deletePeople(String id) async {
    // URL
    Uri url = Uri.parse('$baseUrl/peoples/$id.json');

    // request
    var response = await http.delete(url);

    // Check
    if (response.statusCode == 200) {
      // Delete Pada Data Lokal
      _peoples.removeWhere((element) => element.id == id);
      print('delete');
    } else {
      throw Exception('Failed to delete : Status Code ${response.statusCode}');
    }

    notifyListeners();
  }
}
