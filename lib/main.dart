import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'provider/image_path.dart';
import 'screens/home.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CenteredImageUrlProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(

        // ignore: prefer_const_literals_to_create_immutables
        splash: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Image.asset('assets/movies.jpg', fit: BoxFit.cover),
            ),
            Container(
              height: double.infinity,
              color: Colors.black.withOpacity(0.89),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Movies ',
                          style: GoogleFonts.kanit(
                            textStyle: const TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.white, // Set color for the word "Movies"
                            ),
                          ),
                        ),
                        TextSpan(
                          text: 'DB',
                          style: GoogleFonts.kanit(
                            textStyle: const TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.red, // Set color for the word "Db"
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const SpinKitPulsingGrid(
                    size: 50,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
        splashIconSize: MediaQuery.of(context).size.height,
        splashTransition: SplashTransition.fadeTransition,
        duration: 2500,
        nextScreen: const HomeScreeen());
  }
}
