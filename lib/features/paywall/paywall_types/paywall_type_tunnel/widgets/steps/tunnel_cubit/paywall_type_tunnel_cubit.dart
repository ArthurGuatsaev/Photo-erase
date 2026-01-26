import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../../services/ui_message/ui_message_service.dart';
import '../../../../../../widgets/buttons/switch.dart';
import '../tunnel_toast_content.dart';

part 'paywall_type_tunnel_state.dart';

@injectable
class PaywallTypeTunnelCubit extends Cubit<PaywallTypeTunnelState> {
  PaywallTypeTunnelCubit(
    this._uiMessageService, {
    @factoryParam required bool onlyTimeline,
  }) : super(
         PaywallTypeTunnelState(
           currentPageIndex: onlyTimeline ? lastStepIndex : 0,
           onlyTimeline: onlyTimeline,
         ),
       );

  final UIMessageService _uiMessageService;

  static const int stepsCount = 4;
  static const int lastStepIndex = stepsCount - 1;

  void changeCurrentPage(int pageIndex) {
    emit(state.copyWith(currentPageIndex: pageIndex));
  }

  void _showTunnelToast(String message) async {
    // await Future.delayed(Duration(milliseconds: 300));
    // _uiMessageService.showToast(
    //   icon: CustomSwitch(value: true, onChanged: (_) {}),
    //   content: TunnelToastContent(text: message),
    // );
  }

  Future<void> next() async {
    if (state.currentPageIndex < lastStepIndex) {
      emit(state.copyWith(currentPageIndex: state.currentPageIndex + 1));
    }

    if (state.currentPageIndex == 1) {
      _showTunnelToast("paywall_tunnel_1_toast".tr());
    }

    if (state.currentPageIndex == 2) {
      _showTunnelToast("paywall_tunnel_2_toast".tr());
    }
  }
}
