// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:glass_ui_kit/glass_ui_kit.dart';

class TransperentShaps extends StatelessWidget {
  const TransperentShaps({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        centerTitle: true,
        title: const Text(
          "Glass UI Kit Example (Shap)",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Stack(
        children: [
          // Background Image
          _buildBackgroundImage(),
          // Glass Containers in a Grid Layout
          _buildGlassShapesGrid(),
        ],
      ),
    );
  }

  /// Builds the background image for the page.
  Widget _buildBackgroundImage() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            "https://wallpapercat.com/w/full/9/5/a/945731-3840x2160-desktop-4k-matte-black-wallpaper-image.jpg",
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  /// Builds the grid layout containing various GlassContainer shapes.
  Widget _buildGlassShapesGrid() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      padding: const EdgeInsets.all(8),
      children: [
        _buildGlassContainer(
          clipper: BlobClipper2(),
          blur: 15,
          label: "Blob Shape",
        ),
        _buildGlassContainer(
          clipper: WaveClipper(),
          blur: 13,
          label: "Wave Shape",
        ),
        _buildGlassContainer(
          clipper: HeartClipper(),
          blur: 11,
          label: "Heart Shape",
        ),
        _buildGlassContainer(
          clipper: CircleCutClipper(),
          blur: 9,
          label: "Circle Cut",
        ),
        _buildGlassContainer(
          clipper: ConcaveClipper(),
          blur: 7,
          label: "Oval Shape",
        ),
        _buildGlassContainer(
          clipper: StarClipper(),
          blur: 5,
          label: "Star Shape",
        ),
        _buildGlassContainer(
          clipper: TriangleClipper(),
          blur: 3,
          label: "Triangle Shape",
        ),
        _buildGlassContainer(
          clipper: DiamondClipper(),
          blur: 1,
          label: "Diamond Shape",
        ),
      ],
    );
  }

  /// Builds a single GlassContainer with the specified properties.
  Widget _buildGlassContainer({
    required CustomClipper<Path> clipper,
    required double blur,
    required String label,
  }) {
    return GlassContainer(
      blur: blur,
      clipper: clipper,
      backgroundColor: Colors.white.withOpacity(0.25),
      border: Border.all(color: Colors.white.withOpacity(0.3)),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
