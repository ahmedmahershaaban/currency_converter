import 'package:currency_converter/application/user_flow/user_flow_bloc.dart';
import 'package:currency_converter/application/user_flow/user_flow_event.dart';
import 'package:currency_converter/application/user_flow/user_flow_state.dart';
import 'package:currency_converter/domain/core/value_objects.dart';
import 'package:currency_converter/presentation/user_flow/home/components/switch_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyHistoryHeaderSection extends StatelessWidget {
  const CurrencyHistoryHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserFlowBloc, UserFlowState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...state.fromCountrySelected.fold(
              () => const [SizedBox()],
              (fromCountrySelected) => [
                fromCountrySelected.currencyFlagSvg.toSvgPictureWidget(15),
                5.horizontalSpace,
                Text(fromCountrySelected.currencyId.getOrCrash()),
              ],
            ),
            7.horizontalSpace,
            Expanded(
              child: SizedBox(
                height: 44.h,
                width: double.infinity,
                child: Stack(children: [
                  const Center(
                    child: Divider(
                      color: Color(0xFFE7E7EE),
                    ),
                  ),
                  Center(
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: Transform.scale(
                        scale: 0.8,
                        child: SwitchButton(
                          onPressed: () {
                            context.read<UserFlowBloc>().add(const UserFlowEvent.updateIsCurrencyFlippedEvent());
                          },
                          isFlipped: state.isCurrencyFlipped,
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            7.horizontalSpace,
            ...state.toCountrySelected.fold(
              () => const [SizedBox()],
              (toCountrySelected) => [
                toCountrySelected.currencyFlagSvg.toSvgPictureWidget(15),
                5.horizontalSpace,
                Text(toCountrySelected.currencyId.getOrCrash()),
              ],
            ),
            20.horizontalSpace,
            DropdownButton<int>(
                value: state.numberOfWeeksForHistory.toInt() - 1,

                /// The API has maximum rule for days to not exceed 365
                items: List.generate(
                    (365 / 7).floor(),
                    (index) => DropdownMenuItem<int>(
                          value: index,
                          child: Text('${index + 1} ${index == 0 ? 'Week' : 'Weeks'}'),
                        )),
                onChanged: (index) {
                  if (index != null) {
                    context.read<UserFlowBloc>().add(
                          UserFlowEvent.updateNumberOfWeeksForHistoryEvent(
                            number: ValidatedInt.fromNumber(index + 1),
                          ),
                        );
                  }
                }),
          ],
        );
      },
    );
  }
}
