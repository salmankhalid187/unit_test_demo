import 'package:flutter/material.dart';
import './addProductsExample/product_manager.dart';
import './trendingNewsExample/trending_news.dart';

class ExampleList extends StatelessWidget {
  final List<String> examplesList = [
    'Add Products example',
    'Trending News example'
  ];

  @override
  Widget build(BuildContext context) {

    return ListView.separated(
      separatorBuilder: (context, index) => Divider(color: Colors.black),
      padding: const EdgeInsets.all(8),
      itemCount: examplesList.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            title: Text(examplesList[index]),
            onTap: () {
              this.onItemClick(context, index);
            },
          ),
        );
      },
    );
  }

  onItemClick(BuildContext buildContext, index) {
    switch (index) {
      case 0:
        {
          Navigator.push(
              buildContext,
              MaterialPageRoute(
                builder: (context) => ProductManager('Flash drive'),
              ));
        }
        break;
      case 1:
        {
          Navigator.push(
              buildContext,
              MaterialPageRoute(
                builder: (context) => TrendingNews(),
              ));
        }
        break;
    }
  }
}
