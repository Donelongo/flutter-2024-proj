  import 'package:flutter/material.dart';

          class CircleAvatarWidget extends StatelessWidget {
            final String routeName;

            const CircleAvatarWidget({required Key key, required this.routeName})
                : super(key: key);

            @override
            Widget build(BuildContext context) {
              return PopupMenuButton<String>(
                itemBuilder: (BuildContext context) {
                  return [
                    const PopupMenuItem<String>(
                      value: 'logout',
                      child: Text('Logout'),
                    ),
                    // const PopupMenuItem<String>(
                    //   value: 'Delete Account',
                    //   child: Text('Delete Account'),
                    // )
                  ];
                },
                onSelected: (String value) {
                  if (value == 'logout') {
                    Navigator.pushNamed(context, routeName);
                  }
                },
                child: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
              );
            }
          }
