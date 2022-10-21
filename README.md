# Tutorial on Sort List Flutter

### **step 1: Create flutter project and add a simple stateful widget**

```dart
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CSEDU',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('List Sorting Tutorial'),
          ),
          body: const Center(
            child: Text('Hello# '),
          )),
    );
  }
}
```

### **Step 2:**

We will use a simple list of pairs/tuples for our list view
so we create a very simple Pair class with an integer and a string value
and make List<Pair> and some values to it

```dart
//Pair Class
class Pair {
  int value;
  String name;
  Pair(this.value, this.name);
}
```
Now, insert some values to above list
```dart
//Insert items to the list
class _MyAppState extends State<MyApp> {
  List<Pair> myList = [
    Pair(3, 'Posiden'),
    Pair(4, 'Hades'),
    Pair(7, 'Zeus'),
    Pair(2, 'Hera'),
    Pair(1, 'Demeter'),
    Pair(6, 'Athena'),
    Pair(5, 'Ares'),
  ];

  /*

    code 

  */

}
```

### **Step 3: now we will add a function which will return a listView widget**

//listView builder function
class _MyAppState extends State<MyApp> {
  /*

  code

  */

  Widget listviewBuilder() => ListView.builder(
        itemCount: myList.length,
        itemBuilder: ((context, index) {
          final currentItem = myList[index];
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

### **Step 4:**
adding sort button and a drop down menu to select by which value
you want to sort the list

```dart
//Required variables
//true : ascending, false: descending
class _MyAppState extends State<MyApp> {

  /*

  code

  */

  bool order = true;
  List<String> dropDown = [
    'By Value',
    'By Name',
  ];
  String curDropdownValue = 'By Value';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          /*

          code
          
          
          */
          body: Center(
            child: Column(
              children: [

                //row for Button and DropDown 
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  //Button For Changing sorting order
                  TextButton.icon(
                    icon: const Icon(Icons.compare_arrows_outlined),
                    label: Text(order ? 'Ascending' : 'Descdending'),
                    onPressed: () {
                      setState(() {
                        order = !order;
                      });
                    },
                  ),
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
                ]),

                //Calling the listviewBuilder function
                Expanded(child: listviewBuilder()),
              ],
            ),
          )),
    );
  }

  /*
  code

  */
}
```

### **Step 5 :**
sorting the list according to the requirements
we only need to modify our listview Builder function

```dart
Widget listviewBuilder() => ListView.builder(
        itemCount: myList.length,
        itemBuilder: ((context, index) {
          //Newly added code
          List<Pair> sortedList = myList;
          if (curDropdownValue == 'By Value') {
            sortedList.sort((a, b) => a.value.compareTo(b.value));
            if (!order) sortedList = List.from(sortedList.reversed);
          } else {
            sortedList.sort((a, b) => a.name.compareTo(b.name));
            if (!order) sortedList = List.from(sortedList.reversed);
          }
          //Newly added code

          //take currentItem from sortedList
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
```