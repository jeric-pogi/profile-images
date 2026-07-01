import 'package:flutter/cupertino.dart';

void main() => runApp(const MyApp());

const String studentAPhotoUrl =
    'https://raw.githubusercontent.com/kyatto-sys/profile-images/main/JEK.jpg';
const String studentBPhotoUrl =
    'https://raw.githubusercontent.com/kyatto-sys/profile-images/main/ID%20Pic.png';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Cupertino Profile',
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.systemBlue,
        brightness: Brightness.light,
      ),
      home: RootTabScaffold(),
    );
  }
}

class RootTabScaffold extends StatelessWidget {
  const RootTabScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_2_fill),
            label: 'Profiles',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Settings',
          ),
        ],
      ),
      tabBuilder: (context, index) {
  if (index == 0) {
    return CupertinoTabView(builder: (_) => const ProfilesPage());
  } else {
    return CupertinoTabView(builder: (_) => const SettingsPage());
  }
},
    );
  }
}

class ProfilesPage extends StatefulWidget {
  const ProfilesPage({super.key});

  @override
  State<ProfilesPage> createState() => _ProfilesPageState();
}

class _ProfilesPageState extends State<ProfilesPage> {
  bool _jekOnline = true;
  bool _katrinaOnline = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Student Profiles'),
      ),
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Laboratory Activity #2 Pair',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.label,
                  ),
                ),
                const SizedBox(height: 24),

                _buildProfileCard(
                  name: 'Jeric M. Rose',
                  role: 'Material Design',
                  photoUrl: studentAPhotoUrl,
                  isOnline: _jekOnline,
                  onStatusTap: () => setState(() => _jekOnline = !_jekOnline),
                ),

                const SizedBox(height: 20),

                _buildProfileCard(
                  name: 'Katrina Angel B. Farofaldane',
                  role: 'Cupertino Design',
                  photoUrl: studentBPhotoUrl,
                  isOnline: _katrinaOnline,
                  onStatusTap: () =>
                      setState(() => _katrinaOnline = !_katrinaOnline),
                ),

                const SizedBox(height: 32),

                CupertinoButton.filled(
                  onPressed: () {
                    showCupertinoDialog(
                      context: context,
                      builder: (context) => CupertinoAlertDialog(
                        title: const Text('Hello!'),
                        content: const Text(
                          'This is the Cupertino Interface de gozaruuu.',
                        ),
                        actions: [
                          CupertinoDialogAction(
                            child: const Text('OK'),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text('View Details'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard({
    required String name,
    required String role,
    required String photoUrl,
    required bool isOnline,
    required VoidCallback onStatusTap,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: CupertinoColors.secondarySystemBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              ClipOval(
                child: Image.network(
                  photoUrl,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    CupertinoIcons.person_crop_circle_fill,
                    size: 70,
                    color: CupertinoColors.systemGrey,
                  ),
                ),
              ),
              // ===== online or nah =====
              Positioned(
                right: 2,
                bottom: 2,
                child: GestureDetector(
                  onTap: onStatusTap,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: isOnline
                          ? CupertinoColors.activeGreen
                          : CupertinoColors.systemGrey,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: CupertinoColors.secondarySystemBackground,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: CupertinoColors.label,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      CupertinoIcons.paintbrush_fill,
                      size: 16,
                      color: CupertinoColors.systemBlue,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      role,
                      style: const TextStyle(
                        fontSize: 14,
                        color: CupertinoColors.systemGrey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  isOnline ? 'Online' : 'Offline',
                  style: TextStyle(
                    fontSize: 12,
                    color: isOnline
                        ? CupertinoColors.activeGreen
                        : CupertinoColors.systemGrey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ===== Extra Cupertino Explorationnnnnnn Settings =====
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _availableForGroupWork = true;
  double _focusLevel = 0.7;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Settings'),
      ),
      child: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 16),
            CupertinoListSection.insetGrouped(
              header: const Text('Availability'),
              children: [
                CupertinoListTile(
                  title: const Text('Available for group work'),
                  trailing: CupertinoSwitch(
                    value: _availableForGroupWork,
                    onChanged: (value) {
                      setState(() => _availableForGroupWork = value);
                    },
                  ),
                ),
              ],
            ),
            CupertinoListSection.insetGrouped(
              header: const Text('Happiness Meter'),
              footer: Text(
                'Current happiness: ${(_focusLevel * 100).round()}%',
              ),
              children: [
                CupertinoListTile(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  title: const Text('Drag to adjust'),
                  subtitle: CupertinoSlider(
                    value: _focusLevel,
                    onChanged: (value) {
                      setState(() => _focusLevel = value);
                    },
                  ),
                ),
              ],
            ),
            CupertinoListSection.insetGrouped(
              header: const Text('About'),
              children: const [
                CupertinoListTile(
                  leading: Icon(CupertinoIcons.info_circle),
                  title: Text('Laboratory Activity #2'),
                  subtitle: Text('Cupertino Design Interface'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}