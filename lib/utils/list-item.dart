import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  const ListItem({super.key, required this.text, required this.focus});
  final String text;
  final FocusNode focus;
  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: widget.focus,
      child: Container(
        width: 500,
        height: 30,
        alignment: Alignment.center,
        decoration: (widget.focus.hasFocus)
            ? const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color.fromARGB(106, 255, 255, 255))
            : const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color.fromARGB(88, 0, 0, 0),
              ),
        child: Text(widget.text, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
