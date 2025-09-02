import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/utils/widgets/custom_text_form_field.dart';
import '../../data/task_model.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  final _taskBox = Hive.box<TaskModel>('tasks');
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _formKey.currentState?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextFormField(
                controller: _titleController,
                hintText: "Enter task title",
              ),
              CustomTextFormField(
                controller: _descriptionController,
                hintText: "Enter task description",

                maxLines: 4,
              ),

              ElevatedButton(
                onPressed: () {
                  if (!_formKey.currentState!.validate()) return;

                _taskBox.add(
                  TaskModel(
                    title: _titleController.text,
                    description: _descriptionController.text,
                  ),
                  );

                  Navigator.pop(context);
                  _titleController.clear();
                  _descriptionController.clear();
                },
                child: const Text("Add"),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
