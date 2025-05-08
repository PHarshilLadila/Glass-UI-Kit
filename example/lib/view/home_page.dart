// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:glass_ui_kit/glass_ui_kit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 24, 208, 221),
        title: const Text(
          "Glass UI Kit Example",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://gratisography.com/wp-content/uploads/2023/05/gratisography-party-balloons-free-stock-photo-1170x780.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Center(
            child: GlassContainer(
              height: 500,
              width: 500,
              backgroundColor: const Color(0xffffffff).withOpacity(0.2),
              blur: 10,
              alignment: Alignment.bottomCenter,
              borderRadius: 20,
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Happy Birthday Kitty",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        "https://gratisography.com/wp-content/uploads/2024/10/gratisography-birthday-dog-sunglasses-800x525.jpg",
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Frosted Glass Card",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
