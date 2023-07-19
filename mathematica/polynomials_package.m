(* ::Package:: *)

BeginPackage["PolynomialsPackage`"]

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
End[ ]

EndPackage[ ]



