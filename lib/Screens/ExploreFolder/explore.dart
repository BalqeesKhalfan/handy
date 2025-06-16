import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homecleaning/api/api_service.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  final TextEditingController _controller = TextEditingController();
  List<Service> _services = [];
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    try {
      _services = await ApiService.searchServices(_controller.text);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Services')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Search',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _load,
                ),
              ),
            ),
            const SizedBox(height: 16),
            if (_loading) const CircularProgressIndicator(),
            if (!_loading)
              Expanded(
                child: ListView.builder(
                  itemCount: _services.length,
                  itemBuilder: (context, index) {
                    final s = _services[index];
                    return ListTile(
                      title: Text(s.name ?? 'Unnamed'),
                      subtitle:
                          Text(s.price != null ? '\u0024${s.price}' : ''),
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