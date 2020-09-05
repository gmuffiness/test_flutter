import 'package:flutter/material.dart';
import 'package:test_flutter/movie_toy/detail_page.dart';
import 'package:test_flutter/movie_toy/model/response/movies_response.dart';

class GridPage extends StatelessWidget {
  final List<Movie> movies;
  GridPage(this.movies);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (9 / 16),
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) => _buildGridItem(context, index: index));
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

  Widget _buildGridItem(BuildContext context, {@required int index}) {
    Movie movie = movies[index];

    // 1-5. 상세화면 연결 (InkWell 사용)
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                alignment: Alignment.topRight,
                children: <Widget>[
                  Image.network(
                    movie.thumb,
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: _buildGradeImage(movie.grade),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            FittedBox(
              child: Text(
                movie.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
                '${movie.reservationGrade}위(${movie.userRating}) / ${movie.reservationRate}%'),
            SizedBox(height: 8),
            Text('${movie.date}'),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => DetailPage(movies[index].id),
        ));
      },
    );
  }
}
