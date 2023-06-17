import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controller/registration_controller.dart';
import 'create_task_screen.dart';
import 'package:google_maps/google_maps.dart' hide Icon hide Padding;
import 'dart:ui' as ui hide VoidCallback;
import 'dart:html' hide VoidCallback;

class DeliveryAgentDashboard extends StatefulWidget {
  const DeliveryAgentDashboard({super.key});

  @override
  State<DeliveryAgentDashboard> createState() => _DeliveryAgentDashboardState();
}

class _DeliveryAgentDashboardState extends State<DeliveryAgentDashboard> {
  Widget getMap() {
    String htmlId = "7";

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final myLatlng = new LatLng(30.2669444, -97.7427778);

      final mapOptions = new MapOptions()
        ..zoom = 8
        ..center = new LatLng(30.2669444, -97.7427778);

      final elem = DivElement()
        ..id = htmlId
        ..style.width = "100%"
        ..style.height = "100%"
        ..style.border = 'none';

      final map = new GMap(elem, mapOptions);

      Marker(MarkerOptions()
        ..position = myLatlng
        ..map = map
        ..title = 'Hello World!');

      return elem;
    });

    return HtmlElementView(viewType: htmlId);
  }

  final RegistrationController _registrationController =
      Get.put(RegistrationController());

  int? unassigned = 0;
  int? assigned = 0;
  int? completed = 0;

  int? free = 0;
  int? busy = 0;
  int? inactive = 0;

  String taskPage = 'unassigned';
  String agentPage = 'free';
  String team = 'Team 1';
  String photoImageUrl = "";

  String _selectedRole = "Role1";
  var rolesList = [
    "Role1",
    "Role2",
    "Role3",
  ];

  String _selectedTeam = "Team1";
  var teamList = [
    "Team1",
    "Team2",
    "Team3",
  ];

  String _selectedType = "Type1";
  var typeList = [
    "Type1",
    "Type2",
    "Type3",
  ];

  String _selectedGeoFence = "Geo1";
  var geoList = [
    "Geo1",
    "Geo2",
    "Geo3",
  ];

  List tags = [];

  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController teamcontroller = TextEditingController();
  TextEditingController rolecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController typecontroller = TextEditingController();
  TextEditingController geofencecontroller = TextEditingController();
  TextEditingController transportcontroller = TextEditingController();
  TextEditingController licensecontroller = TextEditingController();
  TextEditingController colorcontroller = TextEditingController();
  TextEditingController latitudecontroller = TextEditingController();
  TextEditingController longitudecontroller = TextEditingController();
  TextEditingController transportTypeController = TextEditingController();

  TextEditingController pancontroller = TextEditingController();
  TextEditingController aadhaarcontroller = TextEditingController();
  TextEditingController drivinglicensecontroller = TextEditingController();
  TextEditingController statuscontroller = TextEditingController();
  TextEditingController vehicleregistrationcontroller = TextEditingController();
  TextEditingController emergencycontactcontroller = TextEditingController();
  TextEditingController availabilitycontroller = TextEditingController();

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Delivery Agent Dashboard'), actions: [
        SizedBox(
          width: 400,
          child: Row(
            children: [
              _addTaskButton(),
              const SizedBox(
                width: 20,
              ),
              _addAgentButton(),
            ],
          ),
        ),
      ]),
      drawer: Drawer(
        child: _drawerMenuList(context),
      ),
      body: Stack(
        children: [
          _mapBackground(),
          Row(
            children: [
              _taskList(),
              _spacer(),
              _agentList(),
            ],
          ),
        ],
      ),
    );
  }

  ElevatedButton _addTaskButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CreateTask()),
        );
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          )),
      child: const Text("Create Task", style: TextStyle(color: Colors.black)),
    );
  }

  ElevatedButton _addAgentButton() {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Add Agent'),
            titlePadding: EdgeInsets.only(top: 8.0, left: 10),
            content: _addAgentForm(),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Decline'),
              ),
              TextButton(
                onPressed: () {
                  _registrationController.createDeliveryPersonRegistration(
                    phoneNumber: phonecontroller.text,
                    firstName: firstnamecontroller.text,
                    lastName: lastnamecontroller.text,
                    email: emailcontroller.text,
                    userName: usernamecontroller.text,
                    password: passwordcontroller.text,
                    team: _selectedTeam,
                    role: _selectedRole,
                    type: _selectedType,
                    geofence: _selectedGeoFence,
                    transportType: transportTypeController.text,
                    transportDescription: transportcontroller.text,
                    licensePlate: licensecontroller.text,
                    color: colorcontroller.text,
                    address: addresscontroller.text,
                    pan: pancontroller.text,
                    photo: photoImageUrl,
                    aadhaar: aadhaarcontroller.text,
                    drivingLicense: drivinglicensecontroller.text,
                    status: statuscontroller.text,
                    vehicleRegistration: vehicleregistrationcontroller.text,
                    emergencyContact: emergencycontactcontroller.text,
                    availability: false,
                  );
                  Navigator.pop(context);
                },
                child: const Text('Add'),
              ),
            ],
          ),
        );
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          )),
      child: const Text("Add Agents", style: TextStyle(color: Colors.black)),
    );
  }

  _addAgentForm() {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        width: MediaQuery.of(context).size.height * 0.8,
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Container(
            color: Colors.grey.withOpacity(0.1),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _addAgentRowFormField(
                    label1: "FIRST NAME",
                    label2: "LAST NAME",
                    controller1: firstnamecontroller,
                    controller2: lastnamecontroller,
                  ),
                  _addAgentRowFormField(
                    label1: "E MAIL",
                    label2: "PHONE",
                    controller1: emailcontroller,
                    controller2: phonecontroller,
                  ),
                  _addAgentRowFormField(
                    label1: "USER NAME",
                    label2: "PASSWORD",
                    controller1: usernamecontroller,
                    controller2: passwordcontroller,
                  ),
                  _addAgentRowFormField(
                    label1: "TAGS",
                    label2: "HOME ADDRESS",
                    // controller1: tag,
                    controller2: addresscontroller,
                  ),
                  _rolesAndTeamDropdown(setState),
                  _typeAndGeoFenceDropdown(setState),
                  // _addAgentRowFormField(
                  //   label1: "ASSIGN ROLE",
                  //   label2: "ASSIGN TO TEAM",
                  //   controller1: rolecontroller,
                  //   controller2: teamcontroller,
                  // ),
                  // _addAgentRowFormField(
                  //     label1: "TYPE",
                  //     label2: "GEO FENCE",
                  //     controller1: typecontroller,
                  //     controller2: geofencecontroller),
                  _addAgentRowFormField(
                      label1: "TRANSPORT DESCRIPTION (YEAR, MODEL))",
                      label2: "LICENSE PLATE",
                      controller1: transportcontroller,
                      controller2: licensecontroller),
                  _addAgentRowFormField(
                      label1: "TRANSPORT TYPE",
                      label2: "COLOR",
                      controller1: transportTypeController,
                      controller2: colorcontroller),
                  _sizedBoxVertical(),
                  if (photoImageUrl != "")
                    _imageNetwork()
                  else
                    _noImageContainer(),
                  _sizedBoxVertical(),
                  _uploadPhotoButton(),
                  _sizedBoxVertical(),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  ListTile _rolesAndTeamDropdown(StateSetter setState) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 200,
            child: DropdownButton(
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic),
              value: _selectedRole,
              items: rolesList
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedRole = value.toString();
                });
              },
              hint: const Text("ASSIGN ROLE"),
            ),
          ),
          SizedBox(
            width: 200,
            child: DropdownButton(
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic),
              value: _selectedTeam,
              items: teamList
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedTeam = value.toString();
                });
              },
              hint: const Text("ASSIGN TO TEAM"),
            ),
          ),
        ],
      ),
    );
  }

  ListTile _typeAndGeoFenceDropdown(StateSetter setState) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 200,
            child: DropdownButton(
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic),
              value: _selectedType,
              items: typeList
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedType = value.toString();
                });
              },
              hint: const Text("ASSIGN TYPE"),
            ),
          ),
          SizedBox(
            width: 200,
            child: DropdownButton(
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic),
              value: _selectedGeoFence,
              items: geoList
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedGeoFence = value.toString();
                });
              },
              hint: const Text("GEO FENCE"),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _sizedBoxVertical() {
    return const SizedBox(
      height: 10,
    );
  }

  ElevatedButton _uploadPhotoButton() {
    return ElevatedButton(
        onPressed: () async {
          if (phonecontroller.text.isEmpty) {
            return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Please enter phone number"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Ok'),
                    ),
                  ],
                );
              },
            );
          } else {
            String url = "";
            XFile? image = await selectPicture(ImageSource.gallery);
            String? path = image?.path;
            String? name = image?.name;
            if (image != null && path != null && name != null) {
              Uint8List imageData = await XFile(path).readAsBytes();
              FirebaseStorage storage = FirebaseStorage.instance;
              Reference ref = storage.ref().child(
                  "images/deliveryAgents/${phonecontroller.text}/$name-${DateTime.now()}");
              UploadTask uploadTask = ref.putData(imageData);
              uploadTask.then((res) async {
                url = await res.ref.getDownloadURL();

                setState(() {
                  photoImageUrl = url;
                });
              });
            }
          }
        },
        child: Text("Upload Photo"));
  }

  Container _noImageContainer() {
    return Container(
        height: 100.0,
        width: 100.0,
        color: Colors.grey.withOpacity(0.2),
        child: Center(
          child: Text(
            "No Image",
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.italic),
          ),
        ));
  }

  Image _imageNetwork() {
    return Image.network(
      photoImageUrl,
      height: 100.0,
      width: 100.0,
    );
  }

  ListTile _addAgentRowFormField(
      {String? label1 = "",
      String? label2 = "",
      TextEditingController? controller1,
      TextEditingController? controller2}) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 200,
            child: TextFormField(
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic),
              decoration: InputDecoration(
                labelText: label1,
              ),
              controller: controller1,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 200,
            child: TextFormField(
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic),
              decoration: InputDecoration(
                labelText: label2,
              ),
              controller: controller2,
            ),
          ),
        ],
      ),
    );
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

  Spacer _spacer() {
    return const Spacer(
      flex: 2,
    );
  }

  _taskList() {
    return Flexible(
      flex: 1,
      child: Container(
        color: Colors.white.withOpacity(0.8),
        child: Column(
          children: [
            _taskListTitle(),
            _taskTabController(),
            taskPage == 'unassigned'
                ? _unassignedTasks()
                : taskPage == 'assigned'
                    ? _assignedTasks()
                    : taskPage == 'completed'
                        ? _completedTasks()
                        : Container(),
          ],
        ),
      ),
    );
  }

  DefaultTabController _taskTabController() {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Container(
        color: Colors.grey.withOpacity(0.8),
        child: TabBar(
          onTap: (value) {
            setState(() {
              if (value == 0) {
                taskPage = 'unassigned';
              } else if (value == 1) {
                taskPage = 'assigned';
              } else if (value == 2) {
                taskPage = 'completed';
              }
            });
          },
          tabs: [
            Tab(text: '${unassigned ?? ""} Unassigned'),
            Tab(text: '${assigned ?? ""} Assigned'),
            Tab(text: '${completed ?? ""} Completed'),
          ],
        ),
      ),
    );
  }

  DefaultTabController _agentTabController() {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Container(
        color: Colors.grey.withOpacity(0.8),
        child: TabBar(
          onTap: (value) {
            setState(() {
              if (value == 0) {
                agentPage = 'free';
              } else if (value == 1) {
                agentPage = 'busy';
              } else if (value == 2) {
                agentPage = 'inactive';
              }
            });
          },
          tabs: [
            Tab(text: '${free ?? ""} Free'),
            Tab(text: '${busy ?? ""} Busy'),
            Tab(text: '${inactive ?? ""} Inactive'),
          ],
        ),
      ),
    );
  }

  Container _taskListTitle() {
    return Container(
      width: double.infinity,
      color: Colors.blue.withOpacity(0.8),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            'Task',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Container _agentListTitle() {
    return Container(
      width: double.infinity,
      color: Colors.blue.withOpacity(0.8),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            'Agents',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Center _mapBackground() {
    return Center(
      child: getMap(),
    );
  }

  ListView _drawerMenuList(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text('Famto Delivery Dashboard'),
        ),
        ListTile(
          title: const Text('Dashboard'),
          onTap: () {
            Navigator.pushNamed(context, '/delivery_agent_dashboard');
          },
        ),
        ListTile(
          title: const Text('Agents'),
          onTap: () {
            Navigator.pushNamed(context, '/delivery_agent_management');
          },
        ),
        ListTile(
          title: const Text('Customers'),
          onTap: () {
            Navigator.pushNamed(context, '/customer_management');
          },
        ),
        ListTile(
          title: const Text('Order Management'),
          onTap: () {
            Navigator.pushNamed(context, '/order_management');
          },
        ),
        ListTile(
          title: const Text('Delivery Person Dashboard'),
          onTap: () {
            Navigator.pushNamed(context, '/delivery_person_dashboard');
          },
        ),
        ListTile(
          title: const Text('Settings'),
          onTap: () {
            Navigator.pushNamed(context, '/settings');
          },
        ),
      ],
    );
  }

  _assignedTasks() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            'No tasks available',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  _completedTasks() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            'No tasks available',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _availableAgentsList() {
    return SizedBox(
      height: 300.0, // Change as per your requirement
      width: 300.0, // Change as per your requirement
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return const ListTile(
            title: Text('Agent007, India'),
            subtitle: Text('+91 9876543210'),
          );
        },
      ),
    );
  }

  _unassignedTasks() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'No tasks available',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Assign Agent'),
                    content: _availableAgentsList(),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('No'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Yes'),
                      ),
                    ],
                  ),
                );

                // showDialog(
                //   context: context,
                //   builder: (context) {
                //     return AlertDialog(
                //       title: const Text('Assign Agent'),
                //       content: Column(
                //         children: [
                //           ListView.builder(
                //               itemCount: 5,
                //               itemBuilder: (context, index) {
                //                 return ListTile(
                //                   title: Text('Agent Name'),
                //                   subtitle: Text('Agent Phone Number'),
                //                 );
                //               }),
                //           const Text(
                //               'Are you sure you want to assign this task to an agent?'),
                //         ],
                //       ),
                //       actions: [
                //         TextButton(
                //           onPressed: () {
                //             Navigator.pop(context);
                //           },
                //           child: const Text('No'),
                //         ),
                //         TextButton(
                //           onPressed: () {
                //             Navigator.pop(context);
                //           },
                //           child: const Text('Yes'),
                //         ),
                //       ],
                //     );
                //   },
                // );
              },
              child: const Text('Assign Agent')),
        ],
      ),
    );
  }

  _freeAgentsDetail() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            'No agents available',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  _busyAgentsDetail() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            'No agents available',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  _agentList() {
    return Flexible(
      flex: 1,
      child: Container(
        color: Colors.white.withOpacity(0.8),
        child: Column(
          children: [
            _agentListTitle(),
            _agentTabController(),
            agentPage == 'free'
                ? _freeAgentsDetail()
                : agentPage == 'busy'
                    ? _busyAgentsDetail()
                    : agentPage == 'inactive'
                        ? _inactiveAgentsDetail()
                        : Container(),
          ],
        ),
      ),
    );
  }

  _inactiveAgentsDetail() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            'No agents available',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
