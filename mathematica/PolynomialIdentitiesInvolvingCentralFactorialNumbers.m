(* ::Package:: *)

BeginPackage["PolynomialIdentitiesInvolvingCentralFactorialNumbers`"]

CentralFactorialNumber1::usage= "Recursively defines central factorial numbers of the second kind (in the context of Knuth and Riordan https://arxiv.org/pdf/math/9207222.pdf)"
CentralFactorialNumber2::usage= "Defines central factorial numbers as polynomial T(n,k) = \\frac{1}{k!} \\sum_{j=0}^{k} \\binom{k}{j} (-1)^{j} \\left( \\frac{1}{2}k - j \\right)^{n}"
CentralFactorial1::usage= "Defines central factorial \\centralFactorial{x}{n} = x \\fallingFactorial{x+\\frac{n}{2}-1}{n-1}"

PowerIdentity1::usage= "Defines power identity from Knuth x^m = \\sum_{k=1}^{m} T(m, k) \\centralFactorial{x}{k}"

CFNIdentity1::usage= "Defines an identity in central factorial numbers (2k-1)! T(2n,2k) = \\frac{1}{k} \\sum_{j=0}^{k} (-1)^j \\binom{2k}{j} (k-j)^{2n}"
CFNIdentity2::usage= "Defines an identity in central factorial numbers (2k-1)! T(2n,2k) = \\frac{1}{k} \\sum_{j=0}^{k} (-1)^{k-j} \\binom{2k}{k-j} j^{2n}"
CFNIdentity3::usage= "Defines an identity in central factorial numbers (2k-1)! T(2n, 2k) = \\frac{1}{2k} \\sum_{j=0}^{2k} \\binom{2k}{j} (-1)^{j} (k-j)^{2n}"

OddPowerIdentity1::usage= "Defines an odd power identity n^{2m-1} = \\sum_{k=1}^{m} \\mathtt{CFNIdentity1} (m,k) \\binom{n+k-1}{2k-1}"
OddPowerIdentity11::usage= "Defines an odd power identity n^{2m-1} = \\sum_{k=1}^{m} \\sum_{j=0}^{k} \\frac{(-1)^j}{k} \\binom{2k}{j} \\binom{n+k-1}{2k-1} (k-j)^{2m}"
OddPowerIdentity12::usage= "Defines an odd power identity n^{2m-1} = \\sum_{k=1}^{m} \\sum_{j=0}^{k} \\frac{(-1)^{j}}{k} \\frac{2k}{n+k} \\binom{n+k}{2k} \\binom{2k}{j} (k-j)^{2m}"
OddPowerIdentity13::usage= "Defines an odd power identity n^{2m-1} = 2\\sum_{k=1}^{m} \\sum_{j=0}^{k} \\frac{(-1)^{j}}{n+k} \\binom{n+k}{j} \\binom{n+k-j}{2k-j} (k-j)^{2m}"
OddPowerIdentity14::usage= "Defines an odd power identity n^{2m-1} = 2\\sum_{k=1}^{m} \\sum_{j=0}^{k} \\frac{(-1)^{j}}{n+k} \\binom{n+k}{n+k-j} \\binom{n+k-j}{2k-j} (k-j)^{2m}"
OddPowerIdentity15::usage= "Defines an odd power identity n^{2m-1} = 2\\sum_{k=1}^{m} \\sum_{j=0}^{k} \\frac{(-1)^{j}}{n+k} \\binom{n+k}{2k-j} \\binom{n-k+j}{n-k} (k-j)^{2m}"

