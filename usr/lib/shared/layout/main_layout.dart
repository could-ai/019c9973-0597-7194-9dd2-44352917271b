import 'package:flutter/material.dart';
import '../../features/dashboard/dashboard_screen.dart';
import '../../features/agents/agents_screen.dart';

class MainLayout extends StatefulWidget {
  final Widget child;
  final String currentRoute;

  const MainLayout({
    super.key,
    required this.child,
    required this.currentRoute,
  });

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  bool _isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      body: Row(
        children: [
          if (isDesktop)
            _buildSidebar(context),
          Expanded(
            child: Column(
              children: [
                _buildHeader(context, !isDesktop),
                Expanded(
                  child: widget.child,
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: !isDesktop ? Drawer(child: _buildSidebarContent(context)) : null,
    );
  }

  Widget _buildHeader(BuildContext context, bool showMenuButton) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFE5E7EB))),
      ),
      child: Row(
        children: [
          if (showMenuButton)
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          if (!showMenuButton) ...[
             // Breadcrumbs or Title could go here
             Text(
               _getPageTitle(widget.currentRoute),
               style: Theme.of(context).textTheme.titleMedium?.copyWith(
                 fontWeight: FontWeight.w600,
               ),
             ),
          ],
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          const SizedBox(width: 12),
          const CircleAvatar(
            backgroundColor: Color(0xFFE0E7FF),
            child: Text('AD', style: TextStyle(color: Color(0xFF3730A3))),
          ),
        ],
      ),
    );
  }

  String _getPageTitle(String route) {
    switch (route) {
      case '/': return 'Dashboard';
      case '/agents': return 'Agents';
      case '/campaigns': return 'Campaigns';
      case '/flows': return 'Flow Builder';
      case '/analytics': return 'Analytics';
      case '/billing': return 'Billing';
      default: return 'Lovable Platform';
    }
  }

  Widget _buildSidebar(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: _isCollapsed ? 72 : 250,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(right: BorderSide(color: Color(0xFFE5E7EB))),
      ),
      child: Column(
        children: [
          Container(
            height: 64,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: _isCollapsed ? 16 : 24),
            child: Row(
              children: [
                const Icon(Icons.auto_awesome, color: Color(0xFF4F46E5), size: 28),
                if (!_isCollapsed) ...[
                  const SizedBox(width: 12),
                  const Text(
                    'Lovable',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF111827),
                    ),
                  ),
                ],
              ],
            ),
          ),
          Expanded(child: _buildSidebarContent(context)),
          IconButton(
            icon: Icon(_isCollapsed ? Icons.chevron_right : Icons.chevron_left),
            onPressed: () {
              setState(() {
                _isCollapsed = !_isCollapsed;
              });
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildSidebarContent(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      children: [
        _buildNavItem(context, icon: Icons.dashboard_outlined, label: 'Dashboard', route: '/'),
        _buildNavItem(context, icon: Icons.support_agent, label: 'Agents', route: '/agents'),
        _buildNavItem(context, icon: Icons.campaign_outlined, label: 'Campaigns', route: '/campaigns'),
        _buildNavItem(context, icon: Icons.schema_outlined, label: 'Flows', route: '/flows'),
        _buildNavItem(context, icon: Icons.contacts_outlined, label: 'Contacts', route: '/contacts'),
        const Divider(height: 32),
        _buildNavItem(context, icon: Icons.bar_chart_outlined, label: 'Analytics', route: '/analytics'),
        _buildNavItem(context, icon: Icons.credit_card_outlined, label: 'Billing', route: '/billing'),
        _buildNavItem(context, icon: Icons.integration_instructions_outlined, label: 'Integrations', route: '/integrations'),
        const Divider(height: 32),
        _buildNavItem(context, icon: Icons.settings_outlined, label: 'Settings', route: '/settings'),
        _buildNavItem(context, icon: Icons.help_outline, label: 'Help & Support', route: '/support'),
      ],
    );
  }

  Widget _buildNavItem(BuildContext context, {required IconData icon, required String label, required String route}) {
    final isSelected = widget.currentRoute == route;
    final isDesktop = MediaQuery.of(context).size.width > 800;
    
    return InkWell(
      onTap: () {
        if (widget.currentRoute != route) {
          Navigator.of(context).pushReplacementNamed(route);
        } else if (!isDesktop) {
           // Close drawer on mobile if same route
           Navigator.of(context).pop(); 
        }
      },
      child: Container(
        height: 48,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFEEF2FF) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? const Color(0xFF4F46E5) : const Color(0xFF6B7280),
              size: 22,
            ),
            if (!_isCollapsed) ...[
              const SizedBox(width: 12),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? const Color(0xFF4F46E5) : const Color(0xFF374151),
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
