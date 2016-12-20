PROGRAM Fibonacci(INPUT, OUTPUT);
{$COPERATORS ON}

{Выводит N-ое число последовательности Фибоначчи, N = 0..92}

FUNCTION Fib(N: INTEGER): INT64;
VAR
  I: INTEGER;
  A, B: INT64;
BEGIN
  A := 0;
  B := 1;
  FOR I := 1 TO N DO
    BEGIN
      B := A + B;
      A := B - A
    END;
  EXIT(A)
END;

VAR
  N: INT64;

BEGIN
  READLN(N);
  WRITELN(Fib(N))
END.