(* ::Package:: *)

BeginPackage["PolynomialIdentitiesInvolvingCentralFactorialNumbers`"]

CentralFactorialNumber1::usage= "recursively defines central factorial numbers of the second kind (in the context of Knuth and Riordan https://arxiv.org/pdf/math/9207222.pdf)"

Begin["`Private`"]
CentralFactorialNumber1[n_, n_] = CentralFactorialNumber1[n_, 1] = 1;
CentralFactorialNumber1[n_, k_] := CentralFactorialNumber1[n-1, k-1] + k^2 CentralFactorialNumber1[n-1, k];
End[ ]

EndPackage[ ]






