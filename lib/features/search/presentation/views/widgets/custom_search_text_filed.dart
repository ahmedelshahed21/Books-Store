import 'package:flutter/material.dart';

class CustomSearchTextFiled extends StatelessWidget{
  const CustomSearchTextFiled({super.key, this.onChanged, required this.controller});
  final Function(String)? onChanged;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          hintText: 'Search',
          suffixIcon: const Opacity(
            opacity: 0.8,
            child: Icon(Icons.search,
              color: Colors.white,
            ),
          ),
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder()
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
            color: Colors.white
        )
    );
  }

}


