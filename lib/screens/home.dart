import 'package:cut_guider/models/file.dart';
// import 'package:cut_guider/screens/profile.dart';
import 'package:cut_guider/screens/project.dart';
import 'package:cut_guider/screens/sidemenu.dart';
import 'package:cut_guider/widgets/filegridview.dart';
import 'package:cut_guider/widgets/filelistview.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedViewIndex = 1;

  void _selectActiveView(int index) {
    setState(() {
      _selectedViewIndex = index;
    });
  }

  final List<File> _registeredProject = [
    File(
        color: Colors.blue,
        fileName: "Project1",
       
        description: 'this is my first project.'),
    File(
        color: Colors.green,
        fileName: "Project2",
   
        description: 'this is my second project.'),
    File(
        color: Colors.yellow,
        fileName: "Project3",
     
        description: 'this is my third project.'),
    File(
        color: Colors.red,
        fileName: "Project4",
  
        description: 'this is my fourth project.'),
  ];

  void _addProject(File file) {
    setState(() {
      _registeredProject.add(file);
    });
  }

  
void _removeProject(File file) {
    final projectIndex = _registeredProject.indexOf(file);
    setState(() {
      _registeredProject.remove(file);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Peoject deleted.'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'undo',
          onPressed: () {
            setState(() {
              _registeredProject.insert(
                projectIndex,
                file,
              );
            });
          },
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    Widget activeView = Expanded(
      child: GridView(
        padding: const EdgeInsetsDirectional.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final file in _registeredProject) FileGridView(file: file, onRemoveProject: _removeProject,),
        ],
      ),
    );
    if (_selectedViewIndex == 0) {
      activeView = Expanded(
        child: ListView.builder(
            itemCount: _registeredProject.length,
            itemBuilder: (context, index) {
              for (final file in _registeredProject) {
                return FileListView(file: file);
              }
              return null;
            }),
      );
    }
    return Scaffold(
      drawer: SideMenuPage(),
      appBar: AppBar(
        title: const Text(
          'Your CutGuider',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProjectScreen(
                          onAddProject: _addProject,
                        )),
              );
              // Handle sign in button press
            },
            icon: const Icon(Icons.add_box),
          ),
          // "..." button at top-right
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            SearchBar(
              onTap: () {},
              leading: const Icon(Icons.search),
              hintText: 'Search Project',
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                const Text('Recent'),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    _selectActiveView(1);
                  },
                  icon: const Icon(
                    Icons.grid_on,
                    color: Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _selectActiveView(0);
                  },
                  icon: const Icon(
                    Icons.list,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            activeView,
          ],
        ),
      ),
    );
  }
}
