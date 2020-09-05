import "package:flutter/material.dart";
import 'package:test_flutter/movie_toy/detail_page.dart';
import 'package:test_flutter/movie_toy/model/response/movies_response.dart';

class ListPage extends StatelessWidget {
  final List<Movie> movies;
  ListPage(this.movies);

  @override
  Widget build(BuildContext context) {
    // 1-3. 리스트 화면 (초기 리스트 구현)
    return ListView.separated(
        itemBuilder: (context, index) {
          // return _buildItem(movies[index]);
          return InkWell(
            child: _buildItem(movies[index]),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => DetailPage(movies[index].id),
                ),
              );
            },
          );
        },
        separatorBuilder: (_, index) => Divider(color: Colors.grey),
        itemCount: movies.length);
  }

  Widget _buildGradeImage(int grade) {
    switch (grade) {
      case 0:
        // return Image.asset("assets/ic_allages.png");
        return Text('0');
      case 12:
        // return Image.asset("assets/ic_12.png");
        return Text('12');
      case 15:
        // return Image.asset("assets/ic_15.png");
        return Text('15');
      case 19:
        // return Image.asset("assets/ic_19.png");
        return Text('19');
      default:
        return null;
    }
  }

  // 1-3. 리스트 화면 (동적 데이터 호출1)
  Widget _buildItem(Movie movie) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(movie.thumb, height: 120),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      movie.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    _buildGradeImage(movie.grade),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Text('평점 : ${movie.userRating / 2}'),
                    SizedBox(width: 10),
                    Text('예매순위 : ${movie.reservationGrade}'),
                    SizedBox(width: 10),
                    Text('예매율 : ${movie.reservationRate}')
                  ],
                ),
                SizedBox(height: 10),
                Text('개봉일 : ${movie.date}')
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDummyItem() {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
              'https://upload.wikimedia.org/wikipedia/ko/9/97/%EC%8B%A0%EA%B3%BC_%ED%95%A8%EA%BB%98_-_%EC%9D%B8%EA%B3%BC_%EC%97%B0.png',
              height: 120),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      '신과함께-죄와벌',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    // 1-3. 리스트 화면 (UI 변경 제안 대처)
                    _buildGradeImage(12),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Text('평점 : 139'),
                    SizedBox(width: 10),
                    Text('예매순위 : 1'),
                    SizedBox(width: 10),
                    Text('예매율 : 35.5')
                  ],
                ),
                SizedBox(height: 10),
                Text('개봉일 : 2017-12-20')
              ],
            ),
          )
        ],
      ),
    );
  }
}
