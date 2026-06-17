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
//
`default_nettype none
module VitaFieldProgrammableGateArrayArchitectureLogicBlock(IONorth, IOEast, IOSouth, IOWest, ClockLine, ReInitializationWriteEnableLine, ReInitializationLines);
	inout wire [0:0] IONorth;
	inout wire [0:0] IOEast;
	inout wire [0:0] IOSouth;
	inout wire [0:0] IOWest;
	input wire [0:0] ClockLine;
	input wire [0:0] ReInitializationWriteEnableLine;
	input wire [6:0] ReInitializationLines;
	reg [2:0] IOReconfigurationTripleDTypeFlipFlopRegister = 3'b000;
	reg [3:0] LookUpTableQuadrupleDTypeFlipFlopRegister = 4'b0000;
	always @(posedge ClockLine) begin
		if (ReInitializationWriteEnableLine[0:0] == 1'b1) begin
			IOReconfigurationTripleDTypeFlipFlopRegister[2:0] <= ReInitializationLines[6:4];
			LookUpTableQuadrupleDTypeFlipFlopRegister[3:0] <= ReInitializationLines[3:0];
		end else begin
			IONorth[0:0] <= ( ( ( ( ( ~ IOEast[0:0] ) &
				( ~ IOSouth[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[0:0] ) |
				( ( ~ IOEast[0:0] ) &
				IOSouth[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[1:1] ) |
				( IOEast[0:0] &
				( ~ IOSouth[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[2:2] ) |
				( IOEast[0:0] &
				IOSouth[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[3:3] ) ) &
				( ( ~ IOReconfigurationTripleDTypeFlipFlopRegister[2:2] ) &
				( ~ IOReconfigurationTripleDTypeFlipFlopRegister[1:1] ) &
				IOReconfigurationTripleDTypeFlipFlopRegister[0:0] ) ) |
				( ( ( ( ~ IOEast[0:0] ) &
				( ~ IOWest[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[0:0] ) |
				( ( ~ IOEast[0:0] ) &
				IOWest[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[1:1] ) |
				( IOEast[0:0] &
				( ~ IOWest[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[2:2] ) |
				( IOEast[0:0] &
				IOWest[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[3:3] ) ) &
				( IOReconfigurationTripleDTypeFlipFlopRegister[2:2] &
				( ~ IOReconfigurationTripleDTypeFlipFlopRegister[1:1] ) &
				IOReconfigurationTripleDTypeFlipFlopRegister[0:0] ) ) |
				( ( ( ( ~ IOSouth[0:0] ) &
				( ~ IOWest[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[0:0] ) |
				( ( ~ IOSouth[0:0] ) &
				IOWest[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[1:1] ) |
				( IOSouth[0:0] &
				( ~ IOWest[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[2:2] ) |
				( IOSouth[0:0] &
				IOWest[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[3:3] ) ) &
				( ( ~ IOReconfigurationTripleDTypeFlipFlopRegister[2:2] ) &
				IOReconfigurationTripleDTypeFlipFlopRegister[1:1] &
				( ~ IOReconfigurationTripleDTypeFlipFlopRegister[0:0] ) ) ) );
			IOEast[0:0] <= ( ( ( ( ( ~ IONorth[0:0] ) &
				( ~ IOSouth[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[0:0] ) |
				( ( ~ IONorth[0:0] ) &
				IOSouth[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[1:1] ) |
				( IONorth[0:0] &
				( ~ IOSouth[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[2:2] ) |
				( IONorth[0:0] &
				IOSouth[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[3:3] ) ) &
				( IOReconfigurationTripleDTypeFlipFlopRegister[2:2] &
				( ~ IOReconfigurationTripleDTypeFlipFlopRegister[1:1] ) &
				( ~ IOReconfigurationTripleDTypeFlipFlopRegister[0:0] ) ) ) |
				( ( ( ( ~ IONorth[0:0] ) &
				( ~ IOWest[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[0:0] ) |
				( ( ~ IONorth[0:0] ) &
				IOWest[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[1:1] ) |
				( IONorth[0:0] &
				( ~ IOWest[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[2:2] ) |
				( IONorth[0:0] &
				IOWest[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[3:3] ) ) &
				( ( ~ IOReconfigurationTripleDTypeFlipFlopRegister[2:2] ) &
				IOReconfigurationTripleDTypeFlipFlopRegister[1:1] &
				IOReconfigurationTripleDTypeFlipFlopRegister[0:0] ) ) |
				( ( ( ( ~ IOSouth[0:0] ) &
				( ~ IOWest[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[0:0] ) |
				( ( ~ IOSouth[0:0] ) &
				IOWest[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[1:1] ) |
				( IOSouth[0:0] &
				( ~ IOWest[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[2:2] ) |
				( IOSouth[0:0] &
				IOWest[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[3:3] ) ) &
				( ( ~ IOReconfigurationTripleDTypeFlipFlopRegister[2:2] ) &
				IOReconfigurationTripleDTypeFlipFlopRegister[1:1] &
				( ~ IOReconfigurationTripleDTypeFlipFlopRegister[0:0] ) ) ) );
			IOSouth[0:0] <= ( ( ( ( ( ~ IONorth[0:0] ) &
				( ~ IOEast[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[0:0] ) |
				( ( ~ IONorth[0:0] ) &
				IOEast[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[1:1] ) |
				( IONorth[0:0] &
				( ~ IOEast[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[2:2] ) |
				( IONorth[0:0] &
				IOEast[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[3:3] ) ) &
				( ( ~ IOReconfigurationTripleDTypeFlipFlopRegister[2:2] ) &
				( ~ IOReconfigurationTripleDTypeFlipFlopRegister[1:1] ) &
				( ~ IOReconfigurationTripleDTypeFlipFlopRegister[0:0] ) ) ) |
				( ( ( ( ~ IONorth[0:0] ) &
				( ~ IOWest[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[0:0] ) |
				( ( ~ IONorth[0:0] ) &
				IOWest[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[1:1] ) |
				( IONorth[0:0] &
				( ~ IOWest[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[2:2] ) |
				( IONorth[0:0] &
				IOWest[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[3:3] ) ) &
				( ( ~ IOReconfigurationTripleDTypeFlipFlopRegister[2:2] ) &
				IOReconfigurationTripleDTypeFlipFlopRegister[1:1] &
				IOReconfigurationTripleDTypeFlipFlopRegister[0:0] ) ) |
				( ( ( ( ~ IOEast[0:0] ) &
				( ~ IOWest[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[0:0] ) |
				( ( ~ IOEast[0:0] ) &
				IOWest[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[1:1] ) |
				( IOEast[0:0] &
				( ~ IOWest[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[2:2] ) |
				( IOEast[0:0] &
				IOWest[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[3:3] ) ) &
				( IOReconfigurationTripleDTypeFlipFlopRegister[2:2] &
				( ~ IOReconfigurationTripleDTypeFlipFlopRegister[1:1] ) &
				IOReconfigurationTripleDTypeFlipFlopRegister[0:0] ) ) );
			IOWest[0:0] <= ( ( ( ( ( ~ IONorth[0:0] ) &
				( ~ IOEast[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[0:0] ) |
				( ( ~ IONorth[0:0] ) &
				IOEast[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[1:1] ) |
				( IONorth[0:0] &
				( ~ IOEast[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[2:2] ) |
				( IONorth[0:0] &
				IOEast[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[3:3] ) ) &
				( ( ~ IOReconfigurationTripleDTypeFlipFlopRegister[2:2] ) &
				( ~ IOReconfigurationTripleDTypeFlipFlopRegister[1:1] ) &
				( ~ IOReconfigurationTripleDTypeFlipFlopRegister[0:0] ) ) ) |
				( ( ( ( ~ IONorth[0:0] ) &
				( ~ IOSouth[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[0:0] ) |
				( ( ~ IONorth[0:0] ) &
				IOSouth[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[1:1] ) |
				( IONorth[0:0] &
				( ~ IOSouth[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[2:2] ) |
				( IONorth[0:0] &
				IOSouth[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[3:3] ) ) &
				( IOReconfigurationTripleDTypeFlipFlopRegister[2:2] &
				( ~ IOReconfigurationTripleDTypeFlipFlopRegister[1:1] ) &
				( ~ IOReconfigurationTripleDTypeFlipFlopRegister[0:0] ) ) ) |
				( ( ( ( ~ IOEast[0:0] ) &
				( ~ IOSouth[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[0:0] ) |
				( ( ~ IOEast[0:0] ) &
				IOSouth[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[1:1] ) |
				( IOEast[0:0] &
				( ~ IOSouth[0:0] ) &
				LookUpTableQuadrupleDTypeFlipFlopRegister[2:2] ) |
				( IOEast[0:0] &
				IOSouth[0:0] &
				LookUpTableQuadrupleDTypeFlipFlopRegister[3:3] ) ) &
				( ( ~ IOReconfigurationTripleDTypeFlipFlopRegister[2:2] ) &
				( ~ IOReconfigurationTripleDTypeFlipFlopRegister[1:1] ) &
				IOReconfigurationTripleDTypeFlipFlopRegister[0:0] ) ) );
		end
	end
endmodule
