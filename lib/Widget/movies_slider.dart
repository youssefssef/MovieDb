import 'package:flutter/material.dart';

import '../screens/detailsPag.dart';
import 'constants.dart';

class MoviesSlider extends StatelessWidget {
  const MoviesSlider({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(movie: snapshot.data[index])));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    width: 150,
                    child: Image.network(
                        filterQuality: FilterQuality.high, fit: BoxFit.cover, '${Constants.imagePath}${snapshot.data![index].posterpath}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
