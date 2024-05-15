import 'package:flutter/material.dart';

class ClientRequestsScreen extends StatefulWidget {
  const ClientRequestsScreen({super.key});

  @override
  State<ClientRequestsScreen> createState() => _ClientRequestsScreenState();
}

class _ClientRequestsScreenState extends State<ClientRequestsScreen> {
  bool _showActions = false;
  late Client _selectedClient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Requests'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: clients.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(clients[index].profilePic),
                ),
                title: Text(clients[index].name),
                subtitle: Text(clients[index].serviceType),
                trailing: IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {
                    setState(() {
                      _showBottomSheet(context, clients[index]);
                    });
                  },
                ),
                onTap: () {
                  setState(() {
                    _showActions = true;
                    _selectedClient = clients[index];
                  });
                },
              ),
              if (_showActions && _selectedClient == clients[index]) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Handle accept action
                        Navigator.pop(context);
                      },
                      child: const Text('Accept'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Handle decline action
                        Navigator.pop(context);
                      },
                      child: const Text('Decline'),
                    ),
                  ],
                ),
              ],
            ],
          );
        },
      ),
    );
  }

  void _showBottomSheet(BuildContext context, Client client) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: const Text('Edit'),
              onTap: () {
                // Handle edit action
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Edit And Accecpt'),
              onTap: () {
                // Handle edit action
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('View Complete Profile'),
              onTap: () {
                // Handle view profile action
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}

class Client {
  final String name;
  final String profilePic;
  final String serviceType;

  Client({required this.name, required this.profilePic, required this.serviceType});
}

List<Client> clients = [
  Client(name: 'John Doe', profilePic: 'assets/profiles/john.jpg', serviceType: 'Plumbing'),
  Client(name: 'Jane Smith', profilePic: 'assets/profiles/jane.jpg', serviceType: 'Electrical'),
  Client(name: 'Alice Johnson', profilePic: 'assets/profiles/alice.jpg', serviceType: 'Carpentry'),
];
