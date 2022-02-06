import 'package:e_commerce/Services/add_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Page { dashboard, manage }

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  Page _selectedPage = Page.dashboard;
  MaterialColor active = Colors.red;
  MaterialColor notActive = Colors.green;
  static TextEditingController categoryController = TextEditingController();
  static TextEditingController brandController = TextEditingController();
  final GlobalKey<FormState> _categoryformKey = GlobalKey();
  final GlobalKey<FormState> _brandformKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextButton.icon(
                onPressed: () {
                  setState(() {
                    _selectedPage = Page.dashboard;
                  });
                },
                icon: Icon(
                  Icons.dashboard,
                  color: _selectedPage == Page.dashboard ? active : notActive,
                ),
                label: const Text("Dashboard"),
              ),
            ),
            Expanded(
              child: TextButton.icon(
                onPressed: () {
                  setState(() {
                    _selectedPage = Page.manage;
                  });
                },
                icon: Icon(
                  Icons.sort,
                  color: _selectedPage == Page.manage ? active : notActive,
                ),
                label: const Text("Manage"),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: _loadScreen(),
    );
  }

  Widget _loadScreen() {
    switch (_selectedPage) {
      case Page.dashboard:
        return Column(
          children: [
            ListTile(
              subtitle: TextButton.icon(
                  onPressed: null,
                  icon: const Icon(
                    FontAwesomeIcons.rupeeSign,
                    size: 30,
                    color: Colors.green,
                  ),
                  label: const Text(
                    "12000",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30.0, color: Colors.green),
                  )),
              title: const Text(
                "Revenue",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0, color: Colors.grey),
              ),
            ),
            Expanded(
                child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Card(
                    child: ListTile(
                      title: TextButton.icon(
                          onPressed: null,
                          icon: const Icon(Icons.people_outline),
                          label: const Text("Users")),
                      subtitle: const Text(
                        "7",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.red, fontSize: 60.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Card(
                    child: ListTile(
                      title: TextButton.icon(
                          onPressed: null,
                          icon: const Icon(Icons.category),
                          label: const Text("Categories")),
                      subtitle: const Text(
                        "23",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.red, fontSize: 60.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Card(
                    child: ListTile(
                      title: TextButton.icon(
                          onPressed: null,
                          icon: const Icon(Icons.track_changes),
                          label: const Text("Products")),
                      subtitle: const Text(
                        "120",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.red, fontSize: 60.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Card(
                    child: ListTile(
                      title: TextButton.icon(
                          onPressed: null,
                          icon: const Icon(Icons.tag_faces),
                          label: const Text("Sold")),
                      subtitle: const Text(
                        "14",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.red, fontSize: 60.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Card(
                    child: ListTile(
                      title: TextButton.icon(
                          onPressed: null,
                          icon: const Icon(Icons.shopping_cart),
                          label: const Text("Orders")),
                      subtitle: const Text(
                        "5",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.red, fontSize: 60.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Card(
                    child: ListTile(
                      title: TextButton.icon(
                          onPressed: null,
                          icon: const Icon(Icons.close),
                          label: const Text("Return")),
                      subtitle: const Text(
                        "0",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.red, fontSize: 60.0),
                      ),
                    ),
                  ),
                ),
              ],
            ))
          ],
        );

      case Page.manage:
        return ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text("Add Products"),
              onTap: () {
                Navigator.push(
                  context,
                MaterialPageRoute(builder: (context)=>const AddProducts()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.change_history),
              title: const Text("Product List"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.add_circle),
              title: const Text("Add Category"),
              onTap: () {
                _categoryAlert();
              },
            ),
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text("Category List"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.add_circle_outline_rounded),
              title: const Text("Add Brand "),
              onTap: () {
                _brandAlert();
              },
            ),
            ListTile(
              leading: const Icon(Icons.library_books),
              title: const Text("Brand List"),
              onTap: () {},
            ),
          ],
        );
    }
  }

  void _categoryAlert() {
    var alert = AlertDialog(
      content: Form(
        key: _categoryformKey,
        child: TextFormField(
          controller: categoryController,
          validator: (value) {
            if (value!.isEmpty) {
              return "Category cannot be empty ";
            }
          },
          decoration: const InputDecoration(hintText: "Add Category"),
        ),
      ),
      actions: [
        TextButton(onPressed: () {
          
        }, child: const Text("ADD")),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("CANCEL")),
      ],
    );
    showDialog(context: context, builder: (context) => alert);
  }

  void _brandAlert() {
    var alert = AlertDialog(
      content: Form(
        key: _brandformKey,
        child: TextFormField(
          controller: brandController,
          validator: (value) {
            if (value!.isEmpty) {
              return "Brand cannot be empty ";
            }
          },
          decoration: const InputDecoration(hintText: "Add Brand"),
        ),
      ),
      actions: [
        TextButton(onPressed: () {}, child: const Text("ADD")),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("CANCEL")),
      ],
    );
    showDialog(context: context, builder: (context) => alert);
  }
}
