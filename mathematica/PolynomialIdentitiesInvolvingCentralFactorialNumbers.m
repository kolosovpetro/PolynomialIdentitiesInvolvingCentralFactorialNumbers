(* ::Package:: *)

BeginPackage["PolynomialIdentitiesInvolvingCentralFactorialNumbers`"]

CentralFactorialNumber1::usage= "recursively defines central factorial numbers of the second kind (in the context of Knuth and Riordan https://arxiv.org/pdf/math/9207222.pdf)"
CFNIdentity1::usage= "Defines an identity in central factorial numbers (2k-1)! T(2n,2k) = \\frac{1}{k} \\sum_{j=0}^{k} (-1)^j \\binom{2k}{j} (k-j)^{2n}"
CFNIdentity2::usage= "Defines an identity in central factorial numbers (2k-1)! T(2n,2k) = \\frac{1}{k} \\sum_{j=0}^{k} (-1)^{k-j} \\binom{2k}{k-j} j^{2n}"

Begin["`Private`"]
CentralFactorialNumber1[n_, n_] = CentralFactorialNumber1[n_, 1] = 1;
CentralFactorialNumber1[n_, k_] := CentralFactorialNumber1[n-1, k-1] + k^2 CentralFactorialNumber1[n-1, k];

CFNIdentity1[n_, k_] := (1/k) * Sum[ (-1)^j * Binomial[2k, j] * (k-j)^(2n), {j, 0, k}];
CFNIdentity2[n_, k_] := (1/k) * Sum[ (-1)^(k-j) * Binomial[2k, k-j] * j^(2n), {j, 0, k}];
End[ ]

EndPackage[ ]






