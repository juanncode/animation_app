import 'package:flutter/material.dart';

class SliverPage extends StatelessWidget {
  const SliverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _MainScroll(),
          Positioned(
            bottom: -20,
            right: 0,
            child: ButtonNewList())
        ],
      )
    );
  }
}

class ButtonNewList extends StatelessWidget {
  const ButtonNewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ButtonTheme(
      minWidth: size.width * 0.9,
      height: 100,
      child: MaterialButton(onPressed: (){}, child: Text("Create new list"), color: Colors.yellow),
    );
  }
}

class _MainScroll extends StatelessWidget {
  const _MainScroll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            minHeight: 170,
            maxHeight: 200,
            child: Container(
              color: Colors.white,
              child: _Titulo(),
            )
          )
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              _ListItem(),
              _ListItem(),
              _ListItem(),
              _ListItem(),
              _ListItem(),
              _ListItem(),
              _ListItem(),
              _ListItem(),
              SizedBox(height: 100)
            ]
          ),
        )
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate{

  final double minHeight;
  final double maxHeight;
  final Widget child;
  _SliverCustomHeaderDelegate({required this.minHeight, required this.maxHeight, required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || 
          minHeight != oldDelegate.minHeight || 
          child != oldDelegate.child;
  }
}

class _Titulo extends StatelessWidget {
  const _Titulo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const  Text('New', style: TextStyle(color: Colors.red, fontSize: 50)),
          ),
          Stack(
            children: [
              Container(
                child: const Text('List', style: TextStyle(color: Colors.cyan, fontSize: 50, fontWeight: FontWeight.bold)),
              ),
              Positioned(
                bottom: 20,
                child: Container(width: 120, height: 5, color: Colors.cyan))
            ],
          )
        ],
      ),
    );
  }
}

class _ListaTareas extends StatelessWidget {
  const _ListaTareas({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) => _ListItem(),
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Center(
        child: Text("Holaa", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}