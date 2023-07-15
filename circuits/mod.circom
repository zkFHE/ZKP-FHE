pragma circom 2.1.0;

include "fast_compconstant.circom";

template parallel Mod(q) {
	signal input in;
	signal quotient;
	signal output out;

	/*
	var p = 21888242871839275222246405745257275088548364400416034343698204186575808495617; // TODO: define modularly
	var delta = p \ q; // TODO: ceil? round?
	*/
	var delta = (1 << 253) \ q; // TODO: this might fail if the quotient is too big. However, this prevents issues with ark-circom, and makes the circuit independent of the ZKP field modulus.

	quotient <-- in \ q;
	out <-- in % q;
   
	parallel LtConstant(q)(out);
	parallel LtConstant(delta)(quotient);

	in === quotient * q + out;
}
