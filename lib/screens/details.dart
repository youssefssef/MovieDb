// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:moviesdb/models/movies.dart';

import '../Widget/constants.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.movie});

  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: Container(
              height: 60,
              width: 60,
              margin: const EdgeInsets.only(top: 16, left: 8),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_rounded)),
            ),
            //backgroundColor: Colors.grey,
            expandedHeight: 500,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                movie.title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              background: ClipRRect(
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
                  child: Image.network(filterQuality: FilterQuality.high, fit: BoxFit.fill, '${Constants.imagePath}${movie.posterpath}')),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [],
              ),
            ),
          )
        ],
      ),
    );
  }
}
