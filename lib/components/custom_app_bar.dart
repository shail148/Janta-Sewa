import 'package:flutter/material.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/text_widget.dart'; // Your custom colors file

class CustomTopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onLeftTap;
  final VoidCallback? onRightTap;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final String? title ;

  const CustomTopAppBar({
    super.key,
    this.onLeftTap,
    this.onRightTap,
    this.leftIcon,
    this.rightIcon,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      automaticallyImplyLeading: false,
      centerTitle: true,
      leading: leftIcon != null
          ? IconButton(
              onPressed: onLeftTap,
              icon: leftIcon!,
              color: AppColors.btnBgColor,
              iconSize: 24,
            )
          : null,
      actions: [
        if (rightIcon != null)
          IconButton(onPressed: onRightTap, icon: rightIcon!),
      ],
      elevation: 0,
      //backgroundColor: Colors.white,
      title: CustomTextWidget(
        text: title ??'JANTA SEWA',
        color: AppColors.textColor,
        fontWeight: FontWeight.w900,
        fontsize: 20,

        
      ),
    );
  }
  @override
//  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
    Size get preferredSize => const Size.fromHeight(48);

}
