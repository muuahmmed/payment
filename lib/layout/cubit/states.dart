abstract class PaymentStates {}

class PaymentInitialState extends PaymentStates {}

class PaymentLoadingState extends PaymentStates {}

class PaymentSuccessState extends PaymentStates {
  final dynamic data;

  PaymentSuccessState(this.data);
}

class PaymentErrorState extends PaymentStates {
  final String error;

  PaymentErrorState(this.error);
}

class PaymentGetOrderRegistrationIdLoadingState extends PaymentStates {}

class PaymentGetOrderRegistrationIdSuccessState extends PaymentStates {
  final dynamic data;

  PaymentGetOrderRegistrationIdSuccessState(this.data);
}

class PaymentGetOrderRegistrationIdErrorState extends PaymentStates {
  final String error;

  PaymentGetOrderRegistrationIdErrorState(this.error);
}

class PaymentGetPaymentRequestLoadingState extends PaymentStates {}

class PaymentGetPaymentRequestSuccessState extends PaymentStates {
  final dynamic data;

  PaymentGetPaymentRequestSuccessState(this.data);
}

class PaymentGetPaymentRequestErrorState extends PaymentStates {
  final String error;

  PaymentGetPaymentRequestErrorState(this.error);
}

class PaymentGetRefCodeLoadingState extends PaymentStates {}

class PaymentGetRefCodeSuccessState extends PaymentStates {
  final dynamic data;

  PaymentGetRefCodeSuccessState(this.data);
}

class PaymentGetRefCodeErrorState extends PaymentStates {
  final String error;

  PaymentGetRefCodeErrorState(this.error);
}