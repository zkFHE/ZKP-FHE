pragma circom 2.1.0;

include "mul.circom";

component main {public [in1, in2]} = MulPolySchoolbook(2048, (1<<56));