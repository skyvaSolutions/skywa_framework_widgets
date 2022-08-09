import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:skywa_framework_widgets/skywa_alert_dialog.dart';

import 'skywa_elevated_button.dart';
import 'skywa_text_button.dart';

class SkywaFilter {
  final BuildContext context;
  // final List<String> availableItems;
  // final List<String> filterItems;
  final Widget buildFilterItems;
  final Function() clearFilter;
  final Function() applyFilter;

  SkywaFilter({
    required this.context,
    // required this.availableItems,
    // required this.filterItems,
    required this.buildFilterItems,
    required this.clearFilter,
    required this.applyFilter,
  }) {
    showFilterAlertDialog();
  }

  void showFilterAlertDialog() {
    SkywaAlertDialog.success(
      context: context,
      content: StatefulBuilder(builder: (context, dialogSetState) {
        return Container(
          width: Device.screenWidth,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// filter items
              Container(
                constraints: BoxConstraints(
                  maxHeight: Device.screenHeight * 0.60,
                ),
                child: buildFilterItems,
              ),
              const SizedBox(height: 15.0),

              /// clear filters
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SkywaElevatedButton.delete(
                    context: context,
                    text: 'Clear Filters',
                    onTap: clearFilter,
                  ),
                ],
              ),
              const SizedBox(height: 10.0),

              /// actions
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  /// cancel
                  SkywaTextButton(
                    text: 'Cancel',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 5.0),

                  /// apply filters
                  SkywaElevatedButton.save(
                    context: context,
                    text: 'Apply Filters',
                    onTap: applyFilter,
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
