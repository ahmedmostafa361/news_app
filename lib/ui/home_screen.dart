import 'package:flutter/material.dart';
import 'package:news_app_flutter/ui/category_fragment/category_fragment.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'), centerTitle: true),
      body: CategoryFragment(),
    );
  }
}
