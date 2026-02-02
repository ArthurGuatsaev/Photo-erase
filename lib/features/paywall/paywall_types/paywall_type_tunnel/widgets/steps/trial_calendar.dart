// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:erasica/core/theme/app_theme.dart';
import 'package:erasica/features/widgets/wrapper/glass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/theme/text/texts.dart';

/// TODO 0. Вынос логики в cubit

class TrialCalendar extends StatelessWidget {
  const TrialCalendar({
    super.key,
    this.showWarning = false,
    this.showLastDayIcon = false,
    required this.background,
    required this.primary,
    required this.timelineColor,
    required this.weekDayColor,
    required this.activeDayColor,
    required this.dayColor,
    required this.warningDay,
  });

  final bool showWarning;
  final bool showLastDayIcon;
  final Gradient background;
  final Gradient primary;
  final Gradient warningDay;
  final Color timelineColor;
  final Color weekDayColor;
  final Color activeDayColor;
  final Color dayColor;

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final trialDays = List.generate(
      7,
      (index) => today.add(Duration(days: index)),
    );
    final lastDay = trialDays.last;

    final warningStartIndex = trialDays.length - 3;

    final firstDayOfWeekIndex = MaterialLocalizations.of(
      context,
    ).firstDayOfWeekIndex;

    final weekdayKeys = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'];
    final rotatedWeekdayKeys = [
      ...weekdayKeys.sublist(firstDayOfWeekIndex),
      ...weekdayKeys.sublist(0, firstDayOfWeekIndex),
    ];

