import 'package:flutter/material.dart';
import 'package:sms/dashboard/sidemenu.dart';

import '../constants.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool valuefirst = false;
  bool valuesecond = false;
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
      drawer: SideMenu(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
                    "My Messages",
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
              const SizedBox(
                height: 15,
              ),
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
                          valuesecond = value!;
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
                              child: const Text(
                                'Show',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                              ),
                              onPressed: () {/* ... */},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
