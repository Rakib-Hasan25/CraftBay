
import 'package:flutter/material.dart';

import '../utlis/color_palette.dart';
class ColorPicker extends StatefulWidget {
  ColorPicker({super.key,required this.onSelected,required this.initialSelected,required this.colors});
  List<String>colors;
  final Function(int selectIndex) onSelected;
  final int initialSelected;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  int  _selectedIColorndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    _selectedIColorndex = widget.initialSelected;
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    return  ListView.separated(
      itemCount: widget.colors.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            _selectedIColorndex = index;
            widget.onSelected(index);
            if (mounted) {
              setState(() {});
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                border:Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
                color: _selectedIColorndex == index ? ColorPalette.primaryColor: null
            ),
            alignment: Alignment.center,
            child: Text(widget.colors[index]),
          )
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          width: 8,
        );
      },
    );
  }
}