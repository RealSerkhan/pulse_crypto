import 'package:crypto_assessment/base/di/di_entry_point.dart';
import 'package:flutter/material.dart';
import 'package:crypto_assessment/features/market_data/presentation/blocs/market_data_cubit.dart';
import 'package:crypto_assessment/features/market_data/presentation/pages/market_data_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  late MarketDataCubit _marketDataCubit;

  final List<Widget> _pages = [
    const MarketDataScreen(),
    const Center(child: Text('Analytics')),
    const Center(child: Text('Portfolio')),
    const Center(child: Text('Settings')),
  ];

  @override
  void initState() {
    super.initState();
    // Load market data when home screen initializes

    _marketDataCubit = getIt<MarketDataCubit>();
    Future.microtask(() {
      _marketDataCubit.loadMarketData();
      _marketDataCubit.initWebSocket();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.show_chart), label: 'Market Data'),
          NavigationDestination(icon: Icon(Icons.analytics_outlined), label: 'Analytics'),
          NavigationDestination(icon: Icon(Icons.account_balance_wallet_outlined), label: 'Portfolio'),
          NavigationDestination(icon: Icon(Icons.settings_outlined), label: 'Settings'),
        ],
      ),
    );
  }
}
