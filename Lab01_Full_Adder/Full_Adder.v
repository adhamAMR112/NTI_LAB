module full_Adder(
    input wire a,b,cin,
    output reg sum,cout
);
reg c;
reg d;
reg e;
    always @(*) begin
     c=a^b;
     d=a&b;
     sum=c^cin;
     e=c&cin;
     cout=e|d;
    end
endmodule