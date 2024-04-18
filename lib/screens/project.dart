import 'package:cut_guider/models/file.dart';

import 'package:flutter/material.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key, required this.onAddProject});
  final void Function(File file) onAddProject;
  @override
  createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  List<Map<String, dynamic>> stockItems = [];
  List<Map<String, dynamic>> requiredItems = [];

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  Color fileColor = Colors.blue;

  void _submitProjectData() {
    widget.onAddProject(
      File(
        color: fileColor,
        fileName: _titleController.text,
      
        description: _descriptionController.text,
      ),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Project'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _titleController,
              maxLength: 30,
              decoration: const InputDecoration(
                labelText: 'Name',
                hintText: 'Enter project name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Project Description',
                hintText: 'Enter project description',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: Text('Kerf Thickness:'),
                ),
                SizedBox(width: 16.0),
                DropdownButton<String>(
                  value: 'Blue',
                  onChanged: (String? newValue) {
                    if (newValue == 'Red') {
                      fileColor = Colors.red;
                    }
                    if (newValue == 'Blue') {
                      fileColor = Colors.blue;
                    }
                    if (newValue == 'Green') {
                      fileColor = Colors.green;
                    }
                  },
                  items: <String>['Red', 'Blue', 'Green']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Stock',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: stockItems.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Item ${index + 1}:'),
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      labelText: 'Length',
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16.0),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      labelText: 'Quantity',
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      stockItems.removeAt(index);
                                    });
                                  },
                                  icon: Icon(Icons.delete),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          stockItems.add({});
                        });
                      },
                      child: Text('Add Item'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Required Parts',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: requiredItems.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Item ${index + 1}:'),
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      labelText: 'Length',
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16.0),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      labelText: 'Quantity',
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      requiredItems.removeAt(index);
                                    });
                                  },
                                  icon: Icon(Icons.delete),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          requiredItems.add({});
                        });
                      },
                      child: Text('Add Item'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _submitProjectData,
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => ResultPage(),
              // ));
              // Add functionality for Calculate button

              child: const Text('Calculate'),
            ),
          ],
        ),
      ),
    );
  }
}
