import 'package:flutter/material.dart';
import 'package:onlaw/core/utils/colors.dart';

class DropDownPrincipal extends StatelessWidget {
  const DropDownPrincipal({
    Key? key,
    required this.value,
    required this.items,
    required this.icon,
    required this.onChanged,
  }) : super(key: key);

  final String? value;
  final List<String> items;
  final Icon icon;
  final Function(dynamic value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: const BorderRadius.all(Radius.circular(6.0)),
        border: Border.all(
          color: MyColors.mainColorOrange,
          width: 1,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButtonFormField(
            value: value,
            isExpanded: true,
            decoration: InputDecoration(
                // hintText: '   $hint',
                contentPadding: const EdgeInsets.only(top: 10, right: 10),
                hintStyle: const TextStyle(color: Colors.white70),
                border: InputBorder.none,
                icon: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: icon,
                )),
            icon: Container(
              margin: const EdgeInsets.only(top: 0, left: 10),
              child: const Icon(Icons.keyboard_arrow_down),
            ),
            dropdownColor: MyColors.blackSecundario,
            style: const TextStyle(
              color: Colors.white70,
            ),
            items: items
                .map((doc) => DropdownMenuItem(
                      value: doc,
                      child: Text(doc,
                          textAlign: TextAlign.start,
                          style: const TextStyle(color: Colors.white70)),
                    ))
                .toList(),
            onChanged: (value) => onChanged(value),
          ),
        ),
      ),
    );
  }
}
