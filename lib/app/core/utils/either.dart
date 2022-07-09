abstract class Either<L, R> {
  B fold<B>(B Function(L l) ifLeft, B Function(R r) ifRight);
}

class Left<L, R> extends Either<L, R> {
  final L _l;
  Left(this._l);
  L get value => _l;
  @override
  B fold<B>(B Function(L l) ifLeft, B Function(R r) ifRight) => ifLeft(_l);
  @override
  bool operator ==(other) => other is Left && other._l == _l;
  @override
  int get hashCode => _l.hashCode;
}

class Right<L, R> extends Either<L, R> {
  final R _r;
  Right(this._r);
  R get value => _r;
  @override
  B fold<B>(B Function(L l) ifLeft, B Function(R r) ifRight) => ifRight(_r);
  @override
  bool operator ==(other) => other is Right && other._r == _r;
  @override
  int get hashCode => _r.hashCode;
}
