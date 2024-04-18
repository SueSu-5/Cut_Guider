import 'package:cut_guider/screens/home.dart';
import 'package:cut_guider/widgets/sector_diagram.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(
    home: ResultPage(),
  ));
}

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ));
          },
        ),
        title: Text('Sample Project'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      'Required Stocks',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                        height: 200,
                        width: 150,
                        child:
                            // Placeholder(),
                            SectorDiagram(
                          usedPercentage: 0.8,
                          unusedPercentage: 0.1,
                          wastePercentage: 0.1,
                        )
                        // Placeholder for the sector diagram
                        ),
                    SizedBox(height: 16.0),
                    Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Stock Length:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Total:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                //SizedBox(height: 16.0),

                //SizedBox(height: 16.0),
                Expanded(
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Global Statistics',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        children: [
                          CircleAvatar(
                            minRadius: 7,
                            backgroundColor: Colors.green,
                          ),
                          SizedBox(width: 8.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Kerf Thickness',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('0.3'),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.blue,
                            minRadius: 7,
                          ),
                          SizedBox(width: 8.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total parts length',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('540'),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.orange,
                            minRadius: 7,
                          ),
                          SizedBox(width: 8.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Used stocks',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('570'),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.purple,
                            minRadius: 7,
                          ),
                          SizedBox(width: 8.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total cutting layouts',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('4'),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.red,
                            minRadius: 7,
                          ),
                          SizedBox(width: 8.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total numbers of cuts',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('16'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 32.0),
            Text(
              'Cutting Layouts',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            SingleChildScrollView(
              child: Expanded(
                child: DataTable(
                  border: TableBorder.all(width: 0.5),
                  columnSpacing: Checkbox.width,
                  columns: const [
                    DataColumn(
                        label: Text(
                      'ID',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    )),
                    DataColumn(
                        label: Text(
                      'Repetition',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    )),
                    DataColumn(
                        label: Text(
                      'Stock Length',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    )),
                    DataColumn(
                        label: Text(
                      '# of cuts',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    )),
                  ],
                  rows: const [
                    DataRow(cells: [
                      DataCell(Text('1')),
                      DataCell(Text('2X')),
                      DataCell(Text('120')),
                      DataCell(Text('5')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('2')),
                      DataCell(Text('1X')),
                      DataCell(Text('240')),
                      DataCell(Text('8')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('1')),
                      DataCell(Text('2X')),
                      DataCell(Text('120')),
                      DataCell(Text('5')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('2')),
                      DataCell(Text('1X')),
                      DataCell(Text('240')),
                      DataCell(Text('8')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('1')),
                      DataCell(Text('2X')),
                      DataCell(Text('120')),
                      DataCell(Text('5')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('2')),
                      DataCell(Text('1X')),
                      DataCell(Text('240')),
                      DataCell(Text('8')),
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
