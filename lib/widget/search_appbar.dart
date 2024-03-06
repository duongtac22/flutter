import 'package:flutter/material.dart';

class CustomSearchAppbarContent extends StatelessWidget {
  final void Function()? onEditingComplete;
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;

  const CustomSearchAppbarContent(
      {this.onChanged, this.onEditingComplete, this.onSubmitted, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFF1C1C1C)),
          child: Center(
            child: ListTile(
              leading: const Icon(Icons.search),
              title: TextField(
                onChanged: onChanged,
                onEditingComplete: onEditingComplete,
                onSubmitted: onSubmitted,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFFBEBEBE),
                  height: 1,
                ),
                cursorColor: Colors.white,
                autofocus: true,
                autocorrect: false,
                textInputAction: TextInputAction.search,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
          ),
        ));
  }
}
