sealed class StateStatus {
  const StateStatus();
}

final class InitialStatus extends StateStatus {
  const InitialStatus();
}

final class LoadingStatus extends StateStatus {
  const LoadingStatus();
}

final class SuccessStatus extends StateStatus {
  const SuccessStatus();
}

final class ErrorStatus extends StateStatus {
  final String errorMessage;
  const ErrorStatus(this.errorMessage);
}
