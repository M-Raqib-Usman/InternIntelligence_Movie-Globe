import 'package:flutter/material.dart';
import 'package:movie_globe/common/text.dart';
import 'package:movie_globe/description.dart';


class TvShows extends StatelessWidget {
  const TvShows({super.key, required this.tv});
  final List tv;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modifiedText(text: 'Popular TV  Shows', color: Colors.white, size: 26),
          SizedBox(height: 10,),
          Container(height: 230,child: ListView.builder(itemCount:tv.length,scrollDirection:Axis.horizontal,itemBuilder: (context,index){
            return InkWell(
              onTap:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => Description(
                      name: tv[index]['title'],
                      description: tv[index]['overview'],
                      bannerurl:
                      'https://image.tmdb.org/t/p/w500' +
                          tv[index]['backdrop_path'],
                      posterurl:
                      'https://image.tmdb.org/t/p/w500' +
                          tv[index]['poster_path'],
                      vote: tv[index]['vote_average'].toString(),
                      launch_on: tv[index]['release_date'],
                    ),
                  ),
                );
              } ,
              child: tv[index]['original_name']!=null?Container(
                padding: EdgeInsets.all(5),
                width: 250,
                child: Column(
                  children: [
                    Container(
                      width: 250,
                      height:140,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500'+tv[index]['backdrop_path']
                          ),fit: BoxFit.cover
                          )),
                    ),
                    SizedBox(height: 10,),
                    Container(child: modifiedText(text: tv[index]['original_name']!=null?tv[index]['original_name']:'Loading', color: Colors.white, size: 15),)
                  ],
                ),
              ):Container(),
            );
          }),)
        ],
      ),
    );
  }
}
