import 'package:flutter/material.dart';

import '../util/builder.dart';
import '../util/date_util.dart';

class HeatMapWeekText extends StatelessWidget {
  /// The margin value for correctly space between labels.
  final EdgeInsets? margin;

  /// The double value of label's font size.
  final double? fontSize;

  /// The double value of every block's size to fit the height.
  final double? size;

  /// The color value of every font's color.
  final Color? fontColor;

  final LocalizeWeekDayBuilder? weekDayBuilder;

  const HeatMapWeekText({
    Key? key,
    this.weekDayBuilder,
    this.margin,
    this.fontSize,
    this.size,
    this.fontColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        for (int i = 0; i < DateUtil.WEEK_LABEL.length; i++)
          Container(
            height: size ?? 20,
            margin: margin ?? const EdgeInsets.all(2.0),
            child: Text(
              i == 0
                  ? DateUtil.WEEK_LABEL[i]
                  : (weekDayBuilder != null
                      ? weekDayBuilder!(i)
                      : DateUtil.WEEK_LABEL[i]),
              style: TextStyle(
                fontSize: fontSize ?? 12,
                color: fontColor,
              ),
            ),
          ),
      ],
    );
  }
}
