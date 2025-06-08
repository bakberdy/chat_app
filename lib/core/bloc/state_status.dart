enum StateStatus {
  initial,
  loading,
  loaded,
  error,
}

extension StateStatusX on StateStatus {
  bool get isLoading => this == StateStatus.loading;
  bool get isError => this == StateStatus.error;
  bool get isLoaded => this == StateStatus.loaded;
  bool get isInitial => this == StateStatus.initial;
}
