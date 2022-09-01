import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_first_flutter_project_admin/utils/constants.dart';
import 'package:my_first_flutter_project_admin/views/components/my_button.dart';
import 'package:my_first_flutter_project_admin/views/components/my_field.dart';

class AddEditProductForm extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();
  final String title;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  AddEditProductForm({Key? key, this.title = "Add Product"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: 300,
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
                InkWell(
                  onTap: () async {
                    final pickedFile = await _picker.getImage(
                      source: ImageSource.gallery,
                    );
                    if (pickedFile != null) {
                      Get.back();
                    }
                  },
                  child: Container(
                    width: Get.width / 2,
                    height: Get.height / 4,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.add_a_photo),
                  ),
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
      ),
    );
  }
}
