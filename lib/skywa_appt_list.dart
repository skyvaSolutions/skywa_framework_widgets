import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:skywa_framework_widgets/services/is_string_invalid.dart';

import 'skywa_text.dart';

class SkywaAppointmentList extends StatelessWidget {
  final int itemCount;
  final String month;
  final String date;
  final String day;
  final List<IconSlideAction>? secondaryActions;
  final String? startTime;
  final String? endTime;
  final String? completedTime;
  final String userName;
  final String? providerName;
  final String? serviceName;

  const SkywaAppointmentList({
    Key? key,
    required this.itemCount,
    required this.month,
    required this.date,
    required this.day,
    this.secondaryActions,
    this.startTime,
    this.endTime,
    this.completedTime,
    required this.userName,
    this.providerName,
    this.serviceName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            /// month, date, day
            Container(
              height: 80.0,
              color: Colors.grey.shade300,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    radius: 30.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          /// month
                          Flexible(
                            child: SkywaText(
                              text: month,
                              fontSize: 13.0,
                              color: Colors.black,
                            ),
                          ),

                          /// date
                          Flexible(
                            child: SkywaText(
                              text: date,
                              fontSize: 22.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 25.0),
                  SkywaText(text: day, fontWeight: FontWeight.w700),
                ],
              ),
            ),

            /// appointment list
            Column(
              children: [
                Slidable(
                  closeOnScroll: true,
                  direction: Axis.horizontal,
                  actionPane: SlidableStrechActionPane(),
                  actionExtentRatio: 0.20,
                  secondaryActions: secondaryActions,
                  child: Container(
                    height: 75.0,
                    child: Row(
                      children: [
                        /// time slot
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (!isStringInvalid(text: startTime!))
                                  SkywaText(
                                    text: startTime!,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                SizedBox(height: 5.0),

                                /// if completedTime null, but endTime not null show endTime
                                if (isStringInvalid(text: completedTime!) &&
                                    !isStringInvalid(text: endTime!))
                                  SkywaText(
                                    text: endTime!,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),

                                /// if completedTime not null show completedTime, no need to check endTime
                                if (!isStringInvalid(text: completedTime!))
                                  SkywaText(
                                    text: completedTime!,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                              ],
                            ),
                          ),
                        ),

                        /// title & description
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.3),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// user name
                                SkywaText(
                                  text: userName,
                                  fontWeight: FontWeight.w700,
                                ),
                                SizedBox(height: 5.0),

                                /// provider :: service
                                if (!isStringInvalid(
                                        text: providerName ?? '') &&
                                    !isStringInvalid(text: serviceName ?? ''))
                                  SkywaText(
                                    text:
                                        "${providerName ?? ''} : : ${serviceName ?? ''} ",
                                    fontSize: 15.0,
                                  )
                                else if (!isStringInvalid(
                                    text: providerName ?? ''))
                                  SkywaText(
                                    text: providerName!,
                                    fontSize: 15.0,
                                  )
                                else if (!isStringInvalid(
                                    text: serviceName ?? ''))
                                  SkywaText(
                                    text: serviceName!,
                                    fontSize: 15.0,
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
