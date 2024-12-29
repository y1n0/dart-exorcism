class DifferenceOfSquares {
  num squareOfSum(num n) => n*n*(n+1)*(n+1)/4;

  num sumOfSquares(num n) => n*(n+1)*(2*n+1)/6;

  num differenceOfSquares(n) => squareOfSum(n) - sumOfSquares(n);
}
