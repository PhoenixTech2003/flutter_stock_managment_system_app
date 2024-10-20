import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stock_managment_system_app/utils/data.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

// Define a custom Form widget.
class EditForm extends ConsumerStatefulWidget {
  final List<dynamic> fields;
  const EditForm({super.key, required this.fields});

  @override
  EditFormState createState() {
    return EditFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class EditFormState extends ConsumerState<EditForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<EditFormState>.
  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _controllers = {};
  Map<String, dynamic> inputFieldText = {};
  late bool response;

  @override
  void initState() {
    super.initState();
    for (String field in widget.fields[0].keys) {
      if (field != "product_id" && field != "deleted") {
        _controllers[field] = TextEditingController(
          text: widget.fields[0][field].toString(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List fields = widget.fields[0].keys.toList();

    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          for (String field in fields)
            // Add TextFormFields and ElevatedButton here.
            if (field != "product_id" && field != "deleted")
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: TextFormField(
                    controller: _controllers[field],
                    decoration: InputDecoration(
                      labelText: "$field *",
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
              ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    for (var entry in _controllers.entries) {
                      inputFieldText["product_id"] =
                          widget.fields[0]["product_id"];
                      inputFieldText[entry.key] = entry.value.text;
                    }
                    response = await ref
                        .read(inventoryItemsProvider.notifier)
                        .updateProduct(inputFieldText);
                    if (response == true) {
                      toastification.show(
                        type: ToastificationType.success,
                        style: ToastificationStyle.fillColored,
                        title: const Text("Update of product successful"),
                        description: Text(
                            "${widget.fields[0]["product_name"]} has been updated successfully"),
                        alignment: Alignment.bottomRight,
                        autoCloseDuration: const Duration(seconds: 4),
                        borderRadius: BorderRadius.circular(12.0),
                      );
                      context.go("/inventory");
                    } else {
                      toastification.show(
                        type: ToastificationType.error,
                        style: ToastificationStyle.fillColored,
                        title: const Text("Update failed"),
                        description:
                            const Text("Please try again or contact support"),
                        alignment: Alignment.bottomRight,
                        autoCloseDuration: const Duration(seconds: 4),
                      );
                    }
                  }
                },
                child: const Text("Submit"),
              ),
              TextButton(
                  onPressed: () {
                    context.go("/inventory");
                  },
                  child: const Text("Cancel")),
            ],
          ),
        ],
      ),
    );
  }
}
