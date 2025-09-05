import 'package:flutter/material.dart';
import 'package:myapp/screens/admin/products_tab.dart';
import 'package:myapp/screens/admin/orders_tab.dart';
import 'package:myapp/screens/admin/users_tab.dart';
import 'package:myapp/screens/admin/reports_tab.dart';
import 'package:myapp/screens/admin/categories_tab.dart';
import 'package:myapp/screens/admin/townships_tab.dart';
import 'package:myapp/screens/admin/announcements_tab.dart';
import 'package:myapp/screens/admin/settings_tab.dart';

class AdminPanelScreen extends StatefulWidget {
  const AdminPanelScreen({super.key});

  @override
  State<AdminPanelScreen> createState() => _AdminPanelScreenState();
}

class _AdminPanelScreenState extends State<AdminPanelScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Panel'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(text: 'Products'),
            Tab(text: 'Orders'),
            Tab(text: 'Users'),
            Tab(text: 'Reports'),
            Tab(text: 'Categories'),
            Tab(text: 'Townships'),
            Tab(text: 'Announcements'),
            Tab(text: 'Settings'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ProductsTab(),
          OrdersTab(),
          UsersTab(),
          ReportsTab(),
          CategoriesTab(),
          TownshipsTab(),
          AnnouncementsTab(),
          SettingsTab(),
        ],
      ),
    );
  }
}
