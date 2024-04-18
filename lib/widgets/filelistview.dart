import 'package:cut_guider/models/file.dart';
import 'package:cut_guider/screens/result.dart';
import 'package:flutter/material.dart';

final currentDate = DateTime.now();

class FileListView extends StatelessWidget {
  const FileListView({required this.file, super.key});

  final File file;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ResultPage(),
          ));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ResultPage(),
                  ));
                },
                icon: Icon(
                  Icons.circle,
                  color: file.color,
                ),
              ),
              Text(
                file.fileName,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: file.color,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                      '${currentDate.year}-${currentDate.month}-${currentDate.day}',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: file.color,
                      )),
                  const Spacer(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
