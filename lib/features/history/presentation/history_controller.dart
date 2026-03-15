import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/models/call_record.dart';

final callHistoryProvider = StateProvider<List<CallRecord>>((ref) => <CallRecord>[]);
