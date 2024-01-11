import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = '4249615e5919f161a7a2c5bf97318683';

class Api_detail extends StatefulWidget {
  const Api_detail({Key? key}) : super(key: key);

  @override
  State<Api_detail> createState() => _Api_detailState();
}

class _Api_detailState extends State<Api_detail> {
  List<Map<String, dynamic>> _data = [];

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('https://58b0-92-44-184-170.ngrok-free.app/'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        _data = List<Map<String, dynamic>>.from(data['results']);
      });
    } else {
      throw Exception('Veri çekme başarısız: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset("assets/barista.jpeg"),
            ),
          ],
        ),
      ),
    );
  }

  scroll() {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 1.0,
      minChildSize: 0.6,
      builder: (context, ScrollController) {
        return Container(
          clipBehavior: Clip.hardEdge,
        );
      },
    );
  }
}



/*
buttonArrow() {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      clipBehavior: Clip.hardEdge,
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
*/