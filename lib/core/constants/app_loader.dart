import 'dart:async';
import 'package:flutter/material.dart';

class EcoRouteLoader extends StatefulWidget {
  const EcoRouteLoader({super.key});

  @override
  State<EcoRouteLoader> createState() => _EcoRouteLoaderState();
}

class _EcoRouteLoaderState extends State<EcoRouteLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Timer _timer;

  final List<String> messages = [
    'Analyzing Air Quality...',
    'Finding Healthiest Route...',
    'Checking Pollution Levels...',
    'Comparing Available Routes...',
    'Preparing Eco Route...',
  ];

  int currentMessage = 0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _timer = Timer.periodic(const Duration(seconds: 2), (_) {
      if (!mounted) return;

      setState(() {
        currentMessage = (currentMessage + 1) % messages.length;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black38,
      child: Center(
        child: Container(
          width: 320,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'EcoRoute',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2E7D32),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 60,
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          left: 0,
                          child: Icon(
                            Icons.location_on,
                            color: Colors.red.shade400,
                            size: 28,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: const Icon(
                            Icons.flag,
                            color: Color(0xFF2E7D32),
                            size: 24,
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 3,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 24,
                              ),
                              color: Colors.green.shade100,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 24 + (_controller.value * 220),
                          child: const Text(
                            '🌱',
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: Text(
                  messages[currentMessage],
                  key: ValueKey(messages[currentMessage]),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              LinearProgressIndicator(
                borderRadius: BorderRadius.circular(100),
                minHeight: 8,
                color: const Color(0xFF2E7D32),
                backgroundColor: Colors.green.shade100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
