import 'package:flutter/material.dart';
import 'database/database.dart';
import 'services/api_service.dart';
import 'services/sync_service.dart';

void main() {
  runApp(const ElikasApp());
}

class ElikasApp extends StatelessWidget {
  const ElikasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-LIKAS',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const SyncTestScreen(),
    );
  }
}

/// Step 3 test screen -- deliberately different from Step 2's test.
/// Step 2 proved the live network call + JSON parsing works. This screen
/// proves the actual offline-cache layer works: sync writes to Drift, then
/// the list below is read back FROM DRIFT, not from the live API response
/// -- the real proof that data would still be there with no internet.
class SyncTestScreen extends StatefulWidget {
  const SyncTestScreen({super.key});

  @override
  State<SyncTestScreen> createState() => _SyncTestScreenState();
}

class _SyncTestScreenState extends State<SyncTestScreen> {
  final AppDatabase _db = AppDatabase();
  late final SyncService _sync = SyncService(ApiService(), _db);

  String _status = 'Not synced yet';
  List<EvacuationCenter> _cachedCenters = [];

  Future<void> _loadFromCache() async {
    final centers = await _db.select(_db.evacuationCenters).get();
    setState(() => _cachedCenters = centers);
  }

  Future<void> _syncNow() async {
    setState(() => _status = 'Syncing...');
    try {
      final centerCount = await _sync.syncEvacuationCenters();
      final alertCount = await _sync.syncAlerts();
      final hazardCount = await _sync.syncHazardAreas();
      await _loadFromCache();
      setState(() {
        _status = 'Synced: $centerCount center(s), $alertCount alert(s), '
            '$hazardCount hazard area(s)';
      });
    } catch (e) {
      setState(() => _status = 'Sync failed: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    // Load whatever's already cached immediately on open, before any sync
    // -- this is exactly what a resident would see if they opened the app
    // with no internet at all.
    _loadFromCache();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('E-LIKAS — Offline Cache Test')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(_status, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 8),
            Text(
              'Reading from local Drift cache (not the live API):',
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: _syncNow, child: const Text('Sync now')),
            const SizedBox(height: 16),
            Expanded(
              child: _cachedCenters.isEmpty
                  ? const Center(child: Text('Nothing cached yet -- tap Sync now'))
                  : ListView.builder(
                      itemCount: _cachedCenters.length,
                      itemBuilder: (context, index) {
                        final c = _cachedCenters[index];
                        return ListTile(
                          title: Text(c.name),
                          subtitle: Text(
                            '${c.barangay ?? ''} · ${c.status} · '
                            '${c.currentOccupancy ?? '—'}/${c.capacityPersons ?? '—'}',
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
}
