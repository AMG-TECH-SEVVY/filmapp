
import 'package:filmapp/providers/movie_provider.dart';
import 'package:filmapp/screens/home_page.dart';
import 'package:filmapp/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const FilmApp());

}
class FilmApp extends StatelessWidget {
  const FilmApp({super.key});

  @override
  Widget build(BuildContext context) {
     return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MovieProvider()),
        // Ajoute d'autres providers ici si nécessaire
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AMG_App_Films',
        theme: ThemeData(
          primarySwatch: Colors.blue,
         scaffoldBackgroundColor: Colors.black, // Fond noir pour l'ensemble de l'application
        ),
      //home:const Homepage(),
      home:const HomeScreen(),
  ),
    );
  }
}



