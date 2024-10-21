import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stock_managment_system_app/utils/data.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

// Define a custom Form widget.
class AddItemForm extends ConsumerStatefulWidget {
  final List fields;
  const AddItemForm({super.key, required this.fields});

  @override
  AddItemFormState createState() {
    return AddItemFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class AddItemFormState extends ConsumerState<AddItemForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<AddItemFormState>.
  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _controllers = {};
  Map<String, dynamic> inputFieldText = {};
  late bool response;

  @override
  void initState() {
    super.initState();
    for (String field in widget.fields) {
      
        _controllers[field] = TextEditingController();
      
    }
  }

  @override
  Widget build(BuildContext context) {
  

    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          for (String field in widget.fields)
            // Add TextFormFields and ElevatedButton here.
          
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
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      for (var entry in _controllers.entries) {
                        inputFieldText[entry.key] = entry.value.text;
                      }
                      response = await ref.read(inventoryItemsProvider.notifier).addProduct(inputFieldText);
                    
                      if (response == true) {
                        toastification.show(
                          type: ToastificationType.success,
                          style: ToastificationStyle.fillColored,
                          title: const Text("Product Added Successfully"),
                          description: Text(
                              "${inputFieldText["Product Name"]} has been added successfully"),
                          alignment: Alignment.bottomRight,
                          autoCloseDuration: const Duration(seconds: 4),
                          borderRadius: BorderRadius.circular(12.0),
                        );
                        if (mounted) {
                          SchedulerBinding.instance.addPostFrameCallback((_) {
                            if (mounted) {
                              context.go("/inventory");
                            }
                          });
                        }
                      } else {
                        toastification.show(
                          type: ToastificationType.error,
                          style: ToastificationStyle.fillColored,
                          title: const Text("Add failed"),
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
          ),
        ],
      ),
    );
  }
}
