import 'package:datingapp/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({super.key, required this.placelist, this.onChanged});
  final List<String> placelist;
  final ValueChanged<String>? onChanged;
  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? dropdownValue; // Initial value is null

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffB0B0B0)),
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButton<String>(
          menuMaxHeight: height * .4,
          value: dropdownValue, // Can be null initially
          hint: const Text(
            'Select a location', // Placeholder text
            style: TextStyle(color: Colors.grey),
          ),
          onChanged: (String? value) {
            if (value != null) {
              setState(() {
                dropdownValue = value;
              });
              if (widget.onChanged != null) {
                widget.onChanged!(value); // Trigger the callback
              }
            }
          },
          underline: const SizedBox(),
          isExpanded: true,
          style: const TextStyle(color: Colors.black),
          dropdownColor: Colors.white,
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
          items: widget.placelist.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class SelectionDropDown extends StatefulWidget {
  final List<String> options; // List of dropdown options
  final String? hint; // Hint to display before selection
  final String? initialValue; // Initial value to display
  final ValueChanged<String>? onChanged; // Callback for value changes

  const SelectionDropDown({
    super.key,
    required this.options,
    this.hint,
    this.initialValue,
    this.onChanged,
  });

  @override
  State<SelectionDropDown> createState() => _SelectionDropDownState();
}

class _SelectionDropDownState extends State<SelectionDropDown> {
  String? dropdownValue;

  @override
  void initState() {
    super.initState();
    // Initialize dropdownValue with the initial value or null
    dropdownValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffB0B0B0)),
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButton<String>(
          menuMaxHeight: height * .4,
          value: dropdownValue,
          hint: widget.hint != null
              ? Text(
                  widget.hint!,
                  style: const TextStyle(color: Colors.grey),
                )
              : null, // Show hint if no value selected
          onChanged: (String? value) {
            if (value != null) {
              setState(() {
                dropdownValue = value;
              });
              if (widget.onChanged != null) {
                widget.onChanged!(value); // Trigger the callback
              }
            }
          },
          underline: const SizedBox(),
          isExpanded: true,
          style: const TextStyle(color: Colors.black),
          dropdownColor: Colors.white,
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
          items: widget.options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class CustomTextfeild extends StatefulWidget {
  const CustomTextfeild(
      {super.key,
      required this.hint,
      required this.controller,
      this.validator});

  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  @override
  State<CustomTextfeild> createState() => _CustomTextfeildState();
}

class _CustomTextfeildState extends State<CustomTextfeild> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: height * .06,
      //width: width * .9,
      child: TextFormField(
        cursorColor: blackcolor,
        controller: widget.controller,
        validator: widget.validator,
        decoration: InputDecoration(
          fillColor: whitecolor,
          filled: true,
          hintText: widget.hint,
          contentPadding: const EdgeInsets.only(left: 12, top: 8, bottom: 8),
          hintStyle: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
            fontFamily: 'Manrope',
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: Color(0xffB0B0B0), width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: Color(0xffB0B0B0), width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: red, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            // Border when there's an error and field is focused
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: red, width: 1),
          ),
        ),
        style: const TextStyle(
          fontSize: 13.0,
          fontFamily: 'Manrope',
          height: 1,
          fontWeight: FontWeight.w400,
          color: blackcolor,
        ),
        // maxLines: maxLines,
      ),
    );
  }
}

class ChatTextFeild extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final void Function(String)? onSubmitted;
  final bool isMultiline;
  final int? maxLines;

  const ChatTextFeild({
    super.key,
    required this.hint,
    required this.controller,
    this.onSubmitted,
    this.isMultiline = false,
    this.maxLines,
  });

  @override
  State<ChatTextFeild> createState() => _ChatTextFeildState();
}

class _ChatTextFeildState extends State<ChatTextFeild> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        focusNode: _focusNode,
        cursorColor: blackcolor,
        controller: widget.controller,
        maxLines: widget.isMultiline ? (widget.maxLines ?? 4) : 1,
        keyboardType:
            widget.isMultiline ? TextInputType.multiline : TextInputType.text,
        textInputAction: widget.onSubmitted != null
            ? TextInputAction.send
            : TextInputAction.done,
        onSubmitted: widget.onSubmitted,
        decoration: InputDecoration(
          fillColor: _isFocused ? Colors.white : transparent,
          filled: true,
          hintText: widget.hint,
          contentPadding: const EdgeInsets.only(left: 12, top: 8, bottom: 8),
          hintStyle: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
            fontFamily: 'Manrope',
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: transparent, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: transparent, width: 1),
          ),
        ),
        style: const TextStyle(
          fontSize: 13.0,
          fontFamily: 'Manrope',
          height: 1,
          fontWeight: FontWeight.w400,
          color: blackcolor,
        ),
      ),
    );
  }
}

class HalfTextfeild extends StatefulWidget {
  const HalfTextfeild(
      {super.key,
      required this.hint,
      required this.controller,
      this.validator});

  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  @override
  State<HalfTextfeild> createState() => _HalfTextfeildState();
}

class _HalfTextfeildState extends State<HalfTextfeild> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      //height: height * .06,
      width: width * .43,
      child: TextFormField(
        cursorColor: blackcolor,
        maxLength: 3,

        controller: widget.controller,
        validator: widget.validator,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          counterText: '',
          fillColor: whitecolor,
          filled: true,
          hintText: widget.hint,
          contentPadding: const EdgeInsets.only(left: 12, top: 8, bottom: 8),
          hintStyle: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
            fontFamily: 'Manrope',
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: Color(0xffB0B0B0), width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: Color(0xffB0B0B0), width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: red, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            // Border when there's an error and field is focused
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: red, width: 1),
          ),
        ),
        style: const TextStyle(
          fontSize: 13.0,
          fontFamily: 'Manrope',
          height: 1,
          fontWeight: FontWeight.w400,
          color: blackcolor,
        ),
        // maxLines: maxLines,
      ),
    );
  }
}

class BioTextfeild extends StatefulWidget {
  const BioTextfeild(
      {super.key,
      required this.hint,
      required this.controller,
      this.validator});

  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  @override
  State<BioTextfeild> createState() => _BioTextfeildState();
}

class _BioTextfeildState extends State<BioTextfeild> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: MediaQuery.of(context).size.height * .1,
      //width: width * .9,
      child: TextFormField(
        maxLines: 6,
        validator: widget.validator,
        cursorColor: blackcolor,
        controller: widget.controller,
        decoration: InputDecoration(
          fillColor: whitecolor,
          filled: true,
          hintText: widget.hint,
          contentPadding: const EdgeInsets.only(left: 12, top: 8, bottom: 8),
          hintStyle: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
            fontFamily: 'Manrope',
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: Color(0xffB0B0B0), width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: Color(0xffB0B0B0), width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: red, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            // Border when there's an error and field is focused
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: red, width: 1),
          ),
        ),

        style: const TextStyle(
          fontSize: 13.0,
          fontFamily: 'Manrope',
          height: 1,
          fontWeight: FontWeight.w400,
          color: blackcolor,
        ),
        // maxLines: maxLines,
      ),
    );
  }
}
