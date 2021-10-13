ReturnType run<ReturnType>(ReturnType Function() operation) {
  return operation();
}

extension ScopeFunctionsForObject<T extends Object> on T {
  ReturnType let<ReturnType>(ReturnType Function(T self) func) {
    return func(this);
  }

  T also(void Function(T it) func) {
    func(this);
    return this;
  }

  T apply(void Function(T it) func) {
    func(this);
    return this;
  }

  // R runF<R>(R Function() func) {
  //   return func();
  // }
}

/// String captionFor(String? selectedShopName) {
///   return selectedShopName?.let((name) => 'Do with $selectedShopName...') ??
///       run(() => 'If no shop is selected, process here...');
/// }
///
///
/// String greet(String? yourName) {
///   return yourName?.let((name) => 'Hi! John Doe') ?? 'Oops!';
/// }
///
///
///
/// also && apply
/// Student student = Student().apply((self) {
///     self.id = 1;
///     self.name = 'Mohamed';
///     self.age = '20';
///   });
/// Student student = Student().also((self) {
///     self.id = 1;
///     self.name = 'Mohamed';
///     self.age = '20';
///   });
