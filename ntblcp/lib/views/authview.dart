import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ntblcp/main.dart';
import 'package:ntblcp/providers/dataprovider.dart';

class AuthView extends ConsumerWidget {
  AuthView({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 30),
            child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    hintText: "Enter email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))))),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 30),
            child: TextFormField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                    hintText: "Enter password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 30),
          child: ElevatedButton(
            onPressed: () async {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) {
                return MainContent(email: emailController.text);
              }));
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                minimumSize: const Size(double.infinity, 65)),
            child: const Text("Log in"),
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            await ref.watch(createTestUsersProvider.future);
          },
          child: const Text("Update inv"),
        ),
        ElevatedButton(
          onPressed: () async {
            // await ref.watch(getPendingDeliveryProvider.future);
          },
          child: const Text("get users"),
        )
      ],
    )));
  }
}
