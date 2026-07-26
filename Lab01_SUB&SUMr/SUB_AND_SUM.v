module SUB_AND_SUM #(
    parameter WIDTH = 4
)(
  input[WIDTH-1:0]IN1,IN2,
  input en,
  output  reg [WIDTH-1:0]out,
  output  reg carry
);
   always @(*) begin
    if (en) begin
        {carry,out}=IN1+IN2;
    end else begin
        {carry,out}=IN1-IN2;
    end
   end 
endmodule
