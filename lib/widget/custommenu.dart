import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomMenu extends StatelessWidget {
  final Function() onTapH;
  final Function() onTapN;
  final Function() onTapP;
  final Function() onTapL;
  const CustomMenu({
    super.key,
    required this.onTapH,
    required this.onTapN,
    required this.onTapP,
    required this.onTapL,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: Container(
        color: Colors.transparent,

        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: const Color(0xFF50C2C9)),
              child: Row(
                children: [
                  Icon(Icons.menu, size: 50, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    'Menu',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              focusColor: RenderErrorBox.backgroundColor,
              leading: Icon(Icons.home, color: Colors.black),
              title: Text(
                'Home',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: onTapH,
            ),
            ListTile(
              leading: Icon(Icons.notifications, color: Colors.white),
              title: Text(
                'Notification',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: onTapN,
            ),
            ListTile(
              leading: Icon(Icons.person_pin_outlined, color: Colors.white),
              title: Text(
                'Profile',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: onTapP,
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.white),
              title: Text(
                'Log Out',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: onTapL,
            ),
          ],
        ),
      ),
    );
  }
}
