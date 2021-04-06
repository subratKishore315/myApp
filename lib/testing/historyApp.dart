import 'package:flutter/material.dart';

import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

class allContact extends StatefulWidget {
  const allContact({Key key}) : super(key: key);

  @override
  _allContactState createState() => _allContactState();
}

// ignore: camel_case_types
class _allContactState extends State<allContact> {
  Future<PermissionStatus> _getPermission() async {
    final PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.denied) {
      final Map<Permission, PermissionStatus> permissionStatus =
          await [Permission.contacts].request();
      return permissionStatus[Permission.contacts] ??
          PermissionStatus.undetermined;
    } else {
      return permission;
    }
  }

  @override
  void initState()  {
    super.initState();
    //final Iterable<Contact> contacts = await ContactsService.getContacts();
    //print(contacts);
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.greenAccent);
  }
}
