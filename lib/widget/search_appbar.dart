import 'package:flutter/material.dart';

class CustomSearchAppbarContent extends StatelessWidget {
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;

  const CustomSearchAppbarContent(
      {this.onChanged, this.onSubmitted, super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Container(
          height: size.height / 12,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFF1C1C1C)),
          // child: Center(
          //   child: ListTile(
          //     leading: const Icon(Icons.search),
          //     title: TextField(
          //       onChanged: onChanged,
          //       onSubmitted: onSubmitted,
          //       style: const TextStyle(
          //         fontSize: 14,
          //         color: Color(0xFFBEBEBE),
          //         height: 1.2,
          //       ),
          //       cursorColor: Colors.white,
          //       autofocus: false,
          //       autocorrect: false,
          //       // textInputAction: TextInputAction.search,
          //       decoration: const InputDecoration(
          //         border: InputBorder.none,
          //         focusedBorder: InputBorder.none,
          //         enabledBorder: InputBorder.none,
          //         errorBorder: InputBorder.none,
          //         disabledBorder: InputBorder.none,
          //       ),
          //     ),
          //   ),
          // ),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16, right: 8),
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: TextField(
                  onChanged: onChanged,
                  onSubmitted: onSubmitted,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFFBEBEBE),
                    height: 1.2,
                  ),
                  cursorColor: Colors.white,
                  autofocus: false,
                  autocorrect: false,
                  // textInputAction: TextInputAction.search,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: 'Search Movie',
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
