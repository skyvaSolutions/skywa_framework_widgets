import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skywa_framework_widgets/skywa_appbar.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:skywa_framework_widgets/skywa_appt_list.dart';
import 'package:skywa_framework_widgets/skywa_text.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SampleAppointmentListScreen extends StatefulWidget {
  const SampleAppointmentListScreen({Key? key}) : super(key: key);

  @override
  _SkywaAppointmentListScreenState createState() =>
      _SkywaAppointmentListScreenState();
}

class _SkywaAppointmentListScreenState
    extends State<SampleAppointmentListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: SkywaAppBar(appbarText: 'Sample Appointment List'),
      ),
      body: Container(
        height: Device.screenHeight,
        width: Device.screenWidth,
        /*child: ListView.builder(
          itemCount: 7,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
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
                                  text: 'Jun',
                                  fontSize: 13.0,
                                  color: Colors.black,
                                ),
                              ),

                              /// date
                              Flexible(
                                child: SkywaText(
                                  text: '14',
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
                      SkywaText(text: 'Day', fontWeight: FontWeight.w700),
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
                      secondaryActions: [
                        IconSlideAction(
                          caption: 'Delete',
                          color: Colors.redAccent,
                          icon: Icons.delete_rounded,
                        ),
                      ],
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SkywaText(text: 'from time'),
                                    SizedBox(height: 5.0),
                                    SkywaText(text: 'end time'),
                                  ],
                                ),
                              ),
                            ),

                            /// title & description
                            Expanded(
                              flex: 3,
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.3),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    /// user name
                                    SkywaText(
                                      text: 'Consumer name',
                                      fontWeight: FontWeight.w700,
                                    ),
                                    SizedBox(height: 5.0),

                                    /// provider :: service
                                    SkywaText(
                                      text: 'Provider Name : : Service Name',
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
                    Container(
                      height: 75.0,
                      color: Colors.orangeAccent,
                      // margin: EdgeInsets.symmetric(horizontal: 20.0),
                    ),
                    Container(
                      height: 75.0,
                      color: Colors.purpleAccent,
                      // margin: EdgeInsets.symmetric(horizontal: 20.0),
                    ),
                  ],
                ),
              ],
            );
          },
        ),*/
        child: SkywaAppointmentList(
          itemCount: 7,
          month: 'Jun',
          date: '14',
          day: 'Sunday',
          userName: 'Padmanabha Das',
          startTime: '02:00 PM',
          endTime: '03:00 PM',
          completedTime: '02:30 PM',
          providerName: 'PDas',
          serviceName: 'Accupressure',
        ),
      ),
    );
  }
}
