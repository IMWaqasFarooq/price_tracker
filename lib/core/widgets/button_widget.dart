import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final Color? bgColor, textColor, borderColor;
  final Widget? icon;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;

  const ButtonWidget({super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.bgColor,
    this.borderColor,
    this.icon,
    this.fontSize, this.padding,
    this.textColor
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.r,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: bgColor??Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(8.r),
            border:
            Border.all(
              color: borderColor??Colors.transparent,
            )
        ),
        child: InkWell(
          onTap: onPressed,
          child: Container(
            padding: padding?? EdgeInsets.symmetric(horizontal: 13.w,vertical: 8.h),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  if(icon != null)
                    Padding(
                      padding:  EdgeInsets.only(right: 5.w),
                      child: icon,
                    ),

                  Text(
                    text,
                    style: TextStyle(
                        fontFamily: 'DM Sans',
                        color: textColor??Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: fontSize??14.sp
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}