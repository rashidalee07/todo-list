import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'constants.dart';

class HiveDBClass extends StatefulWidget {
  const HiveDBClass({super.key});

  @override
  State<HiveDBClass> createState() => _HiveDBClassState();
}

class _HiveDBClassState extends State<HiveDBClass> {
  @override
  void initState() {
    i = box.length;
    //length = box.length;
    if (box.isNotEmpty) {
      readData();
    }

    super.initState();
  }

  String data = 'Ali';
  List<String> writingNames = [];
  List<dynamic> readingNames = [];
  int i = 0;
  int j = 0;
  bool? checkBoxValue = false;
  final ScrollController scrollController = ScrollController();

  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Task List'),
        backgroundColor: Colors.grey[800],
        //   actions: [
        //     IconButton(
        //         onPressed: () {
        //           myDialogBox();
        //         },
        //         icon: const Icon(Icons.add)),
        //     // IconButton(
        //     //     onPressed: () {
        //     //       readData();
        //     //     },
        //     //     icon: const Icon(Icons.book))
        //   ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          //thumbVisibility: true,
          //trackVisibility: true,
         // controller: scrollController,
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
           //   controller: scrollController,
              shrinkWrap: true,
              itemCount: readingNames.length,
              itemBuilder: (context, index) {
                if (readingNames.isEmpty) {
                  return Container(
                    color: Colors.green,
                    height: 300,
                    width: 300,
                   // constraints: BoxConstraints(),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: checkBoxValue,
                      onChanged: (value) {
                        setState(() {
                          checkBoxValue = value;
                        });
                      },
                      activeColor: Colors.white,
                      checkColor: Colors.grey[800],
                      side: const BorderSide(color: Colors.white),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      tileColor: Colors.grey[800],
                      title: Text(
                        readingNames[index],
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      
                    ),
                  );
                }
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
          child: const Icon(Icons.add, color: Colors.black,),
          onPressed: () {
            myDialogBox();
          }),
    ));
  }

  writeData() {
    if (data.isEmpty) {
      return;
    } else {
      box.put(box.length, data);
      // readingNames.add(box.get(j));
      textController.clear();
      readData();
    }
  }

  readData() {
    if (readingNames.isEmpty) {
      for (j = 0; j < box.length; j++) {
        //print(readingNames[j]);

        readingNames.add(box.get(j));
      }
    } else {
      readingNames = [];
      for (j = 0; j < box.length; j++) {
        //print(readingNames[j]);

        readingNames.add(box.get(j));
      }
    }

    setState(() {});
  }

  Future myDialogBox() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.grey[800],
           // alignment: Alignment.bottomCenter,
            insetPadding: EdgeInsets.zero,
           
            title: const Text('Add item'),
            content: TextField(
              autofocus: true,
              controller: textController,
              decoration: const InputDecoration(
                hintText: 'Enter item name',
              ),
              onChanged: (value) {
                setState(() {
                  if (value.isEmpty) {
                    return;
                  } else {
                    data = value;
                  }
                });
              },
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    writeData();
                    add();
                  },
                  child: Text('Add', style: TextStyle(color: Colors.grey[400]),)),
            ],
          );
        });
  }

  void add() {
    Navigator.of(context).pop();
  }
}
