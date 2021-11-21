import 'package:get/get.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        //ENGLISH
        'en_US': {
          'app_title': 'flutter.fm',
          'error_not_implemented': "Not Implemented",
          'error_request_cancel': "Request Cancelled",
          'error_internal': "Internal Server Error",
          'error_service_unavailable': "Service unavailable",
          'error_method_allowed': "Method Allowed",
          'error_bad_request': "Bad request",
          'error_unauthorised_request': "Unauthorised request",
          'error_unexpected': "Unexpected error occurred",
          'error_request_timeout': "Connection request timeout",
          'error_no_internet': "No internet connection",
          'error_conflict': "Error due to a conflict",
          'error_api_connection_timeout': "Send timeout in connection with API server",
          'error_process_data': 'error_process_data',
          'error_not_acceptable': "Not acceptable",
          'search_hint': 'Search your albums',
          'playlist': 'Playlist',
          'summary': 'Summary',
          'empty_album': 'Can not display the details:(\nAPI is inconsistent',
          'published': 'Published: ',
        },
        //HUNGARIAN
        'hu_HU': {
          'app_title': 'flutter.fm',
          'error_not_implemented': "Nincs implementálva",
          'error_request_cancel': "Kérés visszautasítva",
          'error_internal': "Belső szerver hiba",
          'error_service_unavailable': "Szolgáltatás nem elérhető",
          'error_method_allowed': "Kérés nem engedélyezett",
          'error_bad_request': "Hibás kérés",
          'error_unauthorised_request': "Nincs jogod ehhez a kéréshez",
          'error_unexpected': "Nem várt error történt",
          'error_request_timeout': "A kérés kapcsolódási ideje túllépése",
          'error_no_internet': "Nincs internet kapcsolat",
          'error_conflict': "Ütközés miatti error",
          'error_api_connection_timeout': "Az API szerverhez való kapcsolódás túllépte az időkeretet",
          'error_process_data': 'Hiba az adat feldolgozása közben',
          'error_not_acceptable': "Nem elfogadható",
          'search_hint': 'Keresd az albumaid',
          'playlist': 'Lejátszási lista',
          'summary': 'Összefoglaló',
          'empty_album':
              'Nem tudjuk a részleteket megjeleníteni:(\nAPI inkonzisztens', //TODO tags: string vagy List of tag...
          'published': 'Kiadva: ',
        }
      };
}