OddPowerIdentity2::usage= "Defines an odd power identity n^{2m-1} = \\sum_{k=1}^{m} \\mathtt{CFNIdentity2} (m,k) \\binom{n+k-1}{2k-1}"
OddPowerIdentity21::usage= "Defines an odd power identity n^{2m-1} = \\sum_{k=1}^{m} \\sum_{j=0}^{k} \\frac{(-1)^{k-j}}{k} \\binom{n+k-1}{2k-1} \\binom{2k}{k-j} j^{2m}"
OddPowerIdentity22::usage= "Defines an odd power identity n^{2m-1} = \\sum_{k=1}^{m} \\sum_{j=0}^{k} \\frac{(-1)^{k-j}}{k} \\frac{2k}{n+k} \\binom{n+k}{2k} \\binom{2k}{k-j} j^{2m}"
OddPowerIdentity23::usage= "Defines an odd power identity n^{2m-1} = 2\\sum_{k=1}^{m} \\sum_{j=0}^{k} \\frac{(-1)^{k-j}}{n+k} \\binom{n+k}{2k} \\binom{2k}{k-j} j^{2m}"
OddPowerIdentity24::usage= "Defines an odd power identity n^{2m-1} = 2\\sum_{k=1}^{m} \\sum_{j=0}^{k} \\frac{(-1)^{k-j}}{n+k} \\binom{n+k}{k-j} \\binom{n+j}{k+j} j^{2m}"
OddPowerIdentity25::usage= "Defines an odd power identity n^{2m-1} = 2\\sum_{k=1}^{m} \\sum_{j=0}^{k} \\frac{(-1)^{k-j}}{n+k} \\binom{n+k}{n+j} \\binom{n+j}{k+j} j^{2m}"
OddPowerIdentity26::usage= "Defines an odd power identity n^{2m-1} = 2\\sum_{k=1}^{m} \\sum_{j=0}^{k} \\frac{(-1)^{k-j}}{n+k} \\binom{n+k}{k+j} \\binom{n-j}{n-k} j^{2m}"

OddPowerIdentity3::usage= "Defines an odd power identity n^{2m-1} = \\sum_{k=1}^{m} \\mathtt{CFNIdentity3} (m,k) \\binom{n+k-1}{2k-1}"
OddPowerIdentity31::usage= "Defines an odd power identity n^{2m-1} = \\sum_{k=1}^{m} \\sum_{j=0}^{2k} \\frac{(-1)^{j}}{2k} \\binom{n+k-1}{2k-1} \\binom{2k}{j} (k-j)^{2m}"
OddPowerIdentity32::usage= "Defines an odd power identity n^{2m-1} = \\sum_{k=1}^{m} \\sum_{j=0}^{2k} \\frac{(-1)^{j}}{n+k} \\binom{n+k}{2k} \\binom{2k}{j} (k-j)^{2m}"
OddPowerIdentity33::usage= "Defines an odd power identity n^{2m-1} = \\sum_{k=1}^{m} \\sum_{j=0}^{2k} \\frac{(-1)^{j}}{n+k} \\binom{n+k}{j} \\binom{n+k-j}{2k-j} (k-j)^{2m}"
OddPowerIdentity34::usage= "Defines an odd power identity  n^{2m-1} = \\sum_{k=1}^{m} \\sum_{j=0}^{2k} \\frac{(-1)^{j}}{n+k} \\binom{n+k}{2k-j} \\binom{n-k+j}{n-k} (k-j)^{2m}"

Begin["`Private`"]
CentralFactorialNumber1[n_, n_] = CentralFactorialNumber1[n_, 1] = 1;
CentralFactorialNumber1[n_, k_] := CentralFactorialNumber1[n-1, k-1] + k^2 CentralFactorialNumber1[n-1, k];
CentralFactorialNumber2[n_, k_] := (1/k!) * Sum[Binomial[k, j] * (-1)^j * (1/2*k - j)^n, {j, 0, k}];
CentralFactorial1[x_, n_] := x * FactorialPower[x+n/2-1, n-1];

PowerIdentity1[n_, m_] := Sum[ CentralFactorialNumber2[m, k] * CentralFactorial1[n, k], {k, 1, m}];

CFNIdentity1[n_, k_] := (1/k) * Sum[ (-1)^j * Binomial[2k, j] * (k-j)^(2n), {j, 0, k}];
CFNIdentity2[n_, k_] := (1/k) * Sum[ (-1)^(k-j) * Binomial[2k, k-j] * j^(2n), {j, 0, k}];
CFNIdentity3[n_, k_] := (1/(2k)) * Sum[ (-1)^j * Binomial[2k, j] * (k-j)^(2n), {j, 0, 2k}];

