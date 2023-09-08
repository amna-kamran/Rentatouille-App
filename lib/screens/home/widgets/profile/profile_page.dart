import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentatouille/constants/url.dart';
import 'package:rentatouille/screens/home/proprieter/widgets/request/proprieter_request.dart';
import 'package:rentatouille/screens/home/renter/widgets/request/renter_request.dart';
import 'package:rentatouille/screens/home/widgets/toggle_button.dart';
import 'package:rentatouille/services/auth/auth_provider.dart';
import 'package:rentatouille/services/auth/google%20auth/google_auth.dart';
import 'package:rentatouille/services/bottom_navbar_provider.dart';
import 'package:rentatouille/services/toggle_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final toggleProvider = Provider.of<ToggleProvider>(context);
    final bottomNavBarProvider =
        Provider.of<BottomNavigationBarProvider>(context);
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 54, 54, 54),
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 15, bottom: 40),
                    height: MediaQuery.of(context).size.height * 0.25,
                    color: toggleProvider.isProprietorMode
                        ? Colors.green
                        : Colors.black54,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 25,
                                backgroundImage: AssetImage(URL.missingImg),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                AuthProvider.getCurrentUserEmail().toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 20),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 40),
                          ListTile(
                            onTap: () {
                              debugPrint("requests");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      toggleProvider.isProprietorMode
                                          ? const ProprieterRequestScreen()
                                          : const RenterRequestScreen(),
                                ),
                              );
                            },
                            title: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Requests",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.green,
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              AuthProvider.logout();
                              GoogleAuthHelper.signOut();

                              debugPrint("Logout tapped");
                            },
                            title: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Logout",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.grey,
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.25 - 25,
                left: MediaQuery.of(context).size.width * 0.5 - 185,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  width: 370,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(0, 4),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Proprieter mode",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ToggleButtonApp(
                        initialValue: toggleProvider.isProprietorMode,
                        onToggle: (newValue) {
                          toggleProvider.toggleProprieterMode();
                          bottomNavBarProvider.resetIndex();
                        },
                        activeColor: Colors.green,
                        inactiveColor: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
