import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sunray_news/app/core/extensions/theme_extensions.dart';
import 'package:tabler_icons/tabler_icons.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: context.theme.colorScheme.background,
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: TextFormField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      TablerIcons.search,
                      size: 19,
                      color: Colors.grey,
                    ),
                    border: InputBorder.none,
                    hintText: "Search",
                    hintStyle: context.bodyMedium
                        .copyWith(fontSize: 19, color: Colors.grey)),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Text(
                "Cancel",
                style: context.bodyMedium,
              )),
        ],
      ),
    );
  }
}
