module eight_bit_ripple_carry_adder(a,b,cin,cout,sum);
    input [7:0]a;
    input [7:0]b;
    input cin;

    output [7:0] sum;
    output cout;
    wire [6:0] carry;

    // Instantiating eight one bit full adder
    one_bit_full_adder D1(a[0],b[0],cin,sum[0],carry[0]);
    one_bit_full_adder D2(a[1],b[1],carry[0],sum[1],carry[1]);
    one_bit_full_adder D3(a[2],b[2],carry[1],sum[2],carry[2]);
    one_bit_full_adder D4(a[3],b[3],carry[2],sum[3],carry[3]);
    one_bit_full_adder D5(a[4],b[4],carry[3],sum[4],carry[4]);
    one_bit_full_adder D6(a[5],b[5],carry[4],sum[5],carry[5]);
    one_bit_full_adder D7(a[6],b[6],carry[5],sum[6],carry[6]);
    one_bit_full_adder D8(a[7],b[7],carry[6],sum[7],cout);

endmodule