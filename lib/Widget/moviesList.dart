import 'package:flutter/material.dart';

import '../screens/detailsPag.dart';
import 'constants.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns in the grid
        childAspectRatio: 0.6,
        crossAxisSpacing: 10,
      ),
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(movie: snapshot.data[index])));
                  },
                  child: Container(
                    height: 300,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage('${Constants.imagePath}${snapshot.data![index].posterpath}'),
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover)),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      width: 40, // Width of the small container
                      height: 50, // Height of the small container
                      color: const Color.fromARGB(255, 207, 195, 89), // Color of the small container
                      child: Center(
                        child: Text(
                          '${snapshot.data![index].voteAvarege.toStringAsFixed(1)}',
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    child: Container(
                      height: 80,
                      width: 200,
                      color: Colors.black.withOpacity(0.4),
                      child: Center(
                        child: Text(
                          '${snapshot.data![index].title}',
                          style:
                              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16, overflow: TextOverflow.fade),
                        ),
                      ),
                    ))
              ],
            ),
          ],
        );
      },
    );
  }
}
