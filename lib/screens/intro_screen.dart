import 'package:flutter/material.dart';
import 'package:nationalparks/providers/nationalparks_provider.dart';
import 'package:nationalparks/screens/park_search_screen.dart';
import 'package:provider/provider.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NationalParksProvider>().loadIntroPages();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NationalParksProvider>(context);
  
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: PageView.builder(
              itemCount: provider.introPages.length,
              itemBuilder: (context, index) {
                final page = provider.introPages[index];
                return Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        page.imagePath,
                        height: 350,
                        fit: BoxFit.cover,
                      ),
            
                      SizedBox(height: 30),
            
                      Text(
                        page.caption,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),);
              }),
          ),

          Padding(
            padding: EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ParkSearchScreen(),
                  ),
                );
              }, 
              child: Text("Start Exploring")),)
        ],
      ))
      
    );
  }
}