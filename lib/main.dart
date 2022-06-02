import 'package:flutter/material.dart';
import 'cards.dart';
import 'assets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Images(),
    );
  }
}

List places = ['singer', 'singer', 'scenery'];

class Images extends StatefulWidget {
  const Images({Key? key}) : super(key: key);

  @override
  State<Images> createState() => _ImagesState();
}

class _ImagesState extends State<Images> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController controller = TabController(length: 3, vsync: this);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16)),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.yellowAccent, Colors.redAccent])),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 38,
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          child: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Text(
                      'favourite Singer?',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                children: [
                  TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.black,
                    controller: controller,
                    tabs: [
                      Tab(text: 'popular'),
                      Tab(text: 'popular'),
                      Tab(text: 'Recommend'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: controller,
                      children: [
                        ListView(
                          scrollDirection: Axis.horizontal,
                          children: places
                              .map((e) =>
                                  cardsState(title: e, images: Assets.image))
                              .toList(),
                        ),
                        ListView(
                          scrollDirection: Axis.horizontal,
                          children: places
                              .map((e) => cardsState(
                                    title: e,
                                    images: Assets.image1,
                                  ))
                              .toList(),
                        ),
                        ListView(
                          scrollDirection: Axis.horizontal,
                          children: places
                              .map((e) => cardsState(
                                    title: e,
                                    images: Assets.image2,
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
