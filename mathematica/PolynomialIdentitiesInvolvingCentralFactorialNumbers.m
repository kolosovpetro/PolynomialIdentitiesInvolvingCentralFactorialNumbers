(* ::Package:: *)

BeginPackage["PolynomialIdentitiesInvolvingCentralFactorialNumbers`"]

OEISFormula::usage= "Returns T(n,k) as per https://oeis.org/A303675: T[n_, k_] := (1/(n-k+1))*Sum[(-1)^j*Binomial[2*(n-k+1), j]*((n-k+1) - j)^(2*n), {j, 0, n-k+1}]";
OEISFormula2::usage= "Returns T(n,k) as";
Central1:: usage= "Returns central factorial number";
KnuthCoefficient:: usage= "Returns (2k-1)! T(2m, 2k) from https://arxiv.org/pdf/math/9207222.pdf page 10";
KnuthOddPower:: usage= "Returns n^(2m-1) identity from https://arxiv.org/pdf/math/9207222.pdf page 10";
KnuthCoefficient2:: usage= "Returns (2k-1)! T(2m, 2k)";

Begin["`Private`"]

OEISFormula[n_, k_] := (1/(n-k+1))*Sum[(-1)^j*Binomial[2*(n-k+1), j]*((n-k+1) - j)^(2*n), {j, 0, n-k+1}];
OEISFormula2[n_, k_] := (2n-2k+1) * Sum[ Binomial[2n-2k, j] * (-1)^j * (n-k-j)^(2n), {j, 0, 2n-2k}];
Central1[n_, k_] := (1/ k!) * Sum[ Binomial[k, j] * (-1)^j * (1/2 * k - j)^n, {j, 0, k}];
KnuthCoefficient[n_, k_] := (2k-1)! * Central1[2n, 2k];
KnuthCoefficient2[n_, k_] := (1/(2k)) * Sum[ Binomial[2k, j] * (-1)^j * (k - j)^(2n), {j, 0, 2k}];
KnuthOddPower[n_, m_] := Sum[KnuthCoefficient[m, k] * Binomial[n + k - 1, 2k-1], {k, 1, m}];

End[ ]

EndPackage[ ]



