import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:skywa_framework_widgets/skywa_appbar.dart';
import 'package:skywa_framework_widgets/skywa_checkbox_list_tile.dart';
import 'package:skywa_framework_widgets/skywa_filter.dart';
import 'package:skywa_framework_widgets/skywa_text.dart';

class SampleFilterScreen extends StatefulWidget {
  const SampleFilterScreen({Key? key}) : super(key: key);

  @override
  _SampleFilterScreenState createState() => _SampleFilterScreenState();
}

class _SampleFilterScreenState extends State<SampleFilterScreen> {
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

  List<Widget> brandCheckBoxes({required Function dialogSetState}) {
    List<Widget> brandCheckBoxes = [];
    for (String element in brandNames) {
      Widget brandCheckBox = SkywaCheckboxListTile(
        title: element,
        isSelected: selectedBrands.contains(element),
        onChanged: (value) {
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

  Widget buildBrandCheckBoxes() {
    return StatefulBuilder(builder: (context, dialogSetState) {
      return ListView(
        shrinkWrap: true,
        children: brandCheckBoxes(dialogSetState: dialogSetState),
      );
    });
  }

  Future<void> showItemFilterDialog() async {
    SkywaFilter(
      context: context,
      // availableItems: items,
      // filterItems: brandNames,
      buildFilterItems: buildBrandCheckBoxes(),
      clearFilter: clearFilter,
      applyFilter: applyFilter,
    );
  }

  Future<void> clearFilter() async {
    Navigator.pop(context);
    setState(() {
      filteredItems.clear();
      for (String item in items) {
        filteredItems.add(item);
      }
      selectedBrands = [brandNames.first];
    });
  }

  Future<void> applyFilter() async {
    Navigator.pop(context);
    if (!selectedBrands.contains(brandNames.first)) {
      setState(() {
        filteredItems.clear();
        for (String item in items) {
          for (String selectedBrand in selectedBrands) {
            if (item.contains(selectedBrand) && !filteredItems.contains(item)) {
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
