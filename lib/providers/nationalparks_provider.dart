import 'dart:math';
import 'package:flutter/material.dart';
import 'package:nationalparks/models/intro_page.dart';
import '../models/park_model.dart';
import '../services/park_service.dart';

class NationalParksProvider extends ChangeNotifier {
  List<IntroPage> introPages = [];
  final ParkService parkService = ParkService();
  List<ParkModel> parks = [];
  String? errorMessage;

  Future<void> fetchParksByState(String stateCode) async {
    errorMessage = null;
    notifyListeners();

    try {
      parks = await parkService.fetchParksByState(stateCode);
    } catch (error) {
      errorMessage = 'Failed to load parks';
    }

    notifyListeners();
  }

  void loadIntroPages() {
    
    if (introPages.isNotEmpty) return;

    final captions = [
      "Discover America's wild places",
      "Plan your perfect park day",
      "Learn about park activities and details",
      "Start exploring national parks today",
    ];

    final imagePaths = List.generate(
      15,
      (index) => 'assets/images/${index + 1}.jpg',
    );

    imagePaths.shuffle(Random());

    final selectedImages = imagePaths.take(4).toList();

    introPages = List.generate(
      4,
      (index) => IntroPage(
        imagePath: selectedImages[index],
        caption: captions[index],
      ),
    );

    notifyListeners();

  }

}