import 'package:eyevision/screens/chart-screen.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatefulWidget {
  const MenuItem(
      {super.key,
      required this.icon,
      required this.name,
      required this.focusNode,
      required this.image});
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
          height: 25,
          width: 20,
          decoration: widget.focusNode.hasFocus
              ? BoxDecoration(
                  // color: Color.fromARGB(40, 255, 255, 255),
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: [
                    BoxShadow(blurRadius: 4, blurStyle: BlurStyle.outer)
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
                  color: Colors.transparent),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(9.0),
                child: Container(
                  width: double.infinity,
                  height: 98,
                  // decoration: BoxDecoration(
                  //     border: Border.all(color: Colors.blue, width: 2)),
                  child: Image.asset(
                    widget.icon,
                    // height: 80,
                    fit: BoxFit.cover,
                    // width: double.infinity,
                    // colorBlendMode: BlendMode.difference,
                    // color: Colors.white,
                  ),
                ),
              ),
              // const Padding(padding: EdgeInsets.only(top: 1)),
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent
                ),
                child: Text(
                  widget.name,
                  style: TextStyle(
                    color: widget.focusNode.hasFocus ? Colors.white : Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
