import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Services/brand.dart';
import 'package:e_commerce/Services/category.dart';
import 'package:flutter/material.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({Key? key}) : super(key: key);

  @override
  _AddProductsState createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _productController = TextEditingController();

  List<DocumentSnapshot> brands = <DocumentSnapshot>[];
  List<DocumentSnapshot> categories = <DocumentSnapshot>[];

  List<DropdownMenuItem<String>> categoriesDropDown =
      <DropdownMenuItem<String>>[];
  List<DropdownMenuItem<String>> brandsDropDown = <DropdownMenuItem<String>>[];

  String _currentCategory = "test";
   String? _currentBrand;

  final CategoryService _categoryService = CategoryService();
  final BrandService _brandService = BrandService();

  @override
  void initState() {
    super.initState();
    _getCategories();
    categoriesDropDown = getCategoriesDropDown();
   //  _currentCategory = categoriesDropDown[0].value!;
  }

  List<DropdownMenuItem<String>> getCategoriesDropDown() {
    List<DropdownMenuItem<String>> items = List.empty(growable: true);
    for (DocumentSnapshot category in categories) {
      items.add(DropdownMenuItem(
        child: Text(category["category"]),
        value: category['category'],
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Add Products",
          style: TextStyle(color: Colors.black),
        ),
        leading: const Icon(
          Icons.close,
          color: Colors.black,
        ),
        elevation: 0.1,
      ),
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(15.0, 40.0, 15.0, 40.0),
                        child: Icon(
                          Icons.add,
                          color: Colors.grey,
                        ),
                      ),
                      style: ButtonStyle(
                          side: MaterialStateProperty.all(BorderSide(
                              color: Colors.grey.withOpacity(0.5),
                              width: 2.5))),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(15.0, 40.0, 15.0, 40.0),
                        child: Icon(
                          Icons.add,
                          color: Colors.grey,
                        ),
                      ),
                      style: ButtonStyle(
                          side: MaterialStateProperty.all(BorderSide(
                              color: Colors.grey.withOpacity(0.5),
                              width: 2.5))),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(15.0, 40.0, 15.0, 40.0),
                        child: Icon(
                          Icons.add,
                          color: Colors.grey,
                        ),
                      ),
                      style: ButtonStyle(
                          side: MaterialStateProperty.all(BorderSide(
                              color: Colors.grey.withOpacity(0.5),
                              width: 2.5))),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Add Product name within 10 letters",
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: _productController,
                decoration: InputDecoration(
                    hintText: "Add Product Name",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.5), width: 2),
                        borderRadius: BorderRadius.circular(10))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Products cannot be empty";
                  } else if (value.length > 10) {
                    return "The productname can't be greater than 10 letters";
                  }
                },
              ),
            ),
            Center(
              child: DropdownButton(
                value: _currentCategory,
                items: categoriesDropDown, onChanged:changeSelectedCategory),),
            Expanded(
                child: ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context,index) {
                      return ListTile(
                        title: Text(categories[index]['category']),
                      );
                    }))
          ],
        ),
      ),
    );
  }

  void _getCategories() async {
    List<DocumentSnapshot> data = await _categoryService.getCategories();

    setState(() {
      categories = data;
    });
  }

  void changeSelectedCategory(String? selectedCategory) {
    setState(() {
      _currentCategory = selectedCategory!;
    });
  }
}
