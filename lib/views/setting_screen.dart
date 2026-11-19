import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/model/user_settings.dart';
import 'package:southsea_cinema/widgets/basket_button.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String prefName = 'user_name';
const String prefAddress = 'user_address';
const String prefEmail = 'user_email';
const String prefNewsletter = 'user_newsletter';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() {
    return _SettingsScreenState();
  }
}

class _SettingsScreenState extends State<SettingsScreen> {
  late TextEditingController _nameController;
  late TextEditingController _addressController;
  late TextEditingController _emailController;
  bool _receiveNewsletter = false;
  String _confirmationMessage = '';

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _addressController = TextEditingController();
    _emailController = TextEditingController();
    _loadSettings();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _saveSettings() async {
    final String name = _nameController.text.trim();
    final String address = _addressController.text.trim();
    final String email = _emailController.text.trim();
    final SharedPreferencesAsync prefs = SharedPreferencesAsync();
    await prefs.setString(prefName, name);
    await prefs.setString(prefAddress, address);
    await prefs.setString(prefEmail, email);
    await prefs.setBool(prefNewsletter, _receiveNewsletter);

    if (!mounted) {
      return;
    }

    final UserSettings settings = UserSettings(
      name: name,
      address: address,
      email: email,
      receiveNewsletter: _receiveNewsletter,
    );

    setState(() {
      _confirmationMessage = 'Settings saved for ${settings.name}';
    });
  }

  Future<void> _loadSettings() async {
    final SharedPreferencesAsync prefs = SharedPreferencesAsync();
    final String? savedName = await prefs.getString(prefName);
    final String? savedAddress = await prefs.getString(prefAddress);
    final String? savedEmail = await prefs.getString(prefEmail);
    final bool? savedNewsletter = await prefs.getBool(prefNewsletter);

    if (!mounted) {
      return;
    }

    setState(() {
      _nameController.text = savedName ?? '';
      _addressController.text = savedAddress ?? '';
      _emailController.text = savedEmail ?? '';
      _receiveNewsletter = savedNewsletter ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData settingsTheme = Theme.of(context).copyWith(
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: cinemaFontWhite,
            displayColor: cinemaFontWhite,
          ),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(color: cinemaFontWhite),
        hintStyle: TextStyle(color: cinemaFontMuted),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: cinemaFontMuted),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: cinemaBrand, width: 2),
        ),
      ),
    );

    return Theme(
      data: settingsTheme,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle, style: cinemaHeaderStyle),
          actions: const [BasketButton()],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Customer Profile",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Full name',
                  hintText: 'Enter your name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _addressController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Delivery address',
                  hintText: 'Enter delivery address',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email address',
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Expanded(
                    child: Text('Receive newsletter and offers'),
                  ),
                  Switch(
                    value: _receiveNewsletter,
                    onChanged: (bool value) {
                      setState(() {
                        _receiveNewsletter = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: PrimaryButton(
                  label: 'Save Settings',
                  onPressed: _saveSettings,
                ),
              ),
              if (_confirmationMessage.isNotEmpty) ...[
                const SizedBox(height: 12),
                Text(
                  _confirmationMessage,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
