import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/componets/constants.dart';
import 'package:payment/layout/cubit/states.dart';
import 'package:payment/network/remote/dio%20helper.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit() : super(PaymentInitialState());

  static PaymentCubit get(context) => BlocProvider.of(context);

  Future getAuthenToken() async {
    emit(PaymentLoadingState());
    DioHelper.postData(url: AOIConstants.getAuthenToken, data: {
      'api_key': AOIConstants.paymentKey,
    }).then((value) {
      AOIConstants.paymentFirstToken = value.data['token'];
      print('payment first token is ${AOIConstants.paymentFirstToken}');
      emit(PaymentSuccessState(value.data));
    }).catchError((error) {
      print(error.toString());
      emit(PaymentErrorState(error.toString()));
    });
  }

  Future getOrderRegistrationId({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String price,
  }) async {
    emit(PaymentGetOrderRegistrationIdLoadingState());
    DioHelper.postData(url: AOIConstants.getOrderId, data: {
      'auth_token': AOIConstants.paymentFirstToken,
      'delivery_needed': 'false',
      'amount_cents': int.parse(price) * 100,
      'currency': 'EGP',
      'items': [],
    }).then((value) {
      // Ensure paymentOrderId is set correctly
      AOIConstants.paymentOrderId = value.data['id'].toString();
      print('Order ID: ${AOIConstants.paymentOrderId}');

      // Call getPaymentRequest only after paymentOrderId is set
      getPaymentRequest(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        price: price,
      );
      emit(PaymentGetOrderRegistrationIdSuccessState(value.data));
    }).catchError((error) {
      print(error.toString());
      emit(PaymentGetOrderRegistrationIdErrorState(error.toString()));
    });
  }

  Future getPaymentRequest({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String price,
  }) async {
    emit(PaymentGetPaymentRequestLoadingState());
    DioHelper.postData(url: AOIConstants.getPaymentId, data: {
      'auth_token': AOIConstants.paymentFirstToken,
      'amount_cents': (int.parse(price) * 100).toString(), // Convert to String
      'expiration': 3600,
      'order_id': AOIConstants.paymentOrderId, // Ensure this is not empty
      'billing_data': {
        'apartment': 'NA',
        'floor': 'NA',
        'street': 'NA',
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'phone_number': phone,
        'building': '4055',
        'postal_code': '01898',
        'city': 'NA',
        'state': 'NA',
        'country': 'NA',
      },
      'currency': 'EGP',
      'lock_order_when_paid': 'false',
      'integration_id': AOIConstants.integrationIdCart,
    }).then((value) {
      AOIConstants.finalToken = value.data['token'];
      print('Final Token: ${AOIConstants.finalToken}');
      emit(PaymentGetPaymentRequestSuccessState(value.data));
    }).catchError((error) {
      print(error.toString());
      emit(PaymentGetPaymentRequestErrorState(error.toString()));
    });
  }

  Future<void> getRefCode() async {
    emit(PaymentGetRefCodeLoadingState());
    DioHelper.postData(url: AOIConstants.getRefCode, data: {
      'source': {
        'identifier': 'AGGREGATOR',
        'subtype': 'AGGREGATOR',
      },
      'payment_token': AOIConstants.finalToken,
    }).then((value) {
      print('Success get ref Code');
      AOIConstants.refCode = value.data['id'].toString();
      print(AOIConstants.refCode);
      emit(PaymentGetRefCodeSuccessState(value.data));
    }).catchError((error) {
      print(error.toString());
      emit(PaymentGetRefCodeErrorState(error.toString()));
    });
  }
}
