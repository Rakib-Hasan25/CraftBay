
import 'package:flutter/material.dart';
class ColorPicker extends StatefulWidget {
  ColorPicker({super.key,required this.onSelected,required this.initialSelected,required this.colors});
  List<Color>colors;
  final Function(int selectIndex) onSelected;
  final int initialSelected;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  int  _selectedIColorndex=0;
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
          child: CircleAvatar(
            radius: 15,
            backgroundColor: widget.colors[index],
            child: _selectedIColorndex == index
                ? const Icon(
              Icons.done,
              color: Colors.white,
            )
                : null,
          ),
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