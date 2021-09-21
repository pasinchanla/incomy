// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import 'package:personal_finance/homepage.dart';

class IncomeDialog extends StatelessWidget {
  const IncomeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Input your new income'),
      content: EditForm(),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
            );
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
            );
          },
          child: const Text(
            'OK',
          ),
        ),
      ],
    );
  }
}

class ExpenseDialog extends StatelessWidget {
  const ExpenseDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Input your new expense'),
      content: EditForm(),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
            );
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
            );
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}

class EditForm extends StatelessWidget {
  const EditForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
      ],
      decoration: const InputDecoration(
        icon: Icon(Icons.money),
        hintText: 'Please type your number here',
      ),
      onSaved: (String? value) {
        // This optional block of code can be used to run
        // code when the user saves the form.
      },
      validator: (String? value) {
        return (value != null && value.contains(''))
            ? 'Please enter number only.'
            : null;
      },
    );
  }
}

// String numberValidator(String value) {
//   if(value == null) {
//     return null;
//   }
//   final n = num.tryParse(value);
//   if(n == null) {
//     return '"$value" is not a valid number';
//   }
//   return null;
// }