OddPowerIdentity1[n_, m_] := Sum[CFNIdentity1[m, k] * Binomial[n+k-1, 2k-1], {k, 1, m}];
OddPowerIdentity11[n_, m_] := Sum[ Sum[ ((-1)^j)/k * Binomial[2k, j] * Binomial[n+k-1, 2k-1] * (k-j)^(2m), {j, 0, k}], {k, 1, m}];
OddPowerIdentity12[n_, m_] := Sum[ Sum[ ((-1)^j)/k * (2k)/(n+k) * Binomial[n+k, 2k] * Binomial[2k, j] * (k-j)^(2m), {j, 0, k}], {k, 1, m}];
OddPowerIdentity13[n_, m_] := 2 * Sum[ Sum[ ((-1)^j)/(n+k) * Binomial[n+k, j] * Binomial[n+k-j, 2k-j] * (k-j)^(2m), {j, 0, k}], {k, 1, m}];
OddPowerIdentity14[n_, m_] := 2 * Sum[ Sum[ ((-1)^j)/(n+k) * Binomial[n+k, n+k-j] * Binomial[n+k-j, 2k-j] * (k-j)^(2m), {j, 0, k}], {k, 1, m}];
OddPowerIdentity15[n_, m_] := 2 * Sum[ Sum[ ((-1)^j)/(n+k) * Binomial[n+k, 2k-j] * Binomial[n-k+j, n-k] * (k-j)^(2m), {j, 0, k}], {k, 1, m}];

OddPowerIdentity2[n_, m_] := Sum[CFNIdentity2[m, k] * Binomial[n+k-1, 2k-1], {k, 1, m}];
OddPowerIdentity21[n_, m_] := Sum[ Sum[ (-1)^(k-j) / k * Binomial[n+k-1, 2k-1] * Binomial[2k, k-j]* j^(2m), {j, 0, k}], {k, 1, m}];
OddPowerIdentity22[n_, m_] := Sum[ Sum[ (-1)^(k-j) / k * (2k)/(n+k)* Binomial[n+k, 2k] * Binomial[2k, k-j]* j^(2m), {j, 0, k}], {k, 1, m}];
OddPowerIdentity23[n_, m_] := 2 * Sum[ Sum[ (-1)^(k-j)/(n+k) * Binomial[n+k, 2k] * Binomial[2k, k-j]* j^(2m), {j, 0, k}], {k, 1, m}];
OddPowerIdentity24[n_, m_] := 2 * Sum[ Sum[ (-1)^(k-j)/(n+k) * Binomial[n+k, k-j] * Binomial[n+j, k+j]* j^(2m), {j, 0, k}], {k, 1, m}];
OddPowerIdentity25[n_, m_] := 2 * Sum[ Sum[ (-1)^(k-j)/(n+k) * Binomial[n+k, n+j] * Binomial[n+j, k+j]* j^(2m), {j, 0, k}], {k, 1, m}];
OddPowerIdentity26[n_, m_] := 2 * Sum[ Sum[ (-1)^(k-j)/(n+k) * Binomial[n+k, k+j] * Binomial[n-j, n-k]* j^(2m), {j, 0, k}], {k, 1, m}];

OddPowerIdentity3[n_, m_] := Sum[CFNIdentity3[m, k] * Binomial[n+k-1, 2k-1], {k, 1, m}];
OddPowerIdentity31[n_, m_] := Sum[ Sum[ ((-1)^j / (2k)) * Binomial[n+k-1, 2k-1] * Binomial[2k, j] * (k-j)^(2m), {j, 0, 2k}], {k, 1, m}];
OddPowerIdentity32[n_, m_] := Sum[ Sum[ ((-1)^j / (n+k)) * Binomial[n+k, 2k] * Binomial[2k, j] * (k-j)^(2m), {j, 0, 2k}], {k, 1, m}];
OddPowerIdentity33[n_, m_] := Sum[ Sum[ ((-1)^j / (n+k)) * Binomial[n+k, j] * Binomial[n+k-j, 2k-j] * (k-j)^(2m), {j, 0, 2k}], {k, 1, m}];
OddPowerIdentity34[n_, m_] := Sum[ Sum[ ((-1)^j / (n+k)) * Binomial[n+k, 2k-j] * Binomial[n-k+j, n-k] * (k-j)^(2m), {j, 0, 2k}], {k, 1, m}];

End[ ]
EndPackage[ ]



