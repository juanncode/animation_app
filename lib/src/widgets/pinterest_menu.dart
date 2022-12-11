import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final VoidCallback onPressed;
  final IconData icon;

  PinterestButton({required this.onPressed, required this.icon});
}

class PinterestMenu extends StatelessWidget {

  final bool mostrar;

  final List<PinterestButton> items = [
    PinterestButton(
        icon: Icons.pie_chart,
        onPressed: () {
          print("Icons.pie_chart");
        }),
    PinterestButton(
        icon: Icons.search,
        onPressed: () {
          print("Icons.search");
        }),
    PinterestButton(
        icon: Icons.notification_add,
        onPressed: () {
          print("Icons.notification_add");
        }),
    PinterestButton(
        icon: Icons.supervised_user_circle,
        onPressed: () {
          print("Icons.supervised_user_circle");
        }),
  ];

  PinterestMenu({super.key, this.mostrar = true});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity:  Provider.of<MenuModel>(context).mostrarMenu ? 1 : 0,
        child: Container(
          width: 250,
          height: 60,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(100)),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 32, 31, 31),
                  blurRadius: 10,
                )
              ]),
          child: _MenuItems(menuItems: items),
        ),
      );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;
  const _MenuItems({Key? key, required this.menuItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        menuItems.length,
        (index) => _PinterestMenuButton(
          index: index,
          item: menuItems[index],
        ),
      ),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;
  const _PinterestMenuButton(
      {Key? key, required this.index, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemSeleccionado = Provider.of<MenuModel>(context).itemSeleccionado;
    return GestureDetector(
      onTap: () {
        Provider.of<MenuModel>(context, listen: false).itemSeleccionado =
            index;
        item.onPressed();
      },
      child: Container(
        child: Icon(
          item.icon,
          size: (itemSeleccionado == index) ? 35 : 25,
          color: (itemSeleccionado == index) ? Colors.blue : Colors.red,
        ),
      ),
    );
  }
}

class MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;
  bool _mostrarMenu = true;

  int get itemSeleccionado => _itemSeleccionado;
  bool get mostrarMenu => _mostrarMenu;

  set itemSeleccionado(int index) {
    _itemSeleccionado = index;
    notifyListeners();
  }

  set mostrarMenu(bool mostrar) {
    _mostrarMenu = mostrar;
    notifyListeners();
  }
}
