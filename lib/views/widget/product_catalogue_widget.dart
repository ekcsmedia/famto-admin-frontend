import 'dart:typed_data';
import 'package:famto_admin_app/controller/customer_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart' hide DatePickerTheme;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../controller/product_management_controller.dart';

class ProductCatalogueScreen extends StatefulWidget {
  const ProductCatalogueScreen({super.key});

  @override
  State<ProductCatalogueScreen> createState() => _ProductCatalogueScreenState();
}

class _ProductCatalogueScreenState extends State<ProductCatalogueScreen> {
  // Initial Selected Value
  String dropdownvalue = 'Restaurant 1';
  String photoImageUrl = "";
  // List of items in our dropdown menu
  var items = [
    'Restaurant 1',
    'Restaurant 2',
    'Restaurant 3',
    'Restaurant 4',
    'Restaurant 5',
  ];

  final ProductController _productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 4,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text("Products", style: TextStyle(fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: DropdownButton(
                    // Initial Value
                    value: dropdownvalue,
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),
                    // Array list of items
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: MediaQuery.of(context).size.height * 0.8,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Category (3)",
                                        style: TextStyle(fontSize: 16)),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          barrierDismissible:
                                              true, // user must tap button!
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text('Add Category'),
                                              content: SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.6,
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('Category Name'),
                                                      TextField(
                                                        controller:
                                                            _productController
                                                                .categoryNameController,
                                                      ),
                                                      _spaceField(),
                                                      Text('Description'),
                                                      TextField(
                                                        controller:
                                                            _productController
                                                                .categoryDescriptionController,
                                                      ),
                                                      _spaceField(),
                                                      ElevatedButton(
                                                          onPressed: () async {
                                                            String url = "";
                                                            XFile? image =
                                                                await selectPicture(
                                                                    ImageSource
                                                                        .gallery);
                                                            String? path =
                                                                image?.path;
                                                            String? name =
                                                                image?.name;
                                                            if (image != null &&
                                                                path != null &&
                                                                name != null) {
                                                              Uint8List
                                                                  imageData =
                                                                  await XFile(
                                                                          path)
                                                                      .readAsBytes();
                                                              FirebaseStorage
                                                                  storage =
                                                                  FirebaseStorage
                                                                      .instance;
                                                              Reference ref =
                                                                  storage
                                                                      .ref()
                                                                      .child(
                                                                          "images/$name-${DateTime.now()}");
                                                              UploadTask
                                                                  uploadTask =
                                                                  ref.putData(
                                                                      imageData);
                                                              uploadTask.then(
                                                                  (res) async {
                                                                url = await res
                                                                    .ref
                                                                    .getDownloadURL();

                                                                setState(() {
                                                                  photoImageUrl =
                                                                      url;
                                                                });
                                                              });
                                                            }
                                                            // var picked = await FilePicker.platform.pickFiles();

                                                            // if (picked != null) {
                                                            //   print(picked.files.first.name);
                                                            //   uploadPic(io.File(picked.files.first.name));
                                                            // }
                                                          },
                                                          child: Text(
                                                              "Upload Photo")),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              actions: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    TextButton(
                                                      child:
                                                          const Text('Cancel'),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                    TextButton(
                                                      child: const Text('Save'),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const ListTile(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Extras"),
                                    Icon(Icons.more_vert),
                                  ],
                                ),
                              ),
                              const ListTile(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Briyani"),
                                    Icon(Icons.more_vert),
                                  ],
                                ),
                              ),
                              const ListTile(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Chinese"),
                                    Icon(Icons.more_vert),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: MediaQuery.of(context).size.height * 0.8,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Product (3)",
                                        style: TextStyle(fontSize: 16)),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          barrierDismissible:
                                              true, // user must tap button!
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text('Add Products'),
                                              content: SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.6,
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text(
                                                          'Product Name'),
                                                      TextField(
                                                        controller:
                                                            _productController
                                                                .productNameController
                                                      ),
                                                      _spaceField(),
                                                      const Text('Search Tag'),
                                                      TextField(
                                                        controller:
                                                            _productController
                                                                .searchTagController,
                                                      ),
                                                      _spaceField(),
                                                      const Text('Price'),
                                                      TextField(
                                                        controller:
                                                            _productController
                                                                .priceController,
                                                      ),
                                                      _spaceField(),
                                                      const Text(
                                                          'Minimum quantity to order'),
                                                      TextField(
                                                        controller:
                                                            _productController
                                                                .minOrderQtyController,
                                                      ),
                                                      _spaceField(),
                                                      const Text(
                                                          'Maximum quantity per order'),
                                                      TextField(
                                                        controller:
                                                            _productController
                                                                .maxQtyPerOrderController,
                                                      ),
                                                      _spaceField(),
                                                      const Text('Cost Price'),
                                                      TextField(
                                                        controller:
                                                            _productController
                                                                .costPriceController,
                                                      ),
                                                      _spaceField(),
                                                      const Text('SKU'),
                                                      TextField(
                                                        controller:
                                                            _productController
                                                                .skuController,
                                                      ),
                                                      _spaceField(),
                                                      const Text('Discount'),
                                                      TextField(
                                                        controller:
                                                            _productController
                                                                .discountController,
                                                      ),
                                                      _spaceField(),
                                                      const Text(
                                                          'Often bought together'),
                                                      DropdownMenu(
                                                        controller:
                                                            _productController
                                                                .oftenBoughtTogetherController,
                                                        dropdownMenuEntries: [
                                                          DropdownMenuEntry(value: "product1", label: "product1"),
                                                          DropdownMenuEntry(value: "product2", label: "product2"),
                                                          DropdownMenuEntry(value: "product3", label: "product3"),
                                                          DropdownMenuEntry(value: "product4", label: "product4")
                                                        ],
                                                      ),
                                                      _spaceField(),
                                                      const Text(
                                                          'Preparation time (in min)'),
                                                      TextField(
                                                        controller:
                                                            _productController
                                                                .preparationTimeController,
                                                      ),
                                                      _spaceField(),
                                                      const Text('Inventory'),
                                                      Obx(() => Switch(value: _productController.inventory, onChanged: (bool value) {
                                                        _productController.setInventoryValue(value);
                                                      },),),
                                                      _spaceField(),
                                                      const Text('Description'),
                                                      TextField(
                                                        controller:
                                                            _productController
                                                                .productDescriptionController,
                                                      ),
                                                      _spaceField(),
                                                      const Text(
                                                          'Long Description'),
                                                      TextField(
                                                        controller:
                                                            _productController
                                                                .productLongDescriptionController,
                                                      ),
                                                      _spaceField(),
                                                      ElevatedButton(
                                                          onPressed: () async {
                                                            String url = "";
                                                            XFile? image =
                                                                await selectPicture(
                                                                    ImageSource
                                                                        .gallery);
                                                            String? path =
                                                                image?.path;
                                                            String? name =
                                                                image?.name;
                                                            if (image != null &&
                                                                path != null &&
                                                                name != null) {
                                                              Uint8List
                                                                  imageData =
                                                                  await XFile(
                                                                          path)
                                                                      .readAsBytes();
                                                              FirebaseStorage
                                                                  storage =
                                                                  FirebaseStorage
                                                                      .instance;
                                                              Reference ref =
                                                                  storage
                                                                      .ref()
                                                                      .child(
                                                                          "images/$name-${DateTime.now()}");
                                                              UploadTask
                                                                  uploadTask =
                                                                  ref.putData(
                                                                      imageData);
                                                              uploadTask.then(
                                                                  (res) async {
                                                                url = await res
                                                                    .ref
                                                                    .getDownloadURL();

                                                                setState(() {
                                                                  photoImageUrl =
                                                                      url;
                                                                });
                                                              });
                                                            }
                                                            // var picked = await FilePicker.platform.pickFiles();

                                                            // if (picked != null) {
                                                            //   print(picked.files.first.name);
                                                            //   uploadPic(io.File(picked.files.first.name));
                                                            // }
                                                          },
                                                          child: Text(
                                                              "Upload Image")),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              actions: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    TextButton(
                                                      child:
                                                          const Text('Cancel'),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                    TextButton(
                                                      child: const Text('Add'),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const ListTile(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Prawn Dumplings"),
                                    Icon(Icons.more_vert),
                                  ],
                                ),
                              ),
                              const ListTile(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Chicken Ramen"),
                                    Icon(Icons.more_vert),
                                  ],
                                ),
                              ),
                              const ListTile(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Vegetable Manchurian"),
                                    Icon(Icons.more_vert),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: MediaQuery.of(context).size.height * 0.8,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Product Details",
                                        style: TextStyle(fontSize: 16)),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(width: 10),
                                  const SizedBox(
                                    width: 200,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Prawn Dumplings"),
                                        Text("₹ 20.00"),
                                        Text(
                                            "Steamed dumplings filled with Prawns"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  _spaceField() {
    return SizedBox(height: 10);
  }

  Future<XFile?> selectPicture(ImageSource source) async {
    XFile? image;
    image = await ImagePicker().pickImage(
      source: source,
      maxHeight: 1000,
      maxWidth: 1000,
    );
    return image;
  }
}
