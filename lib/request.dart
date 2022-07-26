import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

/*
Future<http.Response> fetchAlbum() {
  return http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
}
*/
void main(List<String> arguments) {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/albums/1');
  http.get(url).then((res) {});
}

