import 'package:flutter/material.dart';
import 'package:movie_globe/common/text.dart';
import 'package:movie_globe/description.dart';

class TopRated extends StatelessWidget {
  const TopRated({super.key, required this.toprated});
  final List toprated;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            modifiedText(text: 'TopRated Movies',size: 26,color: Colors.white,),
            SizedBox(height: 10,),
            Container(height: 270,child: ListView.builder(itemCount:toprated.length,scrollDirection: Axis.horizontal,itemBuilder: (context,index){
              return InkWell(
                onTap:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => Description(
                        name: toprated[index]['title'],
                        description: toprated[index]['overview'],
                        bannerurl:
                        'https://image.tmdb.org/t/p/w500' +
                            toprated[index]['backdrop_path'],
                        posterurl:
                        'https://image.tmdb.org/t/p/w500' +
                            toprated[index]['poster_path'],
                        vote: toprated[index]['vote_average'].toString(),
                        launch_on: toprated[index]['release_date'],
                      ),
                    ),
                  );
                } ,
                child:toprated[index]['title']!=null? Container(
                  width: 140,
                  child: Column(
                    children: [
                      Container(
                        height:200,
                        decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path']
                        ))),
                      ),
                      Container(child: modifiedText(text: toprated[index]['title']!=null?toprated[index]['title']:'Loading', color: Colors.white, size: 15),)
                    ],
                  ),
                ):Container(),
              );
            }),)
          ],
        ),
      ),
    );
  }
}
