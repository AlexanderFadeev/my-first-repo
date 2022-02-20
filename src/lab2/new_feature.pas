PROGRAM Fibonacci(INPUT, OUTPUT);
{$COPERATORS ON}

{Выводит N-ое число последовательности Фибоначчи, N = 0..92
Время работы - O(log(N)) с использованием бинарного возведения матрицы в степень}

TYPE MATRIX = RECORD
  M, N: INTEGER;
  V: ARRAY OF ARRAY OF INT64
END;

FUNCTION NewMatrix(M, N : INTEGER): MATRIX;
BEGIN
  SETLENGTH(NewMatrix.V, M, N);
  NewMatrix.M := M;
  NewMatrix.N := N
END;

OPERATOR *(A, B: MATRIX) C: MATRIX;
VAR
  I, J, K: INTEGER;
BEGIN
  C := NewMatrix(A.M, B.N);
  WITH C DO
    BEGIN
      FOR I := 0 TO M - 1 DO
        FOR J := 0 TO N - 1 DO
          V[I][J] := 0;
      FOR I := 0 TO M - 1 DO
        FOR J := 0 TO N - 1 DO
          FOR K := 0 TO A.N - 1 DO
            V[I][J] += A.V[I][K]*B.V[K][J]
    END
END;

FUNCTION E(N : INTEGER): MATRIX;
VAR
  I, J: INTEGER;
BEGIN
  E := NewMatrix(N, N);
  FOR I := 0 TO N - 1 DO
    FOR J := 0 TO N - 1 DO
      IF I = J
      THEN
      	E.V[I][J] := 1
      ELSE
        E.V[I][J] := 0

END;

FUNCTION Power(A: MATRIX; N: INT64): MATRIX;
VAR
  B: MATRIX;
BEGIN
  IF N = 0
  THEN
    EXIT(E(A.M));
  B := Power(A, N DIV 2);
  IF ODD(N)
  THEN
  	EXIT(B*B*A)
  ELSE
  	EXIT(B*B)
END;

FUNCTION Fib(N: INTEGER): INT64;
VAR
  A, B: MATRIX;
BEGIN
  A := NewMatrix(1, 2);
  A.V[0][0] := 0;
  A.V[0][1] := 1;
  B := NewMatrix(2, 2);
  B.V[0][0] := 0;
  B.V[0][1] := 1;
  B.V[1][0] := 1;
  B.V[1][1] := 1;

  A := A*Power(B, N);
  EXIT(A.V[0][0]);
END;

VAR
  N: INT64;

BEGIN
  READLN(N);
  WRITELN(Fib(N))
END.
