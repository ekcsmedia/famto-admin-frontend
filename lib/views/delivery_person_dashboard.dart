import 'package:flutter/material.dart';

class DeliveryAgentDashboard extends StatefulWidget {
  const DeliveryAgentDashboard({super.key});

  @override
  State<DeliveryAgentDashboard> createState() => _DeliveryAgentDashboardState();
}

class _DeliveryAgentDashboardState extends State<DeliveryAgentDashboard> {
  int? unassigned = 0;
  int? assigned = 0;
  int? completed = 0;

  int? free = 0;
  int? busy = 0;
  int? inactive = 0;

  String taskPage = 'unassigned';
  String agentPage = 'free';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Delivery Agent Dashboard'), actions: [
        SizedBox(
          width: 600,
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text("Add Task", style: TextStyle(color: Colors.black)),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
              ),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child:
                    Text("Add Agents", style: TextStyle(color: Colors.black)),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
              ),
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
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.grey,
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
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
    return Container(
      height: 300.0, // Change as per your requirement
      width: 300.0, // Change as per your requirement
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
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
          Text(
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
                    title: Text('Assign Agent'),
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
