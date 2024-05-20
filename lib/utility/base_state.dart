enum Status { loading, success, error }

class BaseState<T> {
  final Status status;
  final T? data;
  final String? message;

  BaseState({
    this.status = Status.loading,
    this.data,
    this.message,
  });

  BaseState<T> copyWith({
    Status? status,
    T? data,
    String? message,
  }) {
    return BaseState<T>(
      status: status ?? this.status,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}
