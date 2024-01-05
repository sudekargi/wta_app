import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waiter_app/login_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 128, 61, 56),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 60),
            Text(
              'CAFE TRACKING SYSTEM',
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(80),
              child: Image.asset('assets/barista.png'),
            ),
            Text(
              "DAILY CAFE EFFICIENCY PREPARED FOR THE MANAGER",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 35,
                color: Colors.white,
              ),
            ),
            Text(
              "An application that presents the service amounts of the waiters and the time spent by the customers in the cafe to the manager with camera detection.",
              style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 188, 184, 184),
                height: 2,
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 128, 81, 77),
                  onPrimary: Colors.white,
                  textStyle: TextStyle(fontSize: 15),
                  fixedSize: Size(350, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  )),
              child: Text(
                'Get Started',
              ),
            )
          ],
        ),
      ),
    );
  }
}
