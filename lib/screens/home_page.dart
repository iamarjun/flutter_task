import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_task/constants.dart';
import 'package:flutter_task/widgets/tile.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _categories = [
    'Wellness & Selfcare',
    'Bridal Fashion',
    'Photography',
    'Makeup',
    'Beauty',
    'Spa',
    'Wellness & Selfcare',
    'Bridal Fashion',
    'Photography',
    'Makeup',
    'Beauty',
    'Spa',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text(
              'Ask Pankhuri',
              style: TextStyle(color: kPrimaryColor),
            ),
            backgroundColor: Colors.white,
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.purple[100],
              height: MediaQuery.of(context).size.height * 0.35,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Select Category', style: kTextStyle),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: StaggeredGridView.countBuilder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      crossAxisCount: 4,
                      itemCount: _categories.length,
                      itemBuilder: (BuildContext context, int index) => Center(
                        child: Tile(
                          Colors.white,
                          _categories[index],
                        ),
                      ),
                      staggeredTileBuilder: (int index) =>
                          StaggeredTile.count(2, index.isEven ? 3 : 2),
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: kPrimaryColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: ListTile(
                            leading: Text(
                              'P',
                              style: TextStyle(
                                fontSize: 32.0,
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor,
                              ),
                            ),
                            title: Text(
                              'Ask pakhuri something else',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, index) {
                final int itemIndex = index ~/ 2;
                if (index.isEven) {
                  return ListTile(
                    trailing: Text('9:20'),
                    leading: CircleAvatar(
                      radius: 25.0,
                      child: Icon(
                        Icons.camera_alt,
                        color: kPrimaryColor,
                      ),
                      backgroundColor: Colors.purple[100],
                    ),
                    title: Text(_categories[itemIndex]),
                    subtitle: Text(_categories[itemIndex]),
                  );
                }
                return Divider(height: 0, color: Colors.grey);
              },
              semanticIndexCallback: (Widget widget, int localIndex) {
                if (localIndex.isEven) {
                  return localIndex ~/ 2;
                }
                return null;
              },
              childCount: max(0, _categories.length * 2 - 1),
            ),
          )
        ],
      ),
    );
  }
}
