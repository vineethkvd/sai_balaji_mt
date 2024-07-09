import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CategoryBottomNav extends StatelessWidget {
  const CategoryBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomNavBar(),
      appBar: AppBar(
        title: Text('Category Page'),
      ),
      body: Center(child: Text('Category')),
    );
  }
}
