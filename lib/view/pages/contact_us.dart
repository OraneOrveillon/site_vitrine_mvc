import 'dart:html';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  final _formKey = GlobalKey<FormState>();

  static String? Function(String?) notNullValidator = (String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez remplir ce champ.';
    }
    return null;
  };

  static String? Function(String?) emailValidator = (String? value) {
    String? notNullValidate = notNullValidator(value);
    if (notNullValidate != null) {
      return notNullValidate;
    } else {
      if (!EmailValidator.validate(value!)) {
        return 'Veuillez saisir une adresse mail valide.';
      }
      return null;
    }
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextFormField(
              decoration: const InputDecoration(hintText: 'Adresse mail'),
              keyboardType: TextInputType.emailAddress,
              validator: emailValidator,
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Message'),
              keyboardType: TextInputType.multiline,
              maxLines: 10,
              validator: notNullValidator,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Message envoyé !'),
                        duration: Duration(seconds: 2)),
                  );
                }
              },
              child: const Text('Valider'),
            )
          ],
        ),
      ),
    );
  }
}
