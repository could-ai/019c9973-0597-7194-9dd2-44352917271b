import 'package:flutter/material.dart';
import '../../shared/layout/main_layout.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      currentRoute: '/',
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Overview',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('New Campaign'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // KPI Cards
            Row(
              children: [
                Expanded(child: _buildKpiCard(context, 'Total Calls', '1,248', '+12%', Icons.phone_in_talk)),
                const SizedBox(width: 16),
                Expanded(child: _buildKpiCard(context, 'Avg. Duration', '1m 42s', '-5%', Icons.timer)),
                const SizedBox(width: 16),
                Expanded(child: _buildKpiCard(context, 'Conversion', '24.8%', '+2.4%', Icons.trending_up)),
                const SizedBox(width: 16),
                Expanded(child: _buildKpiCard(context, 'Cost', '₽ 4,320', '', Icons.attach_money)),
              ],
            ),
            
            const SizedBox(height: 32),
            
            // Recent Activity / Campaigns Placeholder
            Text(
              'Active Campaigns',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                separatorBuilder: (context, index) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue.shade50,
                      child: const Icon(Icons.campaign, color: Colors.blue),
                    ),
                    title: Text('Cold Outreach #${100 + index}'),
                    subtitle: const Text('Real Estate • Outbound'),
                    trailing: Chip(
                      label: const Text('Active', style: TextStyle(fontSize: 12)),
                      backgroundColor: Colors.green.shade50,
                      labelStyle: TextStyle(color: Colors.green.shade700),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKpiCard(BuildContext context, String title, String value, String trend, IconData icon) {
    final isPositive = trend.startsWith('+');
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[600])),
                Icon(icon, color: Colors.grey[400], size: 20),
              ],
            ),
            const SizedBox(height: 12),
            Text(value, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
            if (trend.isNotEmpty) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                    size: 14,
                    color: isPositive ? Colors.green : Colors.red,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    trend,
                    style: TextStyle(
                      color: isPositive ? Colors.green : Colors.red,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text('vs last month', style: TextStyle(color: Colors.grey[500], fontSize: 12)),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
