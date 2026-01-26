import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/theme/app_theme.dart';
import 'trial_calendar.dart';
import 'tunnel_step_wrapper.dart';

class TunnelStep2 extends StatelessWidget {
  const TunnelStep2({super.key});

  @override
  Widget build(BuildContext context) {
    return TunnelStepWrapper(
      linesRotate: 5,
      icon: CupertinoIcons.bell_solid,
      child: Center(
        child: TrialCalendar(
          showWarning: true,
          showLastDayIcon: true,
          background: context.gradient.background,
          activeDayColor: Colors.white,
          timelineColor: Color.fromRGBO(250, 104, 24, 0.25),
          weekDayColor: Color.fromRGBO(255, 255, 255, 0.4),
          dayColor: Color.fromRGBO(255, 255, 255, 0.4),
          warningDay: context.gradient.continueBtn,
          primary: LinearGradient(
            colors: [
              Color.fromRGBO(255, 159, 64, 1),
              Color.fromRGBO(255, 90, 43, 1),
            ],
          ),
        ),
      ),
    );
  }
}
