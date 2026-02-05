import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/theme/app_theme.dart';
import 'trial_calendar.dart';
import 'tunnel_step_wrapper.dart';

class TunnelStep1 extends StatelessWidget {
  const TunnelStep1({super.key});

  @override
  Widget build(BuildContext context) {
    return TunnelStepWrapper(
      linesRotate: 2,
      icon: CupertinoIcons.padlock_solid,
      child: Padding(
        padding: context.appWidget.data.pagePadding,
        child: Center(
          child: TrialCalendar(
            activeDayColor: Colors.white,
            timelineColor: const Color.fromRGBO(250, 104, 24, 0.25),
            weekDayColor: const Color.fromRGBO(255, 255, 255, 0.4),
            dayColor: const Color.fromRGBO(255, 255, 255, 0.15),
            warningDay: context.gradient.mainBtn,
            primary: const LinearGradient(
              colors: [
                Color.fromRGBO(255, 159, 64, 1),
                Color.fromRGBO(255, 90, 43, 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
