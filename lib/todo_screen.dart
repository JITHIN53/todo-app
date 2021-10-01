import 'package:flutter/material.dart';
import 'package:todoapp/task_description_screen.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  _onDeleteItemPressed(item) {
    taskList.removeAt(item);
    setState(() {});
  }

  final _workController = TextEditingController();
  final _categoryController = TextEditingController();

  List<TodoTask> taskList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AlertDialog(
                      title: const Center(
                        child: Text(
                          'Add To Do List',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.brown),
                        ),
                      ),
                      content: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Form(
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _workController,
                                cursorColor: Colors.brown,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'ADD WORK',
                                  labelStyle: TextStyle(color: Colors.brown),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: TextFormField(
                                  controller: _categoryController,
                                  cursorColor: Colors.brown,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Work Category',
                                    labelStyle: TextStyle(color: Colors.brown),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: Colors.brown),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            taskList.add(
                              TodoTask(_workController.text,
                                  _categoryController.text, false),
                            );
                            setState(() {});
                            Navigator.pop(context);
                            _workController.clear();
                            _categoryController.clear();
                            setState(() {});
                          },
                          child: const Text(
                            'Save',
                            style: TextStyle(color: Colors.brown),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
        elevation: 2,
        child: const Icon(
          Icons.add_circle_outline,
          color: Colors.brown,
        ),
      ),
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Todo List',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w800, color: Colors.brown),
          ),
        ),
        toolbarHeight: 100,
        elevation: 5,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(35),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(22),
        child: ListView.builder(
          itemCount: taskList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 4,
                color: Colors.grey[200],
                margin: const EdgeInsets.all(5),
                child: ListTile(
                  title: Text(
                    taskList[index].title,
                    style: const TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(taskList[index].description),
                  leading: Checkbox(
                    checkColor: Colors.brown,
                    value: taskList[index].isCheck,
                    onChanged: (bool? val) {
                      itemChange(val!, index);

                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DescriptionScreen(
                              title: taskList[index].title,
                              description: taskList[index].description,
                              isCheckked: taskList[index].isCheck,
                            ),
                      ),
                    );
                    // Get.to(DescriptionScreen());
                  },
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete_outline_sharp,
                      color: Colors.brown,
                    ),
                    onPressed: () {
                      _onDeleteItemPressed(index);
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }

  itemChange(bool val, int index) {
    setState(() {
      taskList[index].isCheck = val;
    });
  }
}

class TodoTask {
  final String title;
  final String description;
  bool isCheck;

  TodoTask(this.title,
      this.description,
      this.isCheck,);
}
// if (itemChange(val, index) == true) {
// DescriptionScreen(title: taskList[index].title,
// description: taskList[index].description,
// isCheckked:taskList[index].isCheck = true,);
// }else
// {
// DescriptionScreen(title: taskList[index].title,
// description: taskList[index].description,
// isCheckked:taskList[index].isCheck,);
// }

//void _onSelected(bool selected, String dataName) {
//   if (selected == true) {
//     setState(() {
//       checkValue.add(dataName);
//     });
//   } else {
//     setState(() {
//       checkValue.remove(dataName);
//     });
//   }
// }
// @override
// void initState() {
//   getWorkData();
// }
//
// String? work = '';
//
// String? category = '';
//
// void getWorkData() async {
//   final prefs = await SharedPreferences.getInstance();
//   work = prefs.getString('work')!;
//   category = prefs.getString('category');
//   print(prefs.getString('work'));
// }
// async {
// final prefs =
//     await SharedPreferences.getInstance();
// prefs.setString('work', _workController.text);
// prefs.setString(
// 'category', _categoryController.text);
//
// String myString = prefs.getString('work') ?? '';
// print(myString);
// },
