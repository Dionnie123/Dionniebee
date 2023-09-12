import 'package:collection/collection.dart';
import 'package:dionniebee/app/models/location_dto.dart';
import 'package:flutter/material.dart';

class SlidingUpPanelList extends StatelessWidget {
  final List<LocationDto> items;
  const SlidingUpPanelList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .mapIndexed((index, location) => Card(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        location.name.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      " - ${location.distanceInKm} km",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )))
          .toList(),
    );
  }
}
