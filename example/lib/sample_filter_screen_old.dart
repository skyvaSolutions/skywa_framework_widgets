/*import 'package:flutter/material.dart';
import 'package:skywa_framework_widgets/skywa_alert_dialog.dart';
import 'package:skywa_framework_widgets/skywa_appbar.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:skywa_framework_widgets/skywa_checkbox_list_tile.dart';
import 'package:skywa_framework_widgets/skywa_elevated_button.dart';
import 'package:skywa_framework_widgets/skywa_radio_group.dart';
import 'package:skywa_framework_widgets/skywa_text.dart';
import 'package:skywa_framework_widgets/skywa_text_button.dart';

class SampleFilterScreenOld extends StatefulWidget {
  const SampleFilterScreenOld({Key? key}) : super(key: key);

  @override
  _SampleFilterScreenOldState createState() => _SampleFilterScreenOldState();
}

class _SampleFilterScreenOldState extends State<SampleFilterScreenOld> {
  List<String> items = [
    'Apple iPhone 12',
    'Apple iPhone 12 Pro Max',
    'Realme 8 Pro',
    'ASUS ROG Phone 5',
    'Samsung M32',
    'Apple iPhone 13',
    'Apple iPhone 13 Pro Max',
    'Redmi Note 9 Pro',
    'OnePlus 9 Pro',
    'OnePlus Nord 2',
    'Moto G40 Fusion',
  ];
  List<String> filteredItems = [];
  List<String> brandNames = [
    'All',
    'ASUS',
    'Apple',
    'Moto',
    'Samsung',
    'Redmi',
    'OnePlus',
  ];
  List<String> selectedBrands = [];

  List<Widget> buildBrandCheckBoxes({required Function dialogSetState}) {
    List<Widget> brandCheckBoxes = [];
    for (String element in brandNames) {
      Widget brandCheckBox = SkywaCheckboxListTile(
        title: element,
        isSelected: selectedBrands.contains(element),
        onChanged: (value) {
          print('$element -- $value');
          dialogSetState(() {
            if (!selectedBrands.contains(element)) {
              selectedBrands.add(element);
            } else {
              selectedBrands.remove(element);
            }
          });
        },
      );
      brandCheckBoxes.add(brandCheckBox);
    }
    return brandCheckBoxes;
  }

  Future<void> showItemFilterDialog() async {
    SkywaAlertDialog.success(
      context: context,
      content: StatefulBuilder(builder: (context, dialogSetState) {
        return Container(
          width: Device.screenWidth,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxHeight: Device.screenHeight * 0.60,
                ),
                child: ListView(
                  shrinkWrap: true,
                  children:
                      buildBrandCheckBoxes(dialogSetState: dialogSetState),
                ),
              ),
              const SizedBox(height: 15.0),

              /// clear filters
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SkywaElevatedButton.delete(
                    context: context,
                    text: 'Clear Filters',
                    onTap: () {
                      Navigator.pop(context);
                      setState(() {
                        filteredItems.clear();
                        for (String item in items) {
                          filteredItems.add(item);
                        }
                        selectedBrands = [brandNames.first];
                      });
                    },
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
                    onTap: () {
                      Navigator.pop(context);
                      if (!selectedBrands.contains(brandNames.first)) {
                        setState(() {
                          filteredItems.clear();
                          for (String item in items) {
                            for (String selectedBrand in selectedBrands) {
                              if (item.contains(selectedBrand) &&
                                  !filteredItems.contains(item)) {
                                filteredItems.add(item);
                              }
                            }
                          }
                        });
                      } else {
                        setState(() {
                          filteredItems.clear();
                          for (String item in items) {
                            filteredItems.add(item);
                          }
                          selectedBrands = [brandNames.first];
                        });
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (String item in items) {
      filteredItems.add(item);
    }
    selectedBrands = [brandNames.first];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: SkywaAppBar(
          appbarText: 'Sample Filters',
          actions: [
            IconButton(
              onPressed: () {
                showItemFilterDialog();
              },
              icon: const Icon(Icons.filter_list_alt),
            ),
          ],
        ),
      ),
      body: Container(
        height: Device.screenHeight,
        child: ListView.builder(
          itemCount: filteredItems.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: SkywaText(filteredItems[index], color: Colors.black),
            );
          },
        ),
      ),
    );
  }
}
*/
