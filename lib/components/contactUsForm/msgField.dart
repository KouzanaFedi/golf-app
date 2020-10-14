import 'package:flutter/material.dart';
import 'package:golf_app/models/providers/contactValidation.dart';
import 'package:provider/provider.dart';

class MsgField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final contactValidation = Provider.of<ContactValidation>(context);

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: TextField(
        keyboardType: TextInputType.name,
        maxLength: 500,
        minLines: 5,
        maxLines: 10,
        decoration: InputDecoration(
          hintText: "Votre message",
          errorText: contactValidation.msg.error,
        ),
        onChanged: (value) {
          contactValidation.setMsg(value);
        },
      ),
    );
  }
}
