import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vakil99/constants.dart';
import 'package:dartz/dartz.dart';

class ApiServices{

  postApi(String uri,Map map) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString(userToken);
    try {
      var response = await http.post(Uri.parse('$baseURL$uri'),
          body: map);
      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        return Left(result);
      } else {
        return Right(response.body.toString());
      }
    } on SocketException catch (e) {
      return Right(e);
    } catch (e) {
      return Right(e);
    }
  }

  getApi(String uri) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString(userToken);
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      var response = await http.get(Uri.parse('$baseURL$uri'),headers: headers);
      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        return Left(result);
      } else {
        return Right(response.body.toString());
      }
    } on SocketException catch (e) {
      return Right(e);
    } catch (e) {
      return Right(e);
    }
  }



}