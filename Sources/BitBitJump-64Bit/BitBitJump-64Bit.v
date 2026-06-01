// The VitaSet License.
//
// Copyright (C) 2026 VitaSet LLC. All rights reserved.
//
// Redistribution and use in source, binary and hardware forms, with or
// without modification, are permitted provided that the following
// conditions are met:
//
// 1. Redistributions in source code form must retain the above copyright
// notice, this list of conditions, and the following disclaimer.
//
// 2. Redistributions in binary form or hardware form do not require the
// inclusion of any parts of this license's text.
//
// NO EXPRESS OR IMPLIED LICENSES TO ANY PARTY'S PATENT RIGHTS ARE
// GRANTED BY THIS LICENSE. THE SOURCE CODE, BINARIES AND HARDWARE
// THAT ARE UNDER THIS LICENSE ARE PROVIDED BY THE COPYRIGHT
// HOLDERS AND CONTRIBUTORS “AS IS” AND ANY EXPRESS OR IMPLIED
// WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
// OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR
// CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL
// EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
// TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
// OUT OF THE REDISTRIBUTION OR USE OF ANY SOURCE CODE, BINARIES OR
// HARDWARE UNDER THIS LICENSE, EVEN IF ADVISED OF THE POSSIBILITY OF
// SUCH DAMAGES.

module BitBitJump_64Bit(input clk);
	reg BBJreg[191:0] = 0;
	reg memory[18446744073709551615:0] = 0;
	reg BBJipAddr[63:0] = 0;
	reg BBJsrcAddr[63:0] = 0;
	reg BBJdestAddr[63:0] = 0;
	initial
		BBJipAddr[7:0] = 8'b10111111;
	always @(posedge clk)
		begin
			BBJreg[191:0] <= memory[BBJipAddr-:192];
			BBJipAddr[63:0] <= BBJreg[191:128];
			BBJsrcAddr[63:0] <= BBJreg[127:64];
			BBJdestAddr[63:0] <= BBJreg[63:0];
			BBJreg[192:192] <= memory[BBJsrcAddr];
			memory[BBJdestAddr] <= BBJreg[192:192];
		end
endmodule
