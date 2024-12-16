import 'package:flutter/material.dart';
import 'package:delivery_app/constants/constants.dart';

class Customappbar extends StatelessWidget implements PreferredSizeWidget{
  @override
  final Size preferredSize;
  const Customappbar({
    super.key,
  }) : preferredSize = const Size.fromHeight(65.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Constants.primary_color,
      title: const Center(child: Text("Delivery App")),
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
            size: 40,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
    );
  }

}
