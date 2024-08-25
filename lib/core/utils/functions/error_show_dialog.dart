import 'package:flutter/material.dart';

Future<dynamic> errorShowDialog(BuildContext context,{required String message}) {
  return showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Error'),
                    content:  Text(message),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Ok'),
                      )
                    ],
                  );
                },
              );
}
