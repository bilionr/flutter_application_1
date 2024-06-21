import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'artical_news.dart';
import 'constants.dart';
import 'list_of_country.dart';


class Page4 extends StatefulWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4>{
  dynamic cName;
  dynamic country;
  dynamic category;
  dynamic findNews;
  int pageNum = 1;
  bool isPageLoading = false;
  late ScrollController controller;
  int pageSize = 10;
  bool isSwitched = false;
  List<dynamic> news = [];
  bool notFound = false;
  List<int> data = [];
  bool isLoading = false;
  String baseApi = 'https://newsapi.org/v2/top-headlines?';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News',
      theme: isSwitched
            ? ThemeData(
              fontFamily: GoogleFonts.poppins().fontFamily,
              brightness: Brightness.dark,
            )
            : ThemeData(
              fontFamily: GoogleFonts.poppins().fontFamily,
              brightness: Brightness.light,
            ),
          
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('News'),
          actions: [
            IconButton(
              onPressed: () {
                country = null;
                category = null;
                findNews = null;
                cName = null;
                getNews(reload: true);
              },
              icon: const Icon(Icons.refresh),
            ),
            Switch(
              value: isSwitched,
              onChanged: (bool value) => setState(() => isSwitched = value),
              activeTrackColor: Colors.white,
              activeColor: Colors.black,
            ),
          ],
        ),
        body: notFound
            ? const Center(
                child: Text('Not Found', style: TextStyle(fontSize: 30)),
              )
            : news.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.yellow,
                    ),
                  )
                : ListView.builder(
                    controller: controller,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: GestureDetector(
                                onTap: () async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      fullscreenDialog: true,
                                      builder: (BuildContext context) =>
                                          ArticalNews(
                                        newsUrl: news[index]['url'] as String,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 15,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          if (news[index]['urlToImage'] == null)
                                            Container()
                                          else
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: CachedNetworkImage(
                                                placeholder:
                                                    (BuildContext context,
                                                            String url) =>
                                                        Container(),
                                                errorWidget:
                                                    (BuildContext context,
                                                            String url,
                                                            error) =>
                                                        const SizedBox(),
                                                imageUrl: news[index]
                                                    ['urlToImage'] as String,
                                              ),
                                            ),
                                          Positioned(
                                            bottom: 8,
                                            right: 8,
                                            child: Card(
                                              elevation: 0,
                                              color: Theme.of(context)
                                                  .primaryColor
                                                  .withOpacity(0.8),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                  vertical: 8,
                                                ),
                                                child: Text(
                                                  "${news[index]['source']['name']}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(),
                                      Text(
                                        "${news[index]['title']}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (index == news.length - 1 && isLoading)
                            const Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.yellow,
                              ),
                            )
                          else
                            const SizedBox(),
                        ],
                      );
                    },
                    itemCount: news.length,
                  ),
      ),
    );
  }

  Future<void> getDataFromApi(String url) async {
    final http.Response res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      if (jsonDecode(res.body)['totalResults'] == 0) {
        notFound = !isLoading;
        setState(() => isLoading = false);
      } else {
        if (isLoading) {
          final newData = jsonDecode(res.body)['articles'] as List<dynamic>;
          for (final e in newData) {
            news.add(e);
          }
        } else {
          news = jsonDecode(res.body)['articles'] as List<dynamic>;
        }
        setState(() {
          notFound = false;
          isLoading = false;
        });
      }
    } else {
      setState(() => notFound = true);
    }
  }

  Future<void> getNews({
    String? channel,
    String? searchKey,
    bool reload = false,
  }) async {
    setState(() => notFound = false);

    if (!reload && !isLoading) {
      toggleDrawer();
    } else {
      country = null;
      category = null;
    }
    if (isLoading) {
      pageNum++;
    } else {
      setState(() => news = []);
      pageNum = 1;
    }
    baseApi = 'https://newsapi.org/v2/top-headlines?pageSize=10&page=$pageNum&category=health&';

    baseApi += country == null ? 'country=in&' : 'country=$country&';
    baseApi += category == null ? '' : 'category=$category&';
    baseApi += 'apiKey=$apiKey';
    if (channel != null) {
      country = null;
      category = null;
      baseApi =
          'https://newsapi.org/v2/top-headlines?pageSize=10&page=$pageNum&sources=$channel&apiKey=58b98b48d2c74d9c94dd5dc296ccf7b6';
    }
    if (searchKey != null) {
      country = null;
      category = null;
      baseApi =
          'https://newsapi.org/v2/top-headlines?pageSize=10&page=$pageNum&q=$searchKey&apiKey=58b98b48d2c74d9c94dd5dc296ccf7b6';
    }
    //print(baseApi);
    getDataFromApi(baseApi);
  }

  @override
  void initState() {
    controller = ScrollController()..addListener(_scrollListener);
    getNews();
    super.initState();
  }

  void _scrollListener() {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      setState(() => isLoading = true);
      getNews();
    }
  }
}

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

void toggleDrawer() {
  if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
    _scaffoldKey.currentState?.openEndDrawer();
  } else {
    _scaffoldKey.currentState?.openDrawer();
  }
}

class DropDownList extends StatelessWidget {
  const DropDownList({super.key, required this.name, required this.call});
  final String name;
  final Function call;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(title: Text(name)),
      onTap: () => call(),
    );
  }
}
