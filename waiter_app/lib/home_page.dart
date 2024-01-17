import 'package:flutter/material.dart';
import 'package:waiter_app/api.dart';
import 'dart:ui';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:waiter_app/api2.dart';

const apiKey = '4249615e5919f161a7a2c5bf97318683';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  List<Map<String, dynamic>> _waiterData = [];
  List<Map<String, dynamic>> _customerData = [];

  Future<void> fetchData() async {
    final waiterUri = Uri.parse(
        'https://7c1f090aa97ec5bc27997dbf77526158.serveo.net/employee');
    final customerUri = Uri.parse(
        'https://7c1f090aa97ec5bc27997dbf77526158.serveo.net/customer');

    final waiterResponse = await http.get(waiterUri);
    final customerResponse = await http.get(customerUri);

    if (waiterResponse.statusCode == 200 &&
        customerResponse.statusCode == 200) {
      final Map<String, dynamic> waiterData = json.decode(waiterResponse.body);
      final Map<String, dynamic> customerData =
          json.decode(customerResponse.body);

      setState(() {
        _waiterData = List<Map<String, dynamic>>.from(waiterData['data']);
        _customerData = List<Map<String, dynamic>>.from(customerData['data']);
      });
    } else {
      throw Exception(
          'Veri çekme başarısız: ${waiterResponse.statusCode} - ${customerResponse.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    fetchData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  var image = {
    "menu.png": "Menu",
    "salary.png": "Salary",
    "spending.png": "Spending",
    "gear.png": "Settings"
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 70, left: 20),
              child: Row(
                children: [
                  Icon(Icons.menu, size: 30, color: Colors.black54),
                  Expanded(child: Container()),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                "Statistics of performance",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              child: Align(
                child: TabBar(
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: CircleTabIndicator(color: Colors.black, radius: 3),
                  tabs: [
                    Tab(text: "Waiters"),
                    Tab(text: "Customers"),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              height: 400,
              width: double.maxFinite,
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                      itemCount: _waiterData.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        final data = _waiterData[index];
                        final name = data['name'].toString();
                        final count = data['count'] as int;
                        final profil_img_url = data['profil_img_url'] as String;
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Api_detail(
                                  name: name,
                                  count: count,
                                  profil_img_url: profil_img_url,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 15, top: 10),
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                image: NetworkImage(profil_img_url),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      }),
                  ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      final data = _customerData[index];
                      final name = data['name'].toString();
                      final minutes = data['minutes'] as double;
                      final profil_img_url = data['profil_img_url'] as String;
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Api_detail2(
                                name: name,
                                minutes: minutes,
                                profil_img_url: profil_img_url,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 15, top: 10),
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                              image: NetworkImage(profil_img_url),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Explore more',
                    style: TextStyle(
                      fontSize: 24, // Yazı boyutu
                      fontWeight: FontWeight.bold, // Kalınlık
                      color: Colors.black, // Yazı rengi
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      fontSize: 15, // Yazı boyutu
                      fontWeight: FontWeight.bold, // Kalınlık
                      color: Colors.blueGrey, // Yazı rengi
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 120,
              width: double.maxFinite,
              margin: const EdgeInsets.only(left: 20),
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/" + image.keys.elementAt(index),
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            image.values.elementAt(index),
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({required Color color, double radius = 3.0})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _painter;
  }
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius - 5);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
