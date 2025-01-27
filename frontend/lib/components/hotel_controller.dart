import 'package:get/get.dart';

class HotelController extends GetxController {
  var selectedHotel = {}.obs; // Store selected hotel details in an observable map

  // Function to set hotel details
  void setHotelDetails(Map<String, dynamic> hotelDetails) {
    selectedHotel.value = hotelDetails;
  }
}
