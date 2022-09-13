import 'package:flutter/material.dart';
import 'package:ternav_icons/ternav_icons.dart';

import '../constants.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 1.5,
      child: ListView(
        shrinkWrap: true,
        children: [
          Row(
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 40.0,
                  backgroundImage: AssetImage('profile.jpg'),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Admin",
                style: TextStyle(fontSize: 25.0),
              )
            ],
          ),
          DrawerListTile(
            icon: TernavIcons.light.home_2,
            title: "Home",
            onTap: () {},
          ),
          DrawerListTile(
            icon: TernavIcons.bold.call,
            title: "Contact",
            onTap: () {},
          ),
          DrawerListTile(
            icon: TernavIcons.bold.calender,
            title: "About Us",
            onTap: () {},
          ),
          DrawerListTile(
            icon: TernavIcons.bold.chat,
            title: "Message",
            onTap: () {},
          ),
          DrawerListTile(
            icon: TernavIcons.bold.settings,
            title: "Settings",
            onTap: () {},
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.all(24),
            padding: const EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "LogOut",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      horizontalTitleGap: 0,
      leading: Icon(
        icon,
        color: Colors.black,
        size: 22,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.black, fontSize: 15),
      ),
    );
  }
}
