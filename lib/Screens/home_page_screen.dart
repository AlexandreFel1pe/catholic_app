import 'package:catholic_app/utils/app_routes.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catholic App'),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 20,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.BIBLIA);
              }, 
              child: Text('Bíblia'),
            ),
            ElevatedButton(
              onPressed: () {
        
              }, 
              child: Text('Terço'),
            ),
            ElevatedButton(
              onPressed: () {
        
              }, 
              child: Text('Liturgia Diária'),
            ),
          ],
        ),
      ),
    );
  }
}