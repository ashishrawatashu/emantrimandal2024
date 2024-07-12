import 'package:emantrimandal/data/datasource/local/departmentsDataSource/departments_data_source.dart';
import 'package:emantrimandal/data/datasource/local/departmentsDataSource/departments_ds_impl.dart';
import 'package:emantrimandal/data/datasource/local/itemDetails/item_details_data_source.dart';
import 'package:emantrimandal/data/datasource/local/itemDetails/item_details_ds_impl.dart';
import 'package:emantrimandal/data/datasource/local/itemsDataSource/items_data_source.dart';
import 'package:emantrimandal/data/datasource/local/itemsDataSource/items_ds_impl.dart';
import 'package:emantrimandal/data/repository/local/departments_repo_impl.dart';
import 'package:emantrimandal/data/repository/local/items_details_repo_impl.dart';
import 'package:emantrimandal/data/repository/local/items_repo_impl.dart';
import 'package:emantrimandal/data/repository/local/meeting_details_repo_impl.dart';
import 'package:emantrimandal/domain/repository/local/departments/departments_repository.dart';
import 'package:emantrimandal/domain/repository/local/itemDetails/itemsDetails.dart';
import 'package:emantrimandal/domain/repository/local/items/items_repository.dart';
import 'package:emantrimandal/domain/repository/local/meetingDetails/meeting_details_local_repository.dart';
import 'package:emantrimandal/domain/usecase/local/add_departments_usecase.dart';
import 'package:emantrimandal/domain/usecase/local/add_item_details_usecase.dart';
import 'package:emantrimandal/domain/usecase/local/add_items_usecase.dart';
import 'package:emantrimandal/domain/usecase/local/get_all_items_usecase.dart';
import 'package:emantrimandal/domain/usecase/local/get_departments_usecase.dart';
import 'package:emantrimandal/domain/usecase/local/get_items_by_dept_id_usecase.dart';
import 'package:emantrimandal/domain/usecase/local/get_items_details_by_item_id_usecase.dart';
import 'package:emantrimandal/domain/usecase/remote/get_details_usecase.dart';
import 'package:emantrimandal/domain/usecase/remote/get_meetings_items_usecase.dart';
import 'package:emantrimandal/domain/usecase/local/get_meeting_details_use_case.dart';
import 'package:emantrimandal/domain/usecase/remote/logout_usecase.dart';
import 'package:emantrimandal/domain/usecase/remote/updated_meeting_items_usecase.dart';
import 'package:emantrimandal/presentation/blocs/departmentItemListBloc/department_item_list_bloc.dart';
import 'package:emantrimandal/presentation/blocs/downloadMeetingItemsBloc/download_meeting_items_bloc.dart';
import 'package:emantrimandal/presentation/blocs/itemDetailsBloc/item_details_bloc.dart';
import 'package:emantrimandal/presentation/blocs/itemsBloc/items_bloc.dart';
import 'package:emantrimandal/presentation/blocs/mantriDashboardBloc/mantri_dashboard_bloc.dart';
import 'package:emantrimandal/presentation/blocs/mantriInfoBloc/mantri_info_bloc.dart';
import 'package:emantrimandal/presentation/blocs/splashBloc/splash_screen_bloc.dart';
import '../../data/datasource/local/meetingDetailsDataSource/meeting_details_data_source.dart';
import '../../data/datasource/local/meetingDetailsDataSource/meeting_details_ds_impl.dart';
import '../../data/datasource/remote/generateTokenDataSource/generate_token_data_source.dart';
import '../../data/datasource/remote/generateTokenDataSource/generate_token_ds_impl.dart';
import '../../data/datasource/remote/getDetailsDataSource/get_details_data_source.dart';
import '../../data/datasource/remote/getDetailsDataSource/get_details_ds_impl.dart';
import '../../data/datasource/remote/getMeetingItemsDataSource/get_meeting_items_data_source.dart';
import '../../data/datasource/remote/getMeetingItemsDataSource/get_meeting_items_ds_impl.dart';
import '../../data/datasource/remote/logoutDataSource/logout_data_source.dart';
import '../../data/datasource/remote/logoutDataSource/logout_ds_impl.dart';
import '../../data/datasource/remote/updatedMeetingItemsDataSource/updated_meeting_items_data_source.dart';
import '../../data/datasource/remote/updatedMeetingItemsDataSource/updated_meeting_items_ds_impl.dart';
import '../../data/repository/remote/generate_token_repo_impl.dart';
import '../../data/repository/remote/get_details_repo_impl.dart';
import '../../data/repository/remote/get_meeting_items_repo_impl.dart';
import '../../domain/repository/remote/generateToken/generate_token_repository.dart';
import '../../domain/repository/remote/getDetails/get_details_repository.dart';
import '../../domain/repository/remote/getMeetingsItems/get_metings_items_repository.dart';
import '../../domain/usecase/local/delete_all_departments_usecase.dart';
import '../../domain/usecase/local/delete_all_items_details_usecase.dart';
import '../../domain/usecase/local/delete_all_items_usecase.dart';
import '../../domain/usecase/remote/get_token_usecase.dart';
import '../../domain/usecase/local/save_meeting_details_usecase.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> initDependencies() async {

  ///local///
  /// Data Source
  injector.registerLazySingleton<MeetingLocalDataSource>(() => SaveMeetingLocalDsImpl());
  injector.registerLazySingleton<DepartmentsLocalDataSource>(() => DepartmentsLocalDsImpl());
  injector.registerLazySingleton<ItemsLocalDataSource>(() => ItemsLocalDsImpl());
  injector.registerLazySingleton<ItemsDetailsLocalDataSource>(() => ItemsDetailsLocalDsImpl());

  /// Repository ///
  injector.registerLazySingleton<MeetingDetailsLocalRepository>(() => MeetingDetailsRepositoryImpl(saveMeetingLocalDataSource: injector()));
  injector.registerLazySingleton<DepartmentsRepository>(() => DepartmentsRepositoryImpl( departmentsLocalDataSource: injector()));
  injector.registerLazySingleton<ItemsDetailsLocalRepository>(() => ItemsDetailsRepositoryImpl(itemsDetailsLocalDataSource: injector()));
  injector.registerLazySingleton<ItemsLocalRepository>(() => ItemsRepositoryImpl(itemsLocalDataSource: injector()));


  /// UseCase ///
  injector.registerLazySingleton(() => SaveMeetingDetailsUseCase(saveMeetingDetailsRepository: injector()));
  injector.registerLazySingleton(() => GetMeetingDetailsUseCase(getMeetingDetailsRepository: injector()));
  injector.registerLazySingleton(() => AddDepartmentUseCase(departmentsRepository: injector()));
  injector.registerLazySingleton(() => GetDepartmentUseCase(departmentsRepository: injector()));
  injector.registerLazySingleton(() => AddItemsUseCase(itemsLocalRepository: injector()));
  injector.registerLazySingleton(() => GetAllItemsUseCase(itemsLocalRepository: injector()));
  injector.registerLazySingleton(() => GetItemsByDeptIdUseCase(itemsLocalRepository: injector()));
  injector.registerLazySingleton(() => AddItemsDetailsUseCase(itemsDetailsLocalRepository: injector()));
  injector.registerLazySingleton(() => GetItemsDetailsByItemIdUseCase( itemsLocalRepository: injector()));
  injector.registerLazySingleton(() => DeleteAllDepartmentsUseCase(departmentsRepository:injector()));
  injector.registerLazySingleton(() => DeleteAllItemsDetailsUseCase(itemsDetailsLocalRepository:injector()));
  injector.registerLazySingleton(() => DeleteAllItemsUseCase(itemsLocalRepository:injector()));


  ///remote///
  /// Data Source
  injector.registerLazySingleton<GenerateTokenRemoteDS>(() => GenerateTokenRemoteDSImpl(apiService: injector()));
  injector.registerLazySingleton<GetDetailsRemoteDS>(() => GetDetailsRemoteDSImpl(apiService: injector()));
  injector.registerLazySingleton<GetMeetingItemsRemoteDS>(() => GetMeetingItemsRemoteDSImpl(apiService: injector()));
  injector.registerLazySingleton<LogoutRemoteDS>(() => LogoutRemoteDSImpl(apiService: injector()));
  injector.registerLazySingleton<UpdatedMeetingItemsRemoteDS>(() => UpdatedMeetingItemsRemoteDSImpl(apiService: injector()));


  /// Repository ///
  injector.registerLazySingleton<GenerateTokenRepository>(() => GenerateTokenRepositoryImpl(remoteDS: injector(), dio: injector()));
  injector.registerLazySingleton<GetDetailsRepository>(() => GetDetailsRepositoryImpl(remoteDS: injector(), dio: injector()));
  injector.registerLazySingleton<GetMeetingsItemsRepository>(() => GetMeetingItemsRepositoryImpl( remoteDS: injector(), dio: injector()));

  /// UseCase ///
  injector.registerLazySingleton(() => GetDetailsUseCase(injector()));
  injector.registerLazySingleton(() => GetMeetingsItemsUseCase(injector()));
  injector.registerLazySingleton(() => GenerateTokenUseCase(injector()));
  injector.registerLazySingleton(() => LogoutUseCase( injector()));
  injector.registerLazySingleton(() => UpdatedMeetingItemsUseCase(injector()));


  /// BloC ///
  injector.registerFactory(() => SplashScreenBloc(injector(),injector(),injector(),injector()));
  injector.registerFactory(() => DownloadMeetingItemsBloc(injector(),injector(),injector(),injector(),injector(),injector(),injector()));
  injector.registerFactory(() => MantriDashboardBloc(injector()));
  injector.registerFactory(() => ItemDetailsBloc(injector()));
  injector.registerFactory(() => DepartmentItemListBloc());
  injector.registerFactory(() => MantriInfoBloc());
  injector.registerFactory(() => ItemsBloc(injector(),injector()));

  await injector<MeetingLocalDataSource>().initDb();
  await injector<DepartmentsLocalDataSource>().initDb();
  await injector<ItemsLocalDataSource>().initDb();
  await injector<ItemsDetailsLocalDataSource>().initDb();


}