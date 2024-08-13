import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SwitchButton extends StatelessWidget {
  final Function() onPressed;
  final bool isFlipped;
  const SwitchButton({
    super.key,
    required this.onPressed,
    required this.isFlipped,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.h,
      child: Stack(
        children: [
          Center(
            child: Divider(
              color: Color(0xFFE7E7EE),
            ),
          ),
          Center(
            child: IconButton(
              style: IconButton.styleFrom(
                backgroundColor: isFlipped ? const Color(0xFFEFEFEF) : const Color(0xFF26278D),
                foregroundColor: isFlipped ? const Color(0xFF26278D) : Colors.white,
              ),
              onPressed: onPressed,
              icon: SvgPicture.asset(
                'assets/svg/flip_arrow.svg',
                color: isFlipped ? const Color(0xFF26278D) : Colors.white,
                // colorFilter: ColorFilter.mode(svgColor, BlendMode.color),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
