import 'package:flutter/material.dart';

import '../themes/text_theme.dart';
import 'custom_text.dart';

class CustomDropdown extends StatefulWidget {
  final List<dynamic> values;
  final Function(dynamic value) update;
  final bool trigger;
  const CustomDropdown({
    super.key,
    required this.values,
    required this.update,
    required this.trigger,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  dynamic value;
  late bool _trigger;
  bool isOpen = false;

  @override
  void initState() {
    super.initState();
    _trigger = widget.trigger;
  }

  @override
  Widget build(BuildContext context) {
    if (_trigger != widget.trigger) {
      setState(() {
        isOpen = false;
        _trigger = widget.trigger;
      });
    }

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFDFDFDF),
        ),
        borderRadius: BorderRadius.circular(
          screenWidth / 390 * 6,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth / 390 * 10,
        vertical: screenHeight / 844 * 10,
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isOpen = !isOpen;
              });
            },
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: (value != null) ? '$value' : '',
                    style: AhtTextTheme.DropdownSelected,
                  ),
                  AnimatedRotation(
                    turns: (isOpen) ? 0.25 : 0.5,
                    duration: const Duration(milliseconds: 120),
                    child: const Icon(
                      Icons.play_arrow,
                      color: Color(0xFF8B8C8B),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isOpen)
            SizedBox(
              height: screenHeight / 844 * 19,
            ),
          if (isOpen)
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: widget.values.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  value = widget.values[index];
                  widget.update(value!);
                  isOpen = false;
                  setState(() {});
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth / 390 * 2,
                    vertical: screenHeight / 844 * 9,
                  ),
                  child: CustomText(
                    text: '${widget.values[index]}',
                    style: AhtTextTheme.DropdownElement,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
