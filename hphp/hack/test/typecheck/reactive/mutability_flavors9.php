<?hh
<<file: __EnableUnstableFeatures('coeffects_provisional')>>

class A {
  public ?int $x;
}

<<__Rx>>
function f(A $a): void {
  $a = \HH\Rx\mutable(new A());
  $a->x = 1;
}
