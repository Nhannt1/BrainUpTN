abstract class FormEvent {}

class LoadForm extends FormEvent {
  final String id;

  LoadForm({required this.id});
}
