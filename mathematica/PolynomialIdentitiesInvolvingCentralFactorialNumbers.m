(* ::Package:: *)

BeginPackage["PolynomialIdentitiesInvolvingCentralFactorialNumbers`"]

faul1::usage= "checks faulhabers formula"
faul2::usage= "checks faulhabers formula"
knuth1::usage= "checks faulhabers formula of knuth"
knuth2::usage= "checks faulhabers formula of knuth"
knuth3::usage= "checks faulhabers formula of knuth"
knuth4::usage= "checks faulhabers formula of knuth"
T::usage= "Identity in central factorial numbers"
T2::usage= "Identity in central factorial numbers"
Eulerian1::usage= "Gives eularian number n, k"
Eulerian2::usage= "Gives eularian number n, k"

OEISFormula::usage= "Returns T(n,k) as per https://oeis.org/A303675: T[n_, k_] := (1/(n-k+1))*Sum[(-1)^j*Binomial[2*(n-k+1), j]*((n-k+1) - j)^(2*n), {j, 0, n-k+1}]";
OEISFormula2::usage= "Returns T(n,k) as";
Central1:: usage= "Returns central factorial number";
KnuthCoefficient:: usage= "Returns (2k-1)! T(2m, 2k) from https://arxiv.org/pdf/math/9207222.pdf page 10";
KnuthOddPower:: usage= "Returns n^(2m-1) identity from https://arxiv.org/pdf/math/9207222.pdf page 10";
KnuthCoefficient2:: usage= "Returns (2k-1)! T(2m, 2k)";
KnuthCoefficient3:: usage= "Returns (2k-1)! T(2m, 2k)";
KnuthCoefficient4:: usage= "Returns (2k-1)! T(2m, 2k)";

Begin["`Private`"]

faul1[m_, n_]:= Sum[k^m, {k, 0, n}];
faul2[m_, n_] := 1 / (m+1) * Sum[(-1)^k * Binomial[m+1, k] * BernoulliB[k] * n^(m-k+1), {k, 0, m}];
knuth1[m_, n_] := Simplify[Sum[T[m, k] * Binomial[n + k - 1, 2k - 1], {k, 1, m}]];
knuth2[m_, n_] := Simplify[Sum[Sum[(-1)^(k - j) / k * Binomial[n+k-1, 2k-1] * Binomial[2k, k-j] * j^(2m), {j, 0, k}], {k, 1, m}]];
knuth3[m_, n_] := Simplify[Sum[Sum[((-1)^(k - j) / k) * Binomial[n+k, 2k] * (2k / (n+k)) * Binomial[2k, k-j] * j^(2m), {j, 0, k}], {k, 1, m}]];
knuth4[m_, n_] := Simplify[Sum[Sum[((-1)^(k - j) / k) * Binomial[n+k, k-j] * (2k / (n+k)) * Binomial[n+j, k+j] * j^(2m), {j, 0, k}], {k, 1, m}]];
T[n_, k_] := 1 / k * Sum[(-1)^j * Binomial[2k, j] * (k - j)^(2n), {j, 0, k}];
T2[n_, k_] := 1 / k * Sum[(-1)^(k - j) * Binomial[2k, k - j] * j^(2n), {j, 0, k}];
Eulerian1[n_, k_] := Simplify[Sum[(-1)^j * Binomial[n+1, j] * (k+1-j)^n, {j, 0, k+1}]];
Eulerian2[n_, k_] := Simplify[Sum[(-1)^(k+1-j) * Binomial[n+1, k+1-j] * j^n, {j, 0, k+1}]];

OEISFormula[n_, k_] := (1/(n-k+1))*Sum[(-1)^j*Binomial[2*(n-k+1), j]*((n-k+1) - j)^(2*n), {j, 0, n-k+1}];
OEISFormula2[n_, k_] := (2n-2k+1) * Sum[ Binomial[2n-2k, j] * (-1)^j * (n-k-j)^(2n), {j, 0, 2n-2k}];
Central1[n_, k_] := (1/ k!) * Sum[ Binomial[k, j] * (-1)^j * (1/2 * k - j)^n, {j, 0, k}];
KnuthCoefficient[n_, k_] := (2k-1)! * Central1[2n, 2k];
KnuthCoefficient2[n_, k_] := (1/(2k)) * Sum[ Binomial[2k, j] * (-1)^j * (k - j)^(2n), {j, 0, 2k}];
KnuthCoefficient3[n_, k_] := (1 / k) * Sum[ Binomial[2k, j] * (-1)^j * (k - j)^(2n), {j, 0, k}];
KnuthCoefficient4[n_, k_] := (1 / k) * Sum[ Binomial[2k, k-j] * (-1)^(k-j) * (j)^(2n), {j, 0, k}];
KnuthOddPower[n_, m_] := Sum[KnuthCoefficient[m, k] * Binomial[n + k - 1, 2k-1], {k, 1, m}];

End[ ]

EndPackage[ ]



