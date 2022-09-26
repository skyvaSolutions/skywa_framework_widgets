/*import 'package:flutter/material.dart';
import 'package:skywa_framework_widgets/models/skywa_checkbox_model.dart';
import 'package:skywa_framework_widgets/services/is_string_invalid.dart';
import 'package:skywa_framework_widgets/skywa_appbar.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:skywa_framework_widgets/skywa_dropdown_search.dart';
import 'package:skywa_framework_widgets/skywa_elevated_button.dart';
import 'package:skywa_framework_widgets/skywa_text.dart';

class SampleDropdownSearchScreen extends StatefulWidget {
  const SampleDropdownSearchScreen({Key? key}) : super(key: key);

  @override
  _SampleDropdownSearchScreenState createState() =>
      _SampleDropdownSearchScreenState();
}

class _SampleDropdownSearchScreenState
    extends State<SampleDropdownSearchScreen> {
  List<SkywaCheckBoxModel> checkBoxes = [
    SkywaCheckBoxModel(title: 'abcd', isSelected: true),
    SkywaCheckBoxModel(title: 'mnop', isSelected: false),
    SkywaCheckBoxModel(title: 'xyz', isSelected: false),
  ];
  List<SkywaCheckBoxModel>? searchedCheckboxList;
  TextEditingController controller = TextEditingController();
  SkywaCheckBoxModel? selectedCheckBox;

  List<Widget> buildSearchedList() {
    List<Widget> searchedList = [];
    for (SkywaCheckBoxModel checkBox in searchedCheckboxList!) {
      if (checkBox.title
          .toLowerCase()
          .contains(controller.text.toLowerCase())) {
        Widget searchedCheckbox = Card(
          margin: const EdgeInsets.only(
            left: 8.0,
            bottom: 10.0,
            right: 8.0,
            top: 4.0,
          ),
          child: Container(
            width: Device.screenWidth * 0.97 - 20.0,
            height: 85.0,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SkywaText(text: checkBox.title),
                SkywaText(text: checkBox.subtitle),
              ],
            ),
          ),
        );
        searchedList.add(searchedCheckbox);
      }
    }
    return searchedList;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchedCheckboxList = checkBoxes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: SkywaAppBar(appbarText: 'Sample Dropdown Search'),
      ),
      body: Container(
        height: Device.screenHeight,
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SkywaElevatedButton.save(
                context: context,
                text: 'Skywa Dropdown Search',
                onTap: () {
                  SkywaDropdownSearch(
                    context: context,
                    sheetTitle: 'Select Checkbox',
                    searchController: controller,
                    labelText: 'Checkboxes',
                    hintText: 'Select a checkbox',
                    padding: const EdgeInsets.all(15.0),
                    onChanged: (_selected) {
                      print(_selected);
                      searchedCheckboxList = checkBoxes
                          .where((checkBox) => checkBox.title
                              .toLowerCase()
                              .contains(checkBox.title.toLowerCase()))
                          .toList();
                      setState(() {});
                    },
                    itemsListView: ListView.builder(
                      shrinkWrap: true,
                      itemCount: searchedCheckboxList!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Card(
                            margin: const EdgeInsets.only(
                              left: 8.0,
                              bottom: 10.0,
                              right: 8.0,
                              top: 4.0,
                            ),
                            child: Container(
                              width: Device.screenWidth * 0.97 - 20.0,
                              height: 85.0,
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SkywaText(
                                      text: searchedCheckboxList![index].title),
                                  SkywaText(
                                      text: searchedCheckboxList![index]
                                          .subtitle),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
            ...buildSearchedList(),
          ],
        ),
      ),
    );
  }
}
*/