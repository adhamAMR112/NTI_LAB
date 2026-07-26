module RIS_EDGE_DET (CLK,LEVEL,TICK,RST);
localparam ZERO=2'b00;
localparam EDGE=2'b01;
localparam ONE=2'b11;
input CLK,LEVEL,RST;
output reg TICK;
reg [1:0]CS,NS;
always @(posedge CLK) begin
    if (RST)
            CS <= ZERO;
        else
            CS <= NS;
end
  always @(CS) begin
    case (CS)
    ZERO :
     if (LEVEL==0)
     NS=ZERO;
     else
     NS=EDGE;
    EDGE :
     if (LEVEL==0)
     NS=ZERO;
     else
     NS=ONE;   
    ONE :
     if (LEVEL==0)
     NS=ZERO;
     else
     NS=ONE; 
     endcase 
  end
  always @(*) begin
    case(CS)
      ZERO: TICK=1'b0;
      EDGE: TICK=1'b1;
      ONE: TICK=1'b0;

  endcase
  end
endmodule