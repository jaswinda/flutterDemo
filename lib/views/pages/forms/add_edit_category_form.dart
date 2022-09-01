import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_flutter_project_admin/utils/constants.dart';
import 'package:my_first_flutter_project_admin/views/components/my_button.dart';
import 'package:my_first_flutter_project_admin/views/components/my_field.dart';

class AddEditCategoryForm extends StatelessWidget {
  final String title;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  AddEditCategoryForm({Key? key, this.title = "Add Category"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontSize: 20)),
              Column(
                children: [
                  MyField(
                    text: "Category Name",
                    controller: _nameController,
                  ),
                  MyField(
                    text: "Category description",
                    controller: _descriptionController,
                  ),
                ],
              ),
              MyButton(
                  onTap: () {
                    Get.back();
                  },
                  text: 'Save'),
            ],
          ),
        ),
      ),
    );
  }
}
