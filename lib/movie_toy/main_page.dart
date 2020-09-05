import 'dart:convert';

import "package:flutter/material.dart";
import 'package:test_flutter/movie_toy/grid_page.dart';
import 'package:test_flutter/movie_toy/list_page.dart';
import 'package:http/http.dart' as http;
import 'package:test_flutter/movie_toy/model/response/movies_response.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  MoviesResponse _moviesResponse;
  int _selectedTabIndex = 0;
  int _selectedSortIndex = 0;

  @override
  void initState() {
    super.initState();
    _requestMovies();
  }

  // 2-1. 메인화면 - MovieResponse 데이터 받아오기
  void _requestMovies() async {
    // 1. 영화 목록 데이터 초기화
    setState(() {
      _moviesResponse = null;
    });
    // 2. 서버에 요청을 진행하여 응답 데이터를 가져옴
    final response = await http.get(
        'http://padakpadak.run.goorm.io/movies?order_type=$_selectedSortIndex');
    // 3 서버로부터 받아온 응답 데이터를 기반으로 영화 목록 데이터를 갱신
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final moviesResponse = MoviesResponse.fromJson(jsonData);
      setState(() {
        _moviesResponse = moviesResponse;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie'),
        leading: Icon(Icons.menu),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.sort),
            onSelected: (value) {
              if (value == 0)
                print("예매율 순");
              else if (value == 1)
                print("큐레이션");
              else
                print("최신 순");
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(value: 0, child: Text("예매율 순")),
                PopupMenuItem(value: 1, child: Text("큐레이션")),
                PopupMenuItem(value: 2, child: Text("최신 순")),
              ];
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            title: Text('List'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_on),
            title: Text('grid'),
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedTabIndex = index;
          });
        },
        currentIndex: _selectedTabIndex,
      ),
      body: _buildPage(_selectedTabIndex, _moviesResponse),
    );
  }
}

// 2-2. 메인화면 - _buildPage() 함수 내용 수정
Widget _buildPage(index, moviesResponse) {
  Widget contentsWidget;

  // 2-3. moviesResponse 가 비었을 경우에 대한 분기 처리
  if (moviesResponse == null) {
    contentsWidget = Center(child: CircularProgressIndicator());
  } else {
    switch (index) {
      case 0:
        contentsWidget = ListPage(moviesResponse.movies);
        break;
      case 1:
        contentsWidget = GridPage(moviesResponse.movies);
        break;
      default:
        contentsWidget = Container();
    }
  }
  return contentsWidget;
}
