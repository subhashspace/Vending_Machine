`timescale 1ns / 1ps

module vending_machine_tb;

reg clk, reset, coin5, coin10;
wire product, change;

vending_machine uut(clk, reset, coin5, coin10, product, change);

initial
begin
    clk = 0; 
    reset = 1; 
    coin5 = 0; 
    coin10 = 0;

#10;

    reset = 0;

#10

    coin5 = 1; coin10 = 0; 
    #10;
    coin5 = 1; coin10 = 0; 
    #10;
    coin5 = 1; coin10 = 0; 
    #10;
    coin5 = 0; coin10 = 0; 
    #10; 
    coin5 = 0; coin10 = 0;  

#10;

    coin5 = 1; coin10 = 0; 
    #10;
    coin5 = 0; coin10 = 1; 
    #10;
    coin5 = 0; coin10 = 0; 
    #10;
    coin5 = 0; coin10 = 0; 

 #10;

    coin5 = 0; coin10 = 1; 
    #10;
    coin5 = 0; coin10 = 1; 
    #10;
    coin5 = 0; coin10 = 0; 
    #10;
    coin5 = 0; coin10 = 0;

#10;
    $finish;
end
always #5 clk = ~clk;
endmodule