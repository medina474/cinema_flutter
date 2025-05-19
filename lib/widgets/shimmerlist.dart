import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget buildShimmerTile() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    child: Row(
      children: [
        const CircleAvatar(radius: 24, backgroundColor: Colors.grey),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 12, color: Colors.grey, width: 150),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 12, color: Colors.grey, width: 30),
                  const SizedBox(height: 8),
                  Container(height: 12, color: Colors.grey, width: 100),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        const Icon(Icons.chevron_right, color: Colors.grey),
      ],
    ),
  );
}

Widget buildShimmerList() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: ListView.builder(
      itemCount: 8,
      itemBuilder: (_, __) => buildShimmerTile(),
    ),
  );
}