    return GlassWrapper(
      borderRadius: 24.r,
      data: context.glass.box,
      child: Container(
        width: 312.w,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 18.h),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          gradient: background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.r),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: rotatedWeekdayKeys
                  .map(
                    (day) => SizedBox(
                      width: 40.w,
                      child: Text(
                        day.tr(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13.sp,
                          height: 1,
                          fontFamily: font(FontWeight.w500),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 12.h),
            _buildCalendarGrid(
              trialDays: trialDays,
              lastDay: lastDay,
              warningStartIndex: warningStartIndex,
              context: context,
              firstDayOfWeekIndex: firstDayOfWeekIndex,
              background: background,
              primary: primary,
              timelineColor: timelineColor,
              weekDayColor: weekDayColor,
              activeDayColor: activeDayColor,
              dayColor: dayColor,
              warningDay: warningDay,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarGrid({
    required List<DateTime> trialDays,
    required DateTime lastDay,
    required int warningStartIndex,
    required BuildContext context,
    required int firstDayOfWeekIndex,
    required Gradient background,
    required Gradient primary,
    required Gradient warningDay,
    required Color timelineColor,
    required Color weekDayColor,
    required Color activeDayColor,
    required Color dayColor,
  }) {
    final today = trialDays.first;
    final todayIndex = today.weekday % 7;
    final daysFromFirst = (todayIndex - firstDayOfWeekIndex + 7) % 7;

    final firstDayOfThisWeek = today.subtract(Duration(days: daysFromFirst));
    final startFirstDay = firstDayOfThisWeek.subtract(const Duration(days: 7));

    final displayDays = <DateTime>[];
    var currentDate = startFirstDay;

    for (int i = 0; i < 21; i++) {
      displayDays.add(currentDate);
      currentDate = currentDate.add(const Duration(days: 1));
    }

    int weekColumnIndex(DateTime date) {
      final idx = date.weekday % 7;
      return (idx - firstDayOfWeekIndex + 7) % 7;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (weekIndex) {
        final weekDays = displayDays.sublist(
          weekIndex * 7,
          (weekIndex + 1) * 7,
        );
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: weekDays.map((date) {
                final trialIndex = trialDays.indexWhere(
                  (d) =>
                      d.year == date.year &&
                      d.month == date.month &&
                      d.day == date.day,
                );
                final isTrialDay = trialIndex != -1;
                final isFirstDay = trialIndex == 0;
                final isLastDay = trialIndex == trialDays.length - 1;

                final isPreviousMonth = date.isBefore(trialDays.first);
                final isNextMonth = date.isAfter(trialDays.last);

                final isRangeStart = isTrialDay && isFirstDay;
                final isRangeEnd = isTrialDay && isLastDay;

                final displayIndex = displayDays.indexOf(date);

                final isWarningDayTrial =
                    showWarning &&
                    isTrialDay &&
                    trialIndex >= warningStartIndex;

                final isInContinuousRange =
                    isTrialDay &&
                    (!showWarning || trialIndex <= warningStartIndex);

                final nextDayIndex = displayIndex < displayDays.length - 1
                    ? trialDays.indexWhere(
                        (d) =>
                            d.year == displayDays[displayIndex + 1].year &&
                            d.month == displayDays[displayIndex + 1].month &&
                            d.day == displayDays[displayIndex + 1].day,
                      )
                    : -1;

                final isNextDayInRange = showWarning && nextDayIndex != -1
                    ? nextDayIndex <= warningStartIndex
                    : true;

                final hasNextTrialDay =
                    displayIndex < displayDays.length - 1 &&
                    trialDays.any(
                      (d) =>
                          d.year == displayDays[displayIndex + 1].year &&
                          d.month == displayDays[displayIndex + 1].month &&
                          d.day == displayDays[displayIndex + 1].day,
                    ) &&
                    isNextDayInRange;

                final prevDayIndex = displayIndex > 0
                    ? trialDays.indexWhere(
                        (d) =>
                            d.year == displayDays[displayIndex - 1].year &&
                            d.month == displayDays[displayIndex - 1].month &&
                            d.day == displayDays[displayIndex - 1].day,
                      )
                    : -1;

                final isPrevDayInRange = showWarning && prevDayIndex != -1
                    ? prevDayIndex <= warningStartIndex
                    : true;

                final hasPrevTrialDay =
                    displayIndex > 0 &&
                    trialDays.any(
                      (d) =>
                          d.year == displayDays[displayIndex - 1].year &&
                          d.month == displayDays[displayIndex - 1].month &&
                          d.day == displayDays[displayIndex - 1].day,
                    ) &&
                    isPrevDayInRange;

                final columnIndex = weekColumnIndex(date);

                return SizedBox(
                  width: 40.2.w,
                  height: 37.h,
                  child: Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      if (isInContinuousRange)
                        Positioned(
                          left: hasPrevTrialDay ? -.75.w : 0,
                          right: hasNextTrialDay ? -.75.w : 0,
                          top: 0,
                          bottom: 0,
                          child: Container(
                            width:
                                40.w +
                                (hasPrevTrialDay ? 4.w : 0) +
                                (hasNextTrialDay ? 4.w : 0),
                            decoration: BoxDecoration(
                              color: timelineColor,
                              borderRadius: BorderRadius.horizontal(
                                left:
                                    isRangeStart ||
                                        !hasPrevTrialDay ||
                                        columnIndex == 0
                                    ? Radius.circular(1000.r)
                                    : Radius.zero,
                                right:
                                    isRangeEnd ||
                                        !hasNextTrialDay ||
                                        columnIndex == 6 ||
                                        (showWarning &&
                                            isTrialDay &&
                                            trialIndex == warningStartIndex)
                                    ? Radius.circular(1000.r)
                                    : Radius.zero,
                              ),
                            ),
                          ),
                        ),
                      if (isRangeStart)
                        Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            gradient: !showWarning && !showLastDayIcon
                                ? primary
                                : primary.withOpacity(0.3),
                            shape: BoxShape.circle,
                          ),
                        ),
                      if (isRangeEnd)
                        Container(
                          width: 40.w,
                          height: 40.h,

                          decoration: BoxDecoration(
                            gradient: !showWarning && !showLastDayIcon
                                ? primary
                                : null,
                            color: !showWarning && !showLastDayIcon
                                ? null
                                : timelineColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      if (isWarningDayTrial)
                        Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            gradient: warningDay,
                            shape: BoxShape.circle,
                          ),
                        ),
                      Text(
                        '${date.day}',
                        style: TextStyle(
                          color: isPreviousMonth || isNextMonth
                              ? dayColor
                              : isTrialDay
                              ? activeDayColor
                              : dayColor,
                          fontSize: 16.sp,
                          height: 1,
                          fontFamily: font(FontWeight.w600),
                        ),
                      ),
                      if (isTrialDay && isLastDay && showLastDayIcon)
                        Positioned(
                          top: 0,
                          right: 0,
                          bottom: 0,
                          left: 0,
                          child: Container(
                            width: 16.w,
                            height: 16.h,
                            decoration: BoxDecoration(
                              gradient: primary,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              CupertinoIcons.hourglass_bottomhalf_fill,
                              size: 21.w,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              }).toList(),
            ),
            if (weekIndex < 2) SizedBox(height: 8.h),
          ],
        );
      }),
    );
  }
}
