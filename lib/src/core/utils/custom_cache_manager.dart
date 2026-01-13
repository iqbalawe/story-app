import 'package:flutter_cache_manager/flutter_cache_manager.dart';

final customCacheManager = CacheManager(
  Config('storyCacheKey', stalePeriod: const Duration(days: 7)),
);
