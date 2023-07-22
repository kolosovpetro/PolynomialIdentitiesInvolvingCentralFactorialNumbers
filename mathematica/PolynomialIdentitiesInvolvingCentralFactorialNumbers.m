(* ::Package:: *)

BeginPackage["PolynomialIdentitiesInvolvingCentralFactorialNumbers`"]

CentralFactorialNumber1::usage= "Recursively defines central factorial numbers of the second kind (in the context of Knuth and Riordan https://arxiv.org/pdf/math/9207222.pdf)"
CentralFactorialNumber2::usage= "Defines central factorial numbers as polynomial T(n,k) = \\frac{1}{k!} \\sum_{j=0}^{k} \\binom{k}{j} (-1)^{j} \\left( \\frac{1}{2}k - j \\right)^{n}"
CFNIdentity1::usage= "Defines an identity in central factorial numbers (2k-1)! T(2n,2k) = \\frac{1}{k} \\sum_{j=0}^{k} (-1)^j \\binom{2k}{j} (k-j)^{2n}"
CFNIdentity2::usage= "Defines an identity in central factorial numbers (2k-1)! T(2n,2k) = \\frac{1}{k} \\sum_{j=0}^{k} (-1)^{k-j} \\binom{2k}{k-j} j^{2n}"
CFNIdentity3::usage= "Defines an identity in central factorial numbers (2k-1)! T(2n, 2k) = \\frac{1}{2k} \\sum_{j=0}^{2k} \\binom{2k}{j} (-1)^{j} (k-j)^{2n}"

Begin["`Private`"]
CentralFactorialNumber1[n_, n_] = CentralFactorialNumber1[n_, 1] = 1;
CentralFactorialNumber1[n_, k_] := CentralFactorialNumber1[n-1, k-1] + k^2 CentralFactorialNumber1[n-1, k];
CentralFactorialNumber2[n_, k_] := (1/k!) * Sum[Binomial[k, j] * (-1)^j * (1/2*k - j)^n, {j, 0, k}];

CFNIdentity1[n_, k_] := (1/k) * Sum[ (-1)^j * Binomial[2k, j] * (k-j)^(2n), {j, 0, k}];
CFNIdentity2[n_, k_] := (1/k) * Sum[ (-1)^(k-j) * Binomial[2k, k-j] * j^(2n), {j, 0, k}];
CFNIdentity3[n_, k_] := (1/(2k)) * Sum[ (-1)^j * Binomial[2k, j] * (k-j)^(2n), {j, 0, 2k}];
End[ ]

EndPackage[ ]






