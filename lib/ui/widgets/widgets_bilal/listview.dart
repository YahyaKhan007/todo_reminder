import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:todo_reminder/ui/pages/pages.dart';
import 'package:todo_reminder/ui/widgets/Navigation_transion/custome_page_route.dart';
import 'bottomsheet2/text.dart';

class CustomListView extends StatefulWidget {
  const CustomListView({Key? key}) : super(key: key);

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

List tag = [
  "Priority",
];

class _CustomListViewState extends State<CustomListView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      //color: Colors.orange,
      width: size.width,
      height: size.height * 0.0381,
      child: ListView.builder(
          itemCount: tag.length + 1,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, index) {
            if (index != tag.length) {
              return Padding(
                padding: EdgeInsets.only(right: size.width * 0.0203),
                child: Chip(
                  label: text(
                      txt: tag[index],
                      size: size.height * 0.0179,
                      clr: Colors.white,
                      fw: FontWeight.w500),
                  backgroundColor: Colors.yellow,
                  onDeleted: () {},
                  deleteIcon: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: size.width * 0.0381,
                  ),
                ),
              );
            } else {
              return InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(CustomePageRoute(child: const Tags()));
                },
                child: SizedBox(
                  height: 30,
                  child: DottedBorder(
                    dashPattern: const [3, 3],
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(30),
                    strokeWidth: 1,
                    child: Chip(
                      backgroundColor: Colors.white,
                      label: Center(
                        child: text(
                            txt: "Add Tag",
                            size: size.width * 0.0381,
                            clr: Colors.grey.shade400,
                            fw: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              );
            }
          }),
    );
  }
}
