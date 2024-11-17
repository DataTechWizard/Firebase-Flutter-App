// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_flutter_app/services/firebase/ga_ecom_analytics_events.dart'
    as _i352;
import 'package:firebase_flutter_app/services/firebase/ga_error_analytics_events.dart'
    as _i484;
import 'package:firebase_flutter_app/services/firebase/ga_journey_analytics_events.dart'
    as _i850;
import 'package:firebase_flutter_app/services/firebase/ga_screen_analytics_events.dart'
    as _i326;
import 'package:firebase_flutter_app/services/firebase/ga_user_analytics_events.dart'
    as _i290;
import 'package:firebase_flutter_app/services/firebase/index.dart' as _i720;
import 'package:firebase_flutter_app/services/firebase_event_handler_service.dart'
    as _i398;
import 'package:firebase_flutter_app/services/product_service_api.dart'
    as _i283;
import 'package:firebase_flutter_app/services/product_service_file_local.dart'
    as _i475;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

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
    gh.lazySingleton<_i475.ProductServiceFileLocal>(
        () => _i475.ProductServiceFileLocal());
    gh.lazySingleton<_i352.GAEcomAnalyticsEvents>(
        () => _i352.GAEcomAnalyticsEvents());
    gh.lazySingleton<_i850.GAJourneyAnalyticsEvents>(
        () => _i850.GAJourneyAnalyticsEvents());
    gh.lazySingleton<_i326.GAScreenAnalyticsEvents>(
        () => _i326.GAScreenAnalyticsEvents());
    gh.lazySingleton<_i484.GAErrorAnalyticsEvents>(
        () => _i484.GAErrorAnalyticsEvents());
    gh.lazySingleton<_i290.GAUserAnalyticsEvents>(
        () => _i290.GAUserAnalyticsEvents());
    gh.lazySingleton<_i283.ProductServiceApi>(() => _i283.ProductServiceApi());
    gh.factory<_i398.FirebaseEventHandlerService>(
        () => _i398.FirebaseEventHandlerService(
              gh<_i720.GAEcomAnalyticsEvents>(),
              gh<_i720.GAScreenAnalyticsEvents>(),
              gh<_i720.GAJourneyAnalyticsEvents>(),
              gh<_i720.GAErrorAnalyticsEvents>(),
              gh<_i720.GAUserAnalyticsEvents>(),
            ));
    return this;
  }
}
