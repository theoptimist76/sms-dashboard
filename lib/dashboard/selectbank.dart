import 'package:flutter/material.dart';
import 'package:sms/dashboard/dashboardpage.dart';

import '../constants.dart';

class SelectBank extends StatefulWidget {
  const SelectBank({Key? key}) : super(key: key);

  @override
  State<SelectBank> createState() => _SelectBankState();
}

class _SelectBankState extends State<SelectBank> {
  bool valuefirst = false;
  bool valuesecond = false;
  bool valuethird = false;
  bool valueforth = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Select Bank",
          style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: kLightBlue,
                  elevation: 10,
                  child: Column(
                    children: [
                      CheckboxListTile(
                        secondary: const Icon(Icons.attach_money),
                        title: const Text('Global IME Bank Pvt. Ltd.'),
                        subtitle: Text('GBIME_ALERT'),
                        value: valuefirst,
                        onChanged: (bool? value) {
                          setState(() {
                            valuefirst = value!;
                          });
                        },
                      ),
                      Divider(),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.trailing,
                        secondary: const Icon(Icons.attach_money),
                        title: const Text('Nabil Bank Limited'),
                        subtitle: Text('NABIL_ALERT'),
                        value: valuesecond,
                        onChanged: (bool? value) {
                          setState(() {
                            valuesecond = value!;
                          });
                        },
                      ),
                      Divider(),
                      CheckboxListTile(
                        secondary: const Icon(Icons.attach_money),
                        title: const Text('NIC ASIA Bank Pvt. Ltd.'),
                        subtitle: Text('NIC_ALERT'),
                        value: valuethird,
                        onChanged: (bool? value) {
                          setState(() {
                            valuethird = value!;
                          });
                        },
                      ),
                      Divider(),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.trailing,
                        secondary: const Icon(Icons.attach_money),
                        title: const Text('Nepal Bank Limited'),
                        subtitle: Text('NBL_ALERT'),
                        value: valueforth,
                        onChanged: (bool? value) {
                          setState(() {
                            valueforth = value!;
                          });
                        },
                      ),
                      Divider(),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: kLightBlue,
                      elevation: 10,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          const ListTile(
                            leading: Icon(Icons.message_rounded, size: 25),
                            title: Text('Messages List',
                                style: TextStyle(fontSize: 18.0)),
                            subtitle: Text('Showing all the messages',
                                style: TextStyle(fontSize: 14.0)),
                          ),
                          ButtonBar(
                            children: <Widget>[
                              TextButton(
                                  child: Row(children: [
                                    Text(
                                      'Show',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.black,
                                    )
                                  ]),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const DashboardPage()),
                                    );
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
