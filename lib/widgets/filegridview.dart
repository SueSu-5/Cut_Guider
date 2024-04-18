import 'package:cut_guider/models/file.dart';
import 'package:cut_guider/screens/result.dart';
import 'package:flutter/material.dart';

DateTime currentDate = DateTime.now();

class FileGridView extends StatelessWidget {
  const FileGridView({required this.file, super.key,required this.onRemoveProject});

  final File file;
  final void Function(File file) onRemoveProject;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ResultPage(),
        ));
      },
      child: Dismissible(
        background: Container(
          color: Colors.grey,
          // margin: const EdgeInsets.symmetric(
          //   horizontal: 12
          // ),
        ),
        key: ValueKey(file),
        child: Container(
          //margin: EdgeInsets.symmetric(horizontal: 8.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: file.color.withOpacity(0.2), // Light background color
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.folder_copy_rounded,
                  size: 40.0, color: file.color), // Use the specified color
              const SizedBox(height: 8.0),
              Text(file.fileName,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: file.color,
                  )),
              //const SizedBox(height: 4.0),
              Text(
                '${currentDate.year}-${currentDate.month}-${currentDate.day}', //"Created: ${file.createDate}",
                style: TextStyle(
                  fontSize: 12.0,
                  color: file.color,
                ),
              ),
            ],
          ),
        ),
        onDismissed: (direction) => onRemoveProject(file),
      ),
    );
  }
}
