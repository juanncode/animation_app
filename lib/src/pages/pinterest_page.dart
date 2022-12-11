import 'package:animation_app/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => MenuModel(),
        child: Stack(
          children: [
            PinteresGrid(),
            Positioned(
              bottom: 30,
              child: Container(
                alignment: Alignment.center,
                width: size.width,
                child: PinterestMenu(),
              ),
            )
          ]
        ),
      ),
    );
  }
}

class PinteresGrid extends StatefulWidget {
  const PinteresGrid({Key? key}) : super(key: key);

  @override
  State<PinteresGrid> createState() => _PinteresGridState();
}

class _PinteresGridState extends State<PinteresGrid> {

  ScrollController controller = ScrollController();
  double scrollAnterior = 0;

  @override
  void initState() {
    controller.addListener(() { 
      final providerMenu = Provider.of<MenuModel>(context, listen: false);

      if (controller.offset > scrollAnterior) {
        providerMenu.mostrarMenu = true;
      } else {
        providerMenu.mostrarMenu = false;
      }

      scrollAnterior = controller.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      controller: controller,
      crossAxisCount: 2,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemCount: 30,
      itemBuilder: (context, index) {
        return Container(
          height: 80,
          color: Colors.blue,
          child: Center(child: Text("hola $index")),
        );
      },
      
    );
  }
}
