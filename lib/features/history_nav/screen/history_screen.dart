import 'package:eco_route/core/constants/app_colors.dart';
import 'package:eco_route/core/constants/app_text_style.dart';
import 'package:eco_route/features/history_nav/screen/widget/custom_history_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryScreen extends ConsumerStatefulWidget {
  const HistoryScreen({super.key});

  @override
  ConsumerState<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen> {
  final List<Map<String, dynamic>> historyData = [
    {
      'icon': Icons.work_outline,
      'route': 'Home → Office',
      'date': '18 Jun 2026',
      'time': '09:10 AM',
      'km': 6,
      'min': 18.0,
      'aqi': 42,
      'status': 'Good',
    },

    {
      'icon': Icons.school_outlined,
      'route': 'Home → College',
      'date': '17 Jun 2026',
      'time': '08:30 AM',
      'km': 8,
      'min': 22.0,
      'aqi': 68,
      'status': 'Moderate',
    },

    {
      'icon': Icons.shopping_bag_outlined,
      'route': 'Home → Mall',
      'date': '16 Jun 2026',
      'time': '06:45 PM',
      'km': 12,
      'min': 30.0,
      'aqi': 95,
      'status': 'Poor',
    },

    {
      'icon': Icons.local_hospital_outlined,
      'route': 'Home → Hospital',
      'date': '15 Jun 2026',
      'time': '11:15 AM',
      'km': 4,
      'min': 10.0,
      'aqi': 35,
      'status': 'Good',
    },

    {
      'icon': Icons.park_outlined,
      'route': 'Morning Walk',
      'date': '14 Jun 2026',
      'time': '06:00 AM',
      'km': 3,
      'min': 12.0,
      'aqi': 50,
      'status': 'Moderate',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        title: Text('Route History', style: AppTextStyles.appBarTitle),
      ),

      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            '${historyData.length}',
                            style: AppTextStyles.largeNumber,
                          ),
                          Text('Total Routes', style: AppTextStyles.caption),
                        ],
                      ),
                    ),

                    Container(width: 1, height: 40, color: AppColors.divider),

                    Expanded(
                      child: Column(
                        children: [
                          Text('18', style: AppTextStyles.largeNumber),
                          Text('Eco Trips', style: AppTextStyles.caption),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text('Recent Routes', style: AppTextStyles.subHeading),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: historyData.length,
                itemBuilder: (context, index) {
                  final item = historyData[index];

                  return historyRouteCard(
                    icon: item['icon'],
                    route: item['route'],
                    date: item['date'],
                    time: item['time'],
                    km: item['km'],
                    min: item['min'],
                    aqi: item['aqi'],
                    status: item['status'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
