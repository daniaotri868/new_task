import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:remy/core/config/theme/colors_app.dart';
import 'package:remy/core/config/theme/my_color_scheme.dart';
import 'package:remy/core/config/theme/typography.dart';
import 'package:remy/core/utils/extensions/build_context.dart';
import '../../../../core/config/theme/app_theme.dart';
import '../../../../core/utils/responsive_padding.dart';
import '../../../../core/utils/theme_state.dart';
import 'package:collection/collection.dart';

class AppDropDownMenu<T> extends StatefulWidget {
  const AppDropDownMenu({
    this.items = const [],
    this.onChange,
    this.onSaved,
    this.onTap,
    this.validator,
    this.hint,
    this.menuMaxHeight,
    this.icon,
    this.focusNode,
    Key? key,
    this.value,
    this.title,
    this.isRate = false,
    this.isBorder=false, this.hintStyle,
  }) : super(key: key);

  final ValueChanged? onChange;
  final FormFieldSetter? onSaved;
  final FormFieldValidator? validator;
  final VoidCallback? onTap;
  final List<T> items;
  final String? hint;
  final double? menuMaxHeight;
  final Widget? icon;
  final FocusNode? focusNode;
  final T? value;
  final String? title;
  final bool isRate;
   final bool? isBorder;
   final TextStyle? hintStyle;
  @override
  State<AppDropDownMenu> createState() => _AppDropDownMenuState();
}

class _AppDropDownMenuState<T> extends ThemeState<AppDropDownMenu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Directionality(
           textDirection: TextDirection.rtl,
          child: DropdownButtonFormField<T>(
            isExpanded: true,
            items:
                widget.items.mapIndexed((index, e) => DropdownMenuItem<T>(value: e, child: buildItem(index, e))).toList(),
            onChanged: widget.onChange,
            onTap: widget.onTap,
            onSaved: widget.onSaved,
            validator: widget.validator,
            menuMaxHeight: widget.menuMaxHeight,
            icon: Icon(Icons.keyboard_arrow_down_rounded),
            focusNode: widget.focusNode,
            value: widget.value,
            dropdownColor: colorScheme.borderTextField,
            isDense: false,
            hint: widget.hint != null
                ? Text(
                    widget.hint!,
                    textAlign: TextAlign.end,
                    style: widget.hintStyle??context.textTheme.bodyLarge?.copyWith(color: context.colorScheme.tertiary),
                  )
                : null,
            borderRadius: BorderRadius.circular(10).r,
            style: textTheme.bodyLarge?.copyWith(color: context.colorScheme.tertiary),
            decoration: InputDecoration(
              filled: true,
              fillColor:AppColors.fillTextField,
              border: OutlineInputBorder(
                borderSide:(widget.isBorder)!?BorderSide.none: BorderSide(color:Colors.white, width: 0.5),
                borderRadius: BorderRadius.circular(kbrBorderTextField),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: (widget.isBorder)!?BorderSide.none: BorderSide(color: Colors.white, width: 0.5),
                borderRadius: BorderRadius.circular(kbrBorderTextField),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:(widget.isBorder)!?BorderSide.none: BorderSide(color:  Colors.white, width: 0.5),
                borderRadius: BorderRadius.circular(kbrBorderTextField),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide:(widget.isBorder)!? BorderSide.none:BorderSide(color:   Colors.white, width: 0.5),
                borderRadius: BorderRadius.circular(kbrBorderTextField),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: (widget.isBorder)!? BorderSide.none:BorderSide(color:   Colors.white, width: 0.5),
                borderRadius: BorderRadius.circular(kbrBorderTextField),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide:(widget.isBorder)!? BorderSide.none: BorderSide(color:   Colors.white, width: 0.5),
                borderRadius: BorderRadius.circular(kbrBorderTextField),
              ),
              contentPadding: HWEdgeInsetsDirectional.only(start: 12, end: 12),
              // prefixIcon: Icon(Icons.keyboard_arrow_down_rounded,
              //     color: widget.items.isEmpty ? colorScheme.primary : colorScheme.primary),
            ),
          ),
        ),
      ],
    );
  }

  buildItem(int index, dynamic item) {
    final text = Row(children: [
      SizedBox(
          height: 20.h,
          child: Image.network("https://ofrlk.com/${item.image}")),
      3.horizontalSpace,
      Text(item.name),

    ],);

    if (widget.isRate) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text,
            ],
          ),
          // 12.verticalSpace,
          // if (index != widget.items.length - 1) const Divider(height: 0),
        ],
      );
    }
    return text;
  }
}
