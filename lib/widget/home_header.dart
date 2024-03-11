import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
      child: SizedBox(
        height: size.height / 12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Find Your Movie',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 30,
                )),
            CircleAvatar(
              radius: size.height / 36,
              backgroundImage: const AssetImage('assets/images/profile.png'),
            )
          ],
        ),
      ),
    );
  }
}
