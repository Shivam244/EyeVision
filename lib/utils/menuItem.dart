import 'package:eyevision/screens/chart-screen.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatefulWidget {
  const MenuItem(
      {super.key,
      required this.icon,
      required this.name,
      required this.focusNode, required this.image});
  final String icon;
  final String name;
  final FocusNode focusNode;
  final String image;
  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>ChartScreen(image: widget.image))),
      child: Focus(
        focusNode: widget.focusNode,
        child: Container(
          height: 20,
          width: 20,
          decoration: widget.focusNode.hasFocus
              ? const BoxDecoration(
                  color: Color.fromARGB(40, 255, 255, 255),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: [
                    BoxShadow(blurRadius: 7, blurStyle: BlurStyle.outer)
                  ],
                )
              : const BoxDecoration(
                  boxShadow: [
                    BoxShadow(blurRadius: 10, blurStyle: BlurStyle.outer)
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  // gradient: LinearGradient(
                  //     begin: Alignment.bottomLeft,
                  //     end: Alignment.topRight,
                  //     colors: [
                  //       Colors.black,
                  //       Color.fromRGBO(79, 96, 97, 100),
                  //       Colors.black
                  //     ]),
                  // color: Color.fromRGBO(79, 96, 97, 0),
                  color: Colors.black
                ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                widget.icon,
                height: 80,
                colorBlendMode: BlendMode.difference,
                color: Colors.white,
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              Text(
                widget.name,
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
