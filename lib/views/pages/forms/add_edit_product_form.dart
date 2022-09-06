import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_first_flutter_project_admin/controller/category_controller.dart';
import 'package:my_first_flutter_project_admin/controller/product_controller.dart';
import 'package:my_first_flutter_project_admin/model/category.dart';
import 'package:my_first_flutter_project_admin/utils/constants.dart';
import 'package:my_first_flutter_project_admin/views/components/my_button.dart';
import 'package:my_first_flutter_project_admin/views/components/my_field.dart';

class AddEditProductForm extends StatefulWidget {
  final String title;

  const AddEditProductForm({Key? key, this.title = "Add Product"})
      : super(key: key);

  @override
  State<AddEditProductForm> createState() => _AddEditProductFormState();
}

class _AddEditProductFormState extends State<AddEditProductForm> {
  final ImagePicker _picker = ImagePicker();

  PickedFile? pickedFile;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();
  final ProductController productController = Get.put(ProductController());
  final CategroyController categroyController = Get.find<CategroyController>();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController categoryIdController = TextEditingController();
  String? selectedValue;
  List<Map<String, dynamic>> items = [
    {"id": "1"}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // height: 300,
          color: backgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.title, style: const TextStyle(fontSize: 20)),
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
                      DropdownButtonHideUnderline(
                          child: DropdownButton2(
                        isExpanded: true,
                        hint: Row(
                          children: const [
                            Icon(
                              Icons.list,
                              size: 16,
                              color: Colors.yellow,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: Text(
                                'Select Item',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.yellow,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        items: categroyController.categories.value
                            .map((item) => DropdownMenuItem<Category>(
                                  value: item,
                                  child: Text(
                                    item.name,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                            .toList(),
                        value: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value.toString();
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios_outlined,
                        ),
                        iconSize: 14,
                        iconEnabledColor: Colors.yellow,
                        iconDisabledColor: Colors.grey,
                        buttonHeight: 50,
                        buttonWidth: 160,
                        buttonPadding:
                            const EdgeInsets.only(left: 14, right: 14),
                        buttonDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: Colors.black26,
                          ),
                          color: Colors.redAccent,
                        ),
                        buttonElevation: 2,
                        itemHeight: 40,
                        itemPadding: const EdgeInsets.only(left: 14, right: 14),
                        dropdownMaxHeight: 200,
                        dropdownWidth: 200,
                        dropdownPadding: null,
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.redAccent,
                        ),
                        dropdownElevation: 8,
                        scrollbarRadius: const Radius.circular(40),
                        scrollbarThickness: 6,
                        scrollbarAlwaysShow: true,
                        offset: const Offset(-20, 0),
                      )),
                      MyField(
                        text: "Price",
                        controller: priceController,
                      ),
                      MyField(
                        text: "Category ID",
                        controller: categoryIdController,
                      ),
                    ],
                  ),
                  InkWell(
                      onTap: () async {
                        pickedFile = await _picker.getImage(
                          source: ImageSource.gallery,
                        );
                        setState(() {});
                        if (pickedFile != null) {
                          // Get.back();
                        }
                      },
                      child: (pickedFile == null)
                          ? Container(
                              width: Get.width / 2,
                              height: Get.height / 4,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(Icons.add_a_photo),
                            )
                          : Container(
                              width: Get.width / 2,
                              height: Get.height / 4,
                              decoration: BoxDecoration(
                                //image from file
                                image: DecorationImage(
                                    image: FileImage(
                                      File(pickedFile!.path),
                                    ),
                                    fit: BoxFit.cover),
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(Icons.add_a_photo),
                            )),
                  MyButton(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          var data = {
                            "name": _nameController.text,
                            "description": _descriptionController.text,
                            "category_id": categoryIdController.text,
                            "price": priceController.text
                          };
                          productController.add(data, pickedFile);
                        }
                      },
                      text: 'Save'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
