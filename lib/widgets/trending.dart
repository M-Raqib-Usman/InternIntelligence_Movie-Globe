import 'package:flutter/material.dart';
import 'package:movie_globe/common/text.dart';
import 'package:movie_globe/description.dart';


class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key, required this.trending});
  final List trending;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            modifiedText(
              text: 'Trending Movies',
              size: 26,
              color: Colors.white,
            ),
            SizedBox(height: 10),
            Container(
              height: 270,
              child: ListView.builder(
                itemCount: trending.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => Description(
                            name: trending[index]['title'],
                            description: trending[index]['overview'],
                            bannerurl:
                            'https://image.tmdb.org/t/p/w500' +
                                trending[index]['backdrop_path'],
                            posterurl:
                            'https://image.tmdb.org/t/p/w500' +
                                trending[index]['poster_path'],
                            vote: trending[index]['vote_average'].toString(),
                            launch_on: trending[index]['release_date'],
                          ),
                        ),
                      );
                    },
                    child:
                    trending[index]['title'] != null?Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      trending[index]['poster_path'],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: modifiedText(
                              text:
                              trending[index]['title'] != null
                                  ? trending[index]['title']
                                  : 'Loading',
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ],
                      ),
                    ):Container(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
