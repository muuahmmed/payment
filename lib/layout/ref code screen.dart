import 'package:flutter/material.dart';
import 'package:payment/componets/constants.dart';
import 'package:payment/layout/toggle%20screen.dart';
import '../componets/components.dart';

class RefCodeScreen extends StatefulWidget {
  const RefCodeScreen({super.key});

  @override
  State<RefCodeScreen> createState() => _RefCodeScreenState();
}

class _RefCodeScreenState extends State<RefCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Center(
          child: Text(
            'Reference Code',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              navigateTo(context, const ToggleScreen());
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Go to any market to pay your bill',
                style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'This is your reference code',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 23,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 25),
              Container(
                width: double.infinity,
                height: 75,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    AOIConstants.refCode.isEmpty
                        ? 'Error'
                        : AOIConstants.refCode,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 75,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    'Please keep this code safe',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                    textAlign: TextAlign.center,
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
