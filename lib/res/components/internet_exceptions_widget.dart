import 'package:flutter/material.dart';
class InternetExceptionsWidget extends StatelessWidget {
  final VoidCallback? onRetryTap;
  const InternetExceptionsWidget({super.key, required this.onRetryTap});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
      child: Column(
        children: [
          Icon(Icons.cloud_off, size: 50, color: Colors.red),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: Text(
                'No Internet',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Please check your internet connection and try again.',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: height * 0.2),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: onRetryTap,
            child: const Text('Retry', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
