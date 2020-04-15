import 'package:flutter/material.dart';
import 'package:lojavirtual/tabs/home_tab.dart';
import 'package:lojavirtual/tabs/produtos_tab.dart';
import 'package:lojavirtual/widgets/custom_drawer.dart';
class HomeScreen extends StatelessWidget {
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          drawer: CustomDrawer(_pageController),
          body: HomeTab(),
        ),
        Scaffold(
          drawer: CustomDrawer(_pageController),
          appBar: AppBar(
            title: Text("Produtos"),
            centerTitle: true,
          ),
          body: ProdutosTab(),
        )        
      ],

    );
  }
}