import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nikah_forever_ui/app/app_widgets/app_text_style.dart';
import 'package:nikah_forever_ui/app/app_widgets/custom_text_form_field.dart';
import 'package:nikah_forever_ui/app/constants/app_strings.dart';

import '../constants/app_colors.dart';

class CommonPopUp {
  static String containCategory = "";

  static void showBottomSheetCustom({
    BuildContext? context,
    required Widget widget,
    bool removeTopRounder = false,
    double? height,
  }) {
    showModalBottomSheet(
      context: context!,
      backgroundColor: AppColors.white,
      isScrollControlled: true,
      isDismissible: true,
      builder: (context) {
        return AnimatedPadding(
          padding: MediaQuery.of(context).viewInsets,
          duration: const Duration(milliseconds: 100),
          child: Container(
            height: height,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (!removeTopRounder)
                  Container(
                    width: 60,
                    height: 7,
                    decoration: BoxDecoration(
                      color: AppColors.greyLight,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                widget
              ],
            ),
          ),
        );
      },
    );
  }

  static void showBottomSheetList({
    BuildContext? context,
    required List<String> list,
    required String title,
    required String selectedValue,
    bool removeSearchBox = false,
    double? height,
    required Function(String) onTap,
  }) {
    TextEditingController controller = TextEditingController();

    List<String> searchedList = [];
    searchedList.addAll(list);
    containCategory = "";

    showModalBottomSheet(
      context: context!,
      backgroundColor: AppColors.white,
      isScrollControlled: true,
      isDismissible: true,
      builder: (context) {
        return AnimatedPadding(
          padding: MediaQuery.of(context).viewInsets,
          duration: const Duration(milliseconds: 100),
          child: Container(
            height: height ?? Get.height * 0.55,
            decoration: BoxDecoration(
              color: AppColors.mainBackground,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
            ),
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                containCategory = "";

                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Container(
                        height: 6,
                        width: 90,
                        margin: const EdgeInsets.only(top: 15, bottom: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.greyLight,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        title,
                        style: AppTextStyle.bold(fontSize: 18),
                      ),
                    ),
                    (!removeSearchBox)
                        ? Padding(
                            padding: const EdgeInsets.fromLTRB(25, 15, 25, 0),
                            child: CustomTextFormField(
                              controller: controller,
                              labelText: "Search",
                              prefixIcon: Icon(
                                Icons.search,
                                color: AppColors.greyLight,
                                size: 25,
                              ),
                              onChanged: (value) {
                                searchedList = [];
                                searchedList.addAll(list
                                    .where((item) => item
                                        .toLowerCase()
                                        .replaceAll(".", "")
                                        .contains(value
                                            .toLowerCase()
                                            .replaceAll(".", "")
                                            .trim()))
                                    .toList());
                                setState(() {});
                                return value;
                              },
                              validator: (value) {
                                return null;
                              },
                            ),
                          )
                        : const SizedBox(
                            height: 15,
                          ),
                    Expanded(
                      child: ListView(
                        children: [
                          for (int index = 0;
                              index < searchedList.length;
                              index++)
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (searchedList[index]
                                        .contains(AppStrings.split) &&
                                    !containCategory.contains(
                                        searchedList[index]
                                            .split(AppStrings.split)[0]))
                                  getCategoryText(searchedList[index]
                                      .split(AppStrings.split)[0]),
                                InkWell(
                                  onTap: () {
                                    onTap(getSplitValue(searchedList[index]));
                                    Get.back();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        25, 8, 25, 15),
                                    child: Row(
                                      children: [
                                        Icon(
                                          selectedValue ==
                                                  getSplitValue(
                                                      searchedList[index])
                                              ? Icons.check_circle
                                              : Icons.circle_outlined,
                                          size: 25,
                                          color: selectedValue ==
                                                  getSplitValue(
                                                      searchedList[index])
                                              ? AppColors.pink
                                              : AppColors.blackLight,
                                        ),
                                        const SizedBox(
                                          width: 25,
                                        ),
                                        Text(
                                          getSplitValue(searchedList[index]),
                                          style: AppTextStyle.regular(
                                              fontSize: 17),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  static getSplitValue(value) {
    return value.contains(AppStrings.split)
        ? value.split(AppStrings.split)[1]
        : value;
  }

  static Widget getCategoryText(String value) {
    containCategory += value;
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, bottom: 7),
      child: Text(
        value,
        style: AppTextStyle.bold(fontSize: 17),
      ),
    );
  }
}
