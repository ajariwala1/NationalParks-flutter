import 'package:flutter/material.dart';
import 'package:nationalparks/providers/nationalparks_provider.dart';
import 'package:nationalparks/screens/park_detail_screen.dart';
import 'package:provider/provider.dart';

class ParkResultsScreen extends StatelessWidget {
  const ParkResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<NationalParksProvider>();
    final parks = provider.parks;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            itemCount: parks.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              final park = parks[index];

              return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ParkDetailScreen(park: park),
                            ),
                          );
                        },
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Image.network(
                                  park.images.first.url,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: 60,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    park.fullName,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
              );
              
            },
          ),
        ),
      ),
    );
  }
}