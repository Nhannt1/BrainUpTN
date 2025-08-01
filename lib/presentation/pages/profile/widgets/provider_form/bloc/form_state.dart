abstract class FormStatee {}

class FormInitial extends FormStatee {}

class FormLoading extends FormStatee {}

class FormLoaded extends FormStatee {
  final String fullname;
  final String email;
  final String age;

  FormLoaded({required this.fullname, required this.email, required this.age});
}

class FormError extends FormStatee {
  final String message;

  FormError(this.message);
}
