import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_reminder/provider/tag_provider.dart';
import 'package:todo_reminder/ui/pages/pages.dart';
import 'package:todo_reminder/ui/widgets/Navigation_transion/custome_page_route.dart';
import '../../screens/screens.dart';
import 'bottomsheet2/text.dart';

class CustomListView extends StatefulWidget {
  const CustomListView({Key? key}) : super(key: key);

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

List tag = [];

class _CustomListViewState extends State<CustomListView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      //color: Colors.orange,
      width: size.width,
      height: 25.h,
      child: Center(child: Consumer<TagProvider>(
        builder: (context, value, child) {
          return ListView.builder(
              itemCount: value.tag.length + 1,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, index) {
                if (index != value.tag.length) {
                  return Padding(
                    padding: EdgeInsets.only(right: size.width * 0.0203),
                    child: Container(
                      height: 35.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(15.r)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          text(
                              txt: value.tag[index],
                              size: 13.sp,
                              clr: Colors.white,
                              fw: FontWeight.w500),
                          InkWell(
                            onTap: () {
                              value.remTag(index);
                            },
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: size.width * 0.0381,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              duration: const Duration(milliseconds: 700),
                              child: const Tags(),
                              type: PageTransitionType.fade,
                              isIos: true));
                    },
                    child: Container(
                      height: 35.h,
                      width: 70.w,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade600),
                          borderRadius: BorderRadius.circular(15.r)),
                      child: Center(
                        child: text(
                            txt: "Add tag",
                            size: 13.sp,
                            clr: Colors.black,
                            fw: FontWeight.w500),
                      ),
                    ),
                  );
                }
              });
        },
      )),
    );
  }
}
