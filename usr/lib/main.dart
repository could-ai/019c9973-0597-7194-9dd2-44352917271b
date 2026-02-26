import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/theme/app_theme.dart';
import 'features/dashboard/dashboard_screen.dart';
import 'features/agents/agents_screen.dart';
import 'shared/layout/main_layout.dart';

void main() {
  runApp(const CouldAIApp());
}

class CouldAIApp extends StatelessWidget {
  const CouldAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lovable Platform',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ru'),
        Locale('en'),
        Locale('zh'),
      ],
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardScreen(),
        '/agents': (context) => const AgentsScreen(),
        '/campaigns': (context) => const PlaceholderScreen(title: 'Campaigns', route: '/campaigns'),
        '/flows': (context) => const PlaceholderScreen(title: 'Flow Builder', route: '/flows'),
        '/contacts': (context) => const PlaceholderScreen(title: 'Contacts', route: '/contacts'),
        '/analytics': (context) => const PlaceholderScreen(title: 'Analytics', route: '/analytics'),
        '/billing': (context) => const PlaceholderScreen(title: 'Billing', route: '/billing'),
        '/integrations': (context) => const PlaceholderScreen(title: 'Integrations', route: '/integrations'),
        '/settings': (context) => const PlaceholderScreen(title: 'Settings', route: '/settings'),
        '/support': (context) => const PlaceholderScreen(title: 'Help & Support', route: '/support'),
      },
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  final String title;
  final String route;

  const PlaceholderScreen({super.key, required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      currentRoute: route,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.construction, size: 64, color: Colors.grey[300]),
            const SizedBox(height: 16),
            Text(
              '$title Coming Soon',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.grey[500]),
            ),
          ],
        ),
      ),
    );
  }
}
