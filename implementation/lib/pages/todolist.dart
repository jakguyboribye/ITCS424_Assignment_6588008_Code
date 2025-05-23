import 'package:flutter/material.dart';
import '../main.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => ToDoListState();
}

// To Do List Page, mapping all the to do items and providing modalbottomsheet to create a new item
// Items can be toggled done/not done
// Tap on the item's title to see more details 🤓☝️
class ToDoListState extends State<ToDoList> {
  int _selectedIndex = 3;

  List<Map<String, dynamic>> todoItems = [
    {
      'title': 'นัดฉีดวัคซีนกับหมอ',
      'caretaker': 'คุณพ่อ',
      'Date': '',
      'Location': '',
      'About': '',
      'isDone': true,
    },
    {
      'title': 'เตรียมนมให้ลูก',
      'caretaker': 'คุณแม่',
      'Date': 'วันที่ 20 มีนาคม 2568 15:00',
      'Location': '',
      'About': '',
      'isDone': false,
    },
  ];

  //controller for each fields in the creation 🤓☝️
  TextEditingController taskController = TextEditingController();
  TextEditingController caretakerController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'สิ่งที่ต้องทํา',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'bold',
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 20),
        children: [
          ...todoItems.asMap().entries.map((entry) {
            int index = entry.key;
            var item = entry.value;

            return Container(
              margin: const EdgeInsets.only(left: 20, top: 10),
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            todoItems[index]['isDone'] =
                                !todoItems[index]['isDone'];
                          });
                        },
                        child: Icon(
                          item['isDone'] ? Icons.circle : Icons.circle_outlined,
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Row(
                        children: [
                          SizedBox(
                            width: 180,
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder:
                                      (context) => AlertDialog(
                                        title: Text(
                                          '${item['title']}',
                                          style: TextStyle(
                                            fontFamily: 'bold',
                                            fontSize: 30,
                                          ),
                                        ),
                                        content: Container(
                                          height: 120,
                                          child: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'ผู้รับผิดชอบ: ${item['caretaker']}',
                                                  style: TextStyle(
                                                    fontFamily: 'semibold',
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                Text(
                                                  'วัน-เวลา: ${item['Date']}',
                                                  style: TextStyle(
                                                    fontFamily: 'semibold',
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                Text(
                                                  'สถานที่: ${item['Location']}',
                                                  style: TextStyle(
                                                    fontFamily: 'semibold',
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                Text(
                                                  'หมายเหตุ: ${item['About']}',
                                                  style: TextStyle(
                                                    fontFamily: 'semibold',
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              //return 🤓☝️
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              'กลับ',
                                              style: TextStyle(
                                                fontFamily: 'bold',
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                );
                              },
                              child: Text(
                                '${item['title']}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'regular',
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 6,
                            ),
                            //changing color based on role 🤓☝️
                            decoration: BoxDecoration(
                              color:
                                  item['caretaker'] == 'คุณพ่อ'
                                      ? const Color(0xFF6363FF)
                                      : item['caretaker'] == 'คุณแม่'
                                      ? const Color(0xFF73FFAB)
                                      : Colors.grey,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              '${item['caretaker']}',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'bold',
                                color:
                                    item['caretaker'] == 'คุณแม่'
                                        ? Colors.black
                                        : Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 12),
                        if (item['Date'] != null &&
                            item['Date'].toString().isNotEmpty)
                          Column(
                            children: [
                              Text(
                                (item['Date']),
                                style: TextStyle(
                                  fontFamily: 'semibold',
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        const SizedBox(height: 20),
                        const SizedBox(
                          width: 280,
                          child: Divider(
                            height: 1,
                            thickness: 1,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          SizedBox(height: 10),
          Center(
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                side: const BorderSide(color: Colors.black),
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 130,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                //ModalBottomSheet popup for creating new items 🤓☝️
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(35),
                    ),
                    side: BorderSide(color: Colors.black, width: 3),
                  ),
                  builder: (context) {
                    return Container(
                      height: 720,
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        children: [
                          Container(
                            height: 9,
                            width: 70,
                            decoration: BoxDecoration(
                              color: Color(0xFF6363FF),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: Text(
                              'รายละเอียด',
                              style: TextStyle(
                                fontFamily: 'bold',
                                fontSize: 32,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          TextField(
                            controller: taskController,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(fontFamily: 'regular'),
                              hintText: 'งานที่ต้องทํา',
                              hintStyle: TextStyle(fontFamily: 'regular'),
                              border: UnderlineInputBorder(),
                            ),
                          ),

                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                'ผู้รับผิดชอบ',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'semibold',
                                ),
                              ),
                              const SizedBox(width: 120),
                              Expanded(
                                child: Caretakerdropdown(
                                  onChanged: (value) {
                                    caretakerController.text = value;
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),

                          Row(
                            children: [
                              Text(
                                'วันเวลา',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'semibold',
                                ),
                              ),
                              const SizedBox(width: 60),
                              Expanded(
                                child: TextField(
                                  controller: dateController,
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                      fontFamily: 'regular',
                                    ),
                                    hintText: 'วันเวลา',
                                    hintStyle: TextStyle(fontFamily: 'regular'),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 2.0,
                                      ),
                                    ),
                                    prefixIcon: Icon(Icons.calendar_today),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 15),

                          Row(
                            children: [
                              Text(
                                'สถานที่',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'semibold',
                                ),
                              ),
                              const SizedBox(width: 60),
                              Expanded(
                                child: TextField(
                                  controller: locationController,
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                      fontFamily: 'regular',
                                    ),
                                    hintText: 'สถานที่',
                                    hintStyle: TextStyle(fontFamily: 'regular'),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 2.0,
                                      ),
                                    ),
                                    prefixIcon: Icon(Icons.location_on_sharp),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'หมายเหตุ',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'semibold',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          TextField(
                            controller: notesController,
                            maxLines: 5,
                            decoration: InputDecoration(
                              hintText: 'หมายเหตุ',
                              hintStyle: TextStyle(fontFamily: 'regular'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  minimumSize: Size(120, 50),
                                  side: BorderSide(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 20,
                                  ),
                                ),
                                child: Text(
                                  'ยกเลิก',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'bold',
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  String task = taskController.text;
                                  String caretaker = caretakerController.text;
                                  String date = dateController.text;
                                  String location = locationController.text;
                                  String notes = notesController.text;

                                  //create a new item 🤓☝️
                                  Map<String, dynamic> newTodoItem = {
                                    'title': task,
                                    'caretaker': caretaker,
                                    'Date': date,
                                    'Location': location,
                                    'About': notes,
                                    'isDone': false,
                                  };
                                  //add it to list 🤓☝️
                                  setState(() {
                                    todoItems.add(newTodoItem);
                                  });
                                  //return 🤓☝️
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF6363FF),
                                  minimumSize: Size(120, 50),
                                  side: BorderSide(
                                    color: Color.fromARGB(255, 122, 122, 243),
                                    width: 2,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 30,
                                  ),
                                ),
                                child: Text(
                                  'ยืนยัน',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'bold',
                                    color: Colors.white,
                                  ),
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
              child: const Text(
                'เพิ่มรายการ',
                style: TextStyle(fontSize: 18, fontFamily: 'bold'),
              ),
            ),
          ),
        ],
      ),

      //Bottom Navigation (Only Home and About me works) 🤓☝️
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.energy_savings_leaf),
            label: 'Grow',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_document),
            label: 'Articles',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Me'),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.deepPurple,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
          }
        },
      ),
    );
  }
}

//Custom dropdown for choosing caretaker 🤓☝️
class Caretakerdropdown extends StatefulWidget {
  final Function(String) onChanged;

  const Caretakerdropdown({super.key, required this.onChanged});

  @override
  State<Caretakerdropdown> createState() => _CaretakerdropdownState();
}

class _CaretakerdropdownState extends State<Caretakerdropdown> {
  String? selectedPerson;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(40),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedPerson,
          isExpanded: true,
          style: const TextStyle(fontSize: 14, color: Colors.black),
          hint: const Text(
            'ผู้รับผิดชอบ',
            style: TextStyle(fontSize: 14, fontFamily: 'bold'),
          ),
          items:
              ['คุณพ่อ', 'คุณแม่'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 18, fontFamily: 'bold'),
                  ),
                );
              }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedPerson = newValue;
            });
            widget.onChanged(newValue ?? '');
          },
        ),
      ),
    );
  }
}
