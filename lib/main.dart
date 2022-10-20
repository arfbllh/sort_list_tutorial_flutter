import 'package:flutter/material.dart';

class Pair {
  int value;
  String name;
  Pair(this.value, this.name);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Pair> myList = [
    Pair(3, 'Posiden'),
    Pair(4, 'Hades'),
    Pair(7, 'Zeus'),
    Pair(2, 'Hera'),
    Pair(1, 'Demeter'),
    Pair(6, 'Athena'),
    Pair(5, 'Ares'),
    Pair(17, 'Krabby'),
    Pair(11, 'Ajwad'),
    Pair(11, 'Patrick'),
    Pair(69, 'Tomayto'),
    Pair(43, 'Mr Bread'),
    Pair(13, 'Geralt'),
    Pair(17, 'Kittler'),
    Pair(5, 'Greninja'),
    Pair(1, 'Stealy'),
    Pair(67, 'JohnCena'),
    Pair(39, 'CabbageBabbage'),
    Pair(77, 'Obama'),
    Pair(12, 'Jigsaw'),
    Pair(23, 'Yay'),
    Pair(27, 'Sentinels'),
    Pair(16, 'Thor'),
    Pair(64, 'Spidermam'),
    Pair(4, 'Shohag'),
    Pair(25, 'YamCha'),
    Pair(39, 'MMR'),
    Pair(16, 'CleanMyTable'),
    Pair(7, 'Pixel'),
  ];

  //true : ascending, false: descending
  bool order = true;
  List<String> dropDown = [
    'By Value',
    'By Name',
  ];
  String curDropdownValue = 'By Value';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CSEDU',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('List Sorting Tutorial'),
          ),
          body: Center(
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  //Button For Changing sorting order

                  //Drop Down menu for selecting which value to sort by
                  DropdownButton<String>(
                    value: curDropdownValue,
                    items:
                        dropDown.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        curDropdownValue = value!;
                      });
                    },
                  ),
                  TextButton.icon(
                    icon: const Icon(Icons.compare_arrows_outlined),
                    label: Text(order ? 'Ascending' : 'Descdending'),
                    onPressed: () {
                      setState(() {
                        order = !order;
                      });
                    },
                  ),
                ]),
                Expanded(child: listviewBuilder()),
              ],
            ),
          )),
    );
  }

  Widget listviewBuilder() => ListView.builder(
        itemCount: myList.length,
        itemBuilder: ((context, index) {
          List<Pair> sortedList = myList;
          if (curDropdownValue == 'By Value') {
            sortedList.sort((a, b) => a.value.compareTo(b.value));
            if (!order) sortedList = List.from(sortedList.reversed);
          } else {
            sortedList.sort((a, b) => a.name.compareTo(b.name));
            if (!order) sortedList = List.from(sortedList.reversed);
          }

          final currentItem = sortedList[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 20,
              child: Text(currentItem.value.toString()),
            ),
            title: Text(currentItem.name),
          );
        }),
      );
}
