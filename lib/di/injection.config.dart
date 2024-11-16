// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:test_firebase_app/services/event_handler_service.dart' as _i151;
import 'package:test_firebase_app/services/firebase/ga_ecom_analytics_events.dart'
    as _i162;
import 'package:test_firebase_app/services/firebase/ga_error_analytics_events.dart'
    as _i464;
import 'package:test_firebase_app/services/firebase/ga_journey_analytics_events.dart'
    as _i120;
import 'package:test_firebase_app/services/firebase/ga_screen_analytics_events.dart'
    as _i109;
import 'package:test_firebase_app/services/firebase/ga_user_analytics_events.dart'
    as _i138;
import 'package:test_firebase_app/services/firebase/index.dart' as _i257;
import 'package:test_firebase_app/services/product_service_api.dart' as _i308;
import 'package:test_firebase_app/services/product_service_file_local.dart'
    as _i706;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i706.ProductServiceFileLocal>(
        () => _i706.ProductServiceFileLocal());
    gh.lazySingleton<_i162.GAEcomAnalyticsEvents>(
        () => _i162.GAEcomAnalyticsEvents());
    gh.lazySingleton<_i120.GAJourneyAnalyticsEvents>(
        () => _i120.GAJourneyAnalyticsEvents());
    gh.lazySingleton<_i109.GAScreenAnalyticsEvents>(
        () => _i109.GAScreenAnalyticsEvents());
    gh.lazySingleton<_i464.GAErrorAnalyticsEvents>(
        () => _i464.GAErrorAnalyticsEvents());
    gh.lazySingleton<_i138.GAUserAnalyticsEvents>(
        () => _i138.GAUserAnalyticsEvents());
    gh.lazySingleton<_i308.ProductServiceApi>(() => _i308.ProductServiceApi());
    gh.factory<_i151.EventHandlerService>(() => _i151.EventHandlerService(
          gh<_i257.GAEcomAnalyticsEvents>(),
          gh<_i257.GAScreenAnalyticsEvents>(),
          gh<_i257.GAJourneyAnalyticsEvents>(),
          gh<_i257.GAErrorAnalyticsEvents>(),
          gh<_i257.GAUserAnalyticsEvents>(),
        ));
    return this;
  }
}
