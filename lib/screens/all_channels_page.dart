
import 'package:flutter/material.dart';

class AllChannelsPage extends StatelessWidget {
  AllChannelsPage({Key? key}) : super(key: key);

  // Dummy channels data
  final List<Map<String, dynamic>> channels = [
    {
      'profilePic':
          'https://yt3.ggpht.com/ytc/AAUvwniE2k5PgFu9yr4sBVEs9jdpdILdMc7ruiPw59DpS0k=s88-c-k-c0x00ffffff-no-rj',
      'name': 'Tech Channel',
    },
    {
      'profilePic':
          'https://yt3.ggpht.com/ytc/AAUvwniE2k5PgFu9yr4sBVEs9jdpdILdMc7ruiPw59DpS0k=s88-c-k-c0x00ffffff-no-rj',
      'name': 'DevLive',
    },
    {
      'profilePic':
          'https://yt3.ggpht.com/ytc/AAUvwniE2k5PgFu9yr4sBVEs9jdpdILdMc7ruiPw59DpS0k=s88-c-k-c0x00ffffff-no-rj',
      'name': 'Flutter Guru',
    },
    {
      'profilePic':
          'https://yt3.ggpht.com/ytc/AAUvwniE2k5PgFu9yr4sBVEs9jdpdILdMc7ruiPw59DpS0k=s88-c-k-c0x00ffffff-no-rj',
      'name': 'Code With Me',
    },
    {
      'profilePic':
          'https://yt3.ggpht.com/ytc/AAUvwniE2k5PgFu9yr4sBVEs9jdpdILdMc7ruiPw59DpS0k=s88-c-k-c0x00ffffff-no-rj',
      'name': 'UI Design Pro',
    },
    {
      'profilePic':
          'https://yt3.ggpht.com/ytc/AAUvwniE2k5PgFu9yr4sBVEs9jdpdILdMc7ruiPw59DpS0k=s88-c-k-c0x00ffffff-no-rj',
      'name': 'Data Science Hub',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Channels')),
      body: ListView.builder(
        itemCount: channels.length,
        itemBuilder: (context, index) {
          final channel = channels[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(channel['profilePic']),
            ),
            title: Text(channel['name']),
            trailing: GestureDetector(
              onTap: () {
                _showNotificationOptions(context); // Pass context to show bottom sheet
              },
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 42, 42, 42), // Light grey background color
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.notifications_outlined,
                      color: Color.fromARGB(255, 210, 210, 210), // Icon color
                    ),
                    //const SizedBox(width: 2), // Space between the icon and caret
                    const Icon(
                      Icons.arrow_drop_down, // Downward caret
                      color: Colors.black, // Icon color
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Function to show the notification options bottom sheet
  void _showNotificationOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Text(
                    'Notifications',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildOption(context, 'All', Icons.notifications_active),
              
              _buildOption(context, 'Personalized', Icons.notifications_active),
              
              _buildOption(context, 'None', Icons.notifications_off),
              const Divider(),
              _buildOption(context, 'Unsubscribed', Icons.cancel),
            ],
          ),
        );
      },
    );
  }

  // Helper function to build the notification option row
  Widget _buildOption(BuildContext context, String label, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey), // Set icon color to grey
      title: Text(label),
      onTap: () {
        // Close the bottom sheet when an option is selected
        Navigator.pop(context);
      },
    );
  }
}









/*import 'package:flutter/material.dart';

class AllChannelsPage extends StatelessWidget {
  AllChannelsPage({Key? key}) : super(key: key);

  // Dummy channels data
  final List<Map<String, dynamic>> channels = [
    {
      'profilePic':
          'https://yt3.ggpht.com/ytc/AAUvwniE2k5PgFu9yr4sBVEs9jdpdILdMc7ruiPw59DpS0k=s88-c-k-c0x00ffffff-no-rj',
      'name': 'Tech Channel',
    },
    {
      'profilePic':
          'https://yt3.ggpht.com/ytc/AAUvwniE2k5PgFu9yr4sBVEs9jdpdILdMc7ruiPw59DpS0k=s88-c-k-c0x00ffffff-no-rj',
      'name': 'DevLive',
    },
    {
      'profilePic':
          'https://yt3.ggpht.com/ytc/AAUvwniE2k5PgFu9yr4sBVEs9jdpdILdMc7ruiPw59DpS0k=s88-c-k-c0x00ffffff-no-rj',
      'name': 'Flutter Guru',
    },
    {
      'profilePic':
          'https://yt3.ggpht.com/ytc/AAUvwniE2k5PgFu9yr4sBVEs9jdpdILdMc7ruiPw59DpS0k=s88-c-k-c0x00ffffff-no-rj',
      'name': 'Code With Me',
    },
    {
      'profilePic':
          'https://yt3.ggpht.com/ytc/AAUvwniE2k5PgFu9yr4sBVEs9jdpdILdMc7ruiPw59DpS0k=s88-c-k-c0x00ffffff-no-rj',
      'name': 'UI Design Pro',
    },
    {
      'profilePic':
          'https://yt3.ggpht.com/ytc/AAUvwniE2k5PgFu9yr4sBVEs9jdpdILdMc7ruiPw59DpS0k=s88-c-k-c0x00ffffff-no-rj',
      'name': 'Data Science Hub',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Channels')),
      body: ListView.builder(
        itemCount: channels.length,
        itemBuilder: (context, index) {
          final channel = channels[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(channel['profilePic']),
            ),
            title: Text(channel['name']),
            trailing: IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                _showNotificationOptions(context); // Passing context here
              },
            ),
          );
        },
      ),
    );
  }

  // Function to show the notification options bottom sheet
  void _showNotificationOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Text(
                    'Notifications',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildOption(context, 'All', Icons.notifications_active), // Added 'All' option
              
              _buildOption(context, 'Personalized', Icons.notifications),
              
              _buildOption(context, 'None', Icons.notifications_off),
              const Divider(),
              _buildOption(context, 'Unsubscribed', Icons.person_off),
            ],
          ),
        );
      },
    );
  }

  // Helper function to build the notification option row
  Widget _buildOption(BuildContext context, String label, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey), // Set icon color to grey
      title: Text(label),
      onTap: () {
        // Close the bottom sheet when an option is selected
        Navigator.pop(context);
      },
    );
  }
}
*/