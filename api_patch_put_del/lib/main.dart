import 'package:api_patch_put_del/screens/home_screen.dart';
import 'package:flutter/material.dart';

// video: https://www.youtube.com/watch?v=jymr1hEvfkM&t=441s

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.orange[100],
        appBarTheme: const AppBarTheme(
          elevation: 0.0
        )
      ),
      home: HomeScreen(),
    );
  }
}
