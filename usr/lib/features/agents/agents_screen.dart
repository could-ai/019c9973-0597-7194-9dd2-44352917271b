import 'package:flutter/material.dart';
import '../../shared/layout/main_layout.dart';

class AgentsScreen extends StatelessWidget {
  const AgentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      currentRoute: '/agents',
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Header with Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'AI Agents',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Manage your voice assistants and their behaviors',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('Create Agent'),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Agents Grid
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 400,
                  mainAxisExtent: 220,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return _buildAgentCard(context, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAgentCard(BuildContext context, int index) {
    final names = ['Sarah (Sales)', 'Mike (Support)', 'Elena (Survey)', 'Receptionist'];
    final roles = ['Real Estate Sales', 'Tech Support L1', 'NPS Collection', 'General Inbound'];
    final status = index == 1 ? 'Training' : 'Active';
    
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: index % 2 == 0 ? const Color(0xFFE0E7FF) : const Color(0xFFFEF3C7),
                    child: Icon(
                      Icons.smart_toy_outlined,
                      color: index % 2 == 0 ? const Color(0xFF3730A3) : const Color(0xFFD97706),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: status == 'Active' ? Colors.green.shade50 : Colors.amber.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      status,
                      style: TextStyle(
                        color: status == 'Active' ? Colors.green.shade700 : Colors.amber.shade800,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                names[index],
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                roles[index],
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('v1.2 • Updated 2h ago', style: TextStyle(color: Colors.grey[500], fontSize: 12)),
                  const Icon(Icons.arrow_forward, size: 16, color: Colors.grey),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
