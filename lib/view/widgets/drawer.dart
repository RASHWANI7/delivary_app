import 'package:flutter/material.dart';
import 'package:delivery_app/constants/constants.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 270,
      backgroundColor: Constants.primary_color,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset(
                'lib/view/images/pharmacy_image.png',
                color: Colors.white,
              ),
            ),
              Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: InkWell(
                onTap: (){
                  Navigator.pushNamed(context, 'setting_page');
                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.settings,
                      size: 35,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Setting',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
               Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: InkWell(
                onTap: (){
                  Navigator.pushNamed(context, 'history_page');
                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.history,
                      size: 35,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'History',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Divider(
              height: 80,
              thickness: 2,
            ),
            InkWell(
              onTap: (){
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Constants.primary_color,
                    content: const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Text(
                        'Are you sure you want to log out',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'yes',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 25),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'no',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );

              },
              child: const Row(
                children: [
                  Icon(
                    Icons.logout,
                    size: 35,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Logout',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
