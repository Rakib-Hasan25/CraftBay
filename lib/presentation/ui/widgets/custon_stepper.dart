import 'package:ecommerce/presentation/ui/utlis/color_palette.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomStepper extends StatefulWidget {
  CustomStepper(
      {super.key,
      required this.lowerLimit,
      required this.upperLimit,
      required this.stepValue,
      required this.value,
      required this.onChange});

  final int lowerLimit;
  final int upperLimit;
  final int stepValue;
  int value;
  final Function(int) onChange;

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: ColorPalette.primaryColor,
                  borderRadius: BorderRadius.circular(2)
                ),
                child: const Icon(
                  Icons.remove,
                  color: Colors.white,
                  size: 18,
                ),
              ),
              onTap: () {
                widget.value = widget.value == widget.lowerLimit
                    ? widget.lowerLimit
                    : widget.value -= widget.stepValue;
                widget.onChange(widget.value);
                setState(() {});
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '${widget.value}',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),




            InkWell(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: ColorPalette.primaryColor,
                    borderRadius: BorderRadius.circular(2)
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 18,
                ),
              ),
              onTap: () {
                widget.value = widget.value == widget.upperLimit
                    ? widget.upperLimit
                    : widget.value += widget.stepValue;
                widget.onChange(widget.value);
                setState(() {});
              },
            ),

          ],
        ),
      ),
    );
  }
}
