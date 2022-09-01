import 'package:flutter/material.dart';
import 'package:todo_reminder/ui/widgets/widgets_bilal/bottomsheet2/Attachmentbottomsheet/AttachmntBox.dart';

class AttachmntSheet extends StatelessWidget {
  const AttachmntSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Attachmntbox(
            txt91: "Add photos / videos from gallery", iccon: Icons.photo),
        Attachmntbox(txt91: "Record video", iccon: Icons.video_camera_back),
        Attachmntbox(txt91: "Record audio", iccon: Icons.mic_rounded),
        Attachmntbox(txt91: "Browse...", iccon: Icons.more_horiz)
      ],
    );
  }
}
