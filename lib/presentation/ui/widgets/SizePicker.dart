
import 'package:flutter/material.dart';

import '../utlis/color_palette.dart';



class SizePicker extends StatefulWidget {
  const SizePicker({super.key,required this.sizes,required this.onSelected, required this.initialSelected});
  final List<String>sizes;
  final Function(int selectIndex) onSelected;
  final int initialSelected;
  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  int _selectedSizeIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    _selectedSizeIndex = widget.initialSelected;
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.sizes.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              _selectedSizeIndex= index;
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
                  color: _selectedSizeIndex == index ? ColorPalette.primaryColor: null
              ),
              alignment: Alignment.center,
              child: Text(widget.sizes[index]),
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