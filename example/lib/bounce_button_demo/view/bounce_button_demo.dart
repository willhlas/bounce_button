import 'package:bounce_button/bounce_button.dart';
import 'package:flutter/material.dart';

class BounceButtonDemo extends StatelessWidget {
  const BounceButtonDemo({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Bounce Button Demo', 
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: BounceButton(
          onTap: () {},
          height: 50,
          color: const Color(0xFF13B9FF),
          width: MediaQuery.of(context).size.width / 2,
          borderRadius: BorderRadius.circular(60),
          elevation: 2,
          child: const Center(
            child: Text(
              'Tap me', 
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
