// ignore_for_file: avoid_print

import 'dart:convert';
// import 'package:dartz/dartz.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String baseUrl = 'http://127.0.0.1:8000/api'; /////
// String baseUrl = 'http://10.0.2.2:8000/api'; ///// emulator

class Api {
  Future<dynamic> get({required String url, @required String? token}) async {
    Map<String, String> headers = {};
    // print("My token 2 :$userToken");
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.get(Uri.parse(url), headers: headers);

    print('url= $url ,headrs=$headers');
    if (response.statusCode == 200) {
      dynamic data = jsonDecode(response.body);
      // print('url= $url ,headrs=$headers');

      // print(data);
      return data;
    } else if (response.statusCode == 404) {
      // return []; ////in my project ...
      Map<String, dynamic> data = jsonDecode(response.body);
      var message = data['message'];
      throw message;
    } else {
      throw Exception(
        'there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}',
      );
    }
  }

  Future<dynamic> post({
    required String url,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    http.Response response = await http.post(
      Uri.parse(url),
      body: jsonEncode(body),
      headers: headers,
    );

    print('url= $url ,body=$body ,headers=$headers');

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> data = jsonDecode(response.body);
      print(data);
      return data;
    } else {
      Map<String, dynamic> data = jsonDecode(response.body);
      var message = data['message'];
      print(message);

      throw message;
      // throw Exception(detail);
    }
  }

  Future<dynamic> delete({
    required String url,
    String? token,
  }) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    http.Response response =
        await http.delete(Uri.parse(url), headers: headers);
    print('url = $url headers = $headers token = $token ');

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      print(data);
      return data;
    } else {
      throw Exception(
        'There is a problem with status code ${response.statusCode} with body ${response.body}',
      );
    }
  }
}
