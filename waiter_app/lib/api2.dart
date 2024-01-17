import 'dart:ui';
import 'package:flutter/material.dart';

class Api_detail2 extends StatefulWidget {
  final String name;
  final double minutes;
  final String profil_img_url;

  const Api_detail2({
    Key? key,
    required this.name,
    required this.minutes,
    required this.profil_img_url,
  }) : super(key: key);

  @override
  State<Api_detail2> createState() => _Api_detailState();
}

class _Api_detailState extends State<Api_detail2> {
  double screenWidth = 0;
  double screenHeight = 0;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
        backgroundColor: Colors.grey,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: widget.name,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              ),
              child: SizedBox(
                height: screenHeight / 2.2,
                width: screenWidth,
                child: Image.network(
                  widget.profil_img_url,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth / 20,
              vertical: 20,
            ),
            child: Text(
              widget.name,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.black87,
                fontSize: 30,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth / 20,
            ),
            child: Text(
              "Minutes: ${widget.minutes}",
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black87,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
