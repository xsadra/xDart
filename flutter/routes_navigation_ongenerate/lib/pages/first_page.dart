import 'package:flutter/material.dart';
import 'package:routes_navigation_ongenerate/route_generator.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Routes & Navigation"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "First Page",
              style: TextStyle(
                fontSize: 66.0,
                color: Colors.blue,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.secondPage,
                    arguments: 'This data come from First Page!');
              },
              child: Text(
                "Go to Second Page",
                style: TextStyle(
                  fontSize: 33.0,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 55.0),
            ElevatedButton(
              onPressed: () {
                // now by using [Routes] cannot route to an unknown route!
                Navigator.of(context).pushNamed('/other',
                    arguments: 'This data come from First Page!');
              },
              child: Text(
                "Break the Route",
                style: TextStyle(
                  fontSize: 33.0,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
