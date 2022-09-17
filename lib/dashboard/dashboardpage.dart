import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:sms/dashboard/sidemenu.dart';

import '../constants.dart';

var today = DateUtils.dateOnly(DateTime.now());

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<DateTime?> _dialogCalendarPickerValue = [
    DateTime(2022, 9, 1),
    DateTime(2022, 9, 17),
  ];
  String dropdownvalue = 'Select';

  var items = [
    'Select',
    'Clothing',
    'Food',
    'Travel',
    'Others',
  ];
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.grey, size: 28),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.grey,
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(top: 5, right: 16, bottom: 5, left: 10),
            child: const CircleAvatar(
              backgroundImage: AssetImage('profile.jpg'),
            ),
          )
        ],
      ),
      drawer: const SideMenu(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RichText(
                text: const TextSpan(
                  text: "Hello ",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  children: [
                    TextSpan(
                      text: "Admin",
                      style:
                          TextStyle(color: kGreen, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: ", welcome back!",
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Expenses",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                child: SizedBox(
                  width: 375,
                  height: MediaQuery.of(context).size.height,
                  child: ListView(
                    children: <Widget>[
                      _buildCalendarDialogButton(),
                      _buildStatementList()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getValueText(
    CalendarDatePicker2Type datePickerType,
    List<DateTime?> values,
  ) {
    var valueText = (values.isNotEmpty ? values[0] : null)
        .toString()
        .replaceAll('00:00:00.000', '');

    if (datePickerType == CalendarDatePicker2Type.range) {
      if (values.isNotEmpty) {
        var startDate = values[0].toString().replaceAll('00:00:00.000', '');
        var endDate = values.length > 1
            ? values[1].toString().replaceAll('00:00:00.000', '')
            : 'null';
        valueText = '$startDate to $endDate';
      } else {
        return 'null';
      }
    }

    return valueText;
  }

  _buildCalendarDialogButton() {
    var config = CalendarDatePicker2WithActionButtonsConfig(
      calendarType: CalendarDatePicker2Type.range,
      selectedDayHighlightColor: Colors.teal[800],
      shouldCloseDialogAfterCancelTapped: true,
      weekdayLabelTextStyle: const TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
    );
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.teal[600],
            ),
            onPressed: () async {
              var values = await showCalendarDatePicker2Dialog(
                context: context,
                config: config,
                dialogSize: Size(350, 375),
                borderRadius: 15,
                initialValue: _dialogCalendarPickerValue,
                dialogBackgroundColor: Colors.white,
                selectableDayPredicate: (day) => !day
                    .difference(_dialogCalendarPickerValue[0]!
                        .subtract(const Duration(days: 5)))
                    .isNegative,
              );
              // values == _dialogCalendarPickerValue
              //     ? _buildStatementList()
              //     : Text("");
              if (values != null) {
                setState(() {
                  _dialogCalendarPickerValue = values;
                });
              }
            },
            child: const Text(
              'Select Date Range',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Selection(s):  '),
              const SizedBox(width: 10),
              Text(
                _getValueText(
                  config.calendarType,
                  _dialogCalendarPickerValue,
                ),
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildStatementList() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: kLightBlue,
      elevation: 10,
      child: Column(
        children: [
          ListTile(
            trailing: DropdownButton(
              value: dropdownvalue,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue != newValue;
                });
              },
            ),
            title: Text("Date: $today"),
            subtitle: Text('Amount : 5000'),
          ),
          Divider(),
          ListTile(
            trailing: DropdownButton(
              value: dropdownvalue,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
            title: Text("Date: $today"),
            subtitle: Text('Amount : 5000'),
          ),
          Divider(),
          ListTile(
            trailing: DropdownButton(
              value: dropdownvalue,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
            title: Text("Date: $today"),
            subtitle: Text('Amount : 5000'),
          ),
          Divider(),
          ListTile(
            trailing: DropdownButton(
              value: dropdownvalue,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
            title: Text("Date: $today"),
            subtitle: Text('Amount : 5000'),
          ),
          Divider(),
          ListTile(
            trailing: DropdownButton(
              value: dropdownvalue,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
            title: Text("Date: $today"),
            subtitle: Text('Amount : 5000'),
          ),
          Divider(),
          ListTile(
            trailing: DropdownButton(
              value: dropdownvalue,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
            title: Text("Date: $today"),
            subtitle: Text('Amount : 5000'),
          ),
          Divider(),
        ],
      ),
    );
  }
}
