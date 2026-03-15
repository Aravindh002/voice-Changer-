import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_constants.dart';

final creditsProvider = StateProvider<int>((ref) => AppConstants.defaultCredits);
