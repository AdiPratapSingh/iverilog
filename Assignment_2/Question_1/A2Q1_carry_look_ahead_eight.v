module carry_look_ahead_eight(a,b,cin,cout,sum);
    input [7:0]a;
    input [7:0]b;
    input cin;

    output [7:0] sum;
    output cout;
    wire [7:0] c;
    wire [7:0] p;
    wire [7:0] g;

    assign p[0] = a[0] ^ b[0];assign g[0] = a[0] & b[0];
    assign p[1] = a[1] ^ b[1];assign g[1] = a[1] & b[1];
    assign p[2] = a[2] ^ b[2];assign g[2] = a[2] & b[2];
    assign p[3] = a[3] ^ b[3];assign g[3] = a[3] & b[3];
    assign p[4] = a[4] ^ b[4];assign g[4] = a[4] & b[4];
    assign p[5] = a[5] ^ b[5];assign g[5] = a[5] & b[5];
    assign p[6] = a[6] ^ b[6];assign g[6] = a[6] & b[6];
    assign p[7] = a[7] ^ b[7];assign g[7] = a[7] & b[7];

    
    assign c[1] = g[0] || (p[0] && cin);
    assign c[2] = g[1] || (p[1] && g[0]) || (p[1]&&p[0]&&cin);
    assign c[3] = g[2] || (p[2] && (g[1] || (p[1] && g[0]) || (p[1]&&p[0]&&cin)));
    assign c[4] = g[3] || (p[3] && (g[2] || (p[2] && (g[1] || (p[1] && g[0]) || (p[1]&&p[0]&&cin)))));
    assign c[5] = g[4] || (p[4] && (g[3] || (p[3] && (g[2] || (p[2] && (g[1] || (p[1] && g[0]) || (p[1]&&p[0]&&cin)))))));
    assign c[6] = g[5] || (p[5] && (g[4] || (p[4] && (g[3] || (p[3] && (g[2] || (p[2] && (g[1] || (p[1] && g[0]) || (p[1]&&p[0]&&cin)))))))));
    assign c[7] = g[6] || (p[6] && (g[5] || (p[5] && (g[4] || (p[4] && (g[3] || (p[3] && (g[2] || (p[2] && (g[1] || (p[1] && g[0]) || (p[1]&&p[0]&&cin)))))))))));
    assign cout = g[7] || (p[7] && (g[6] || (p[6] && (g[5] || (p[5] && (g[4] || (p[4] && (g[3] || (p[3] && (g[2] || (p[2] && (g[1] || (p[1] && g[0]) || (p[1]&&p[0]&&cin)))))))))))));

    carry_look_ahead_single D1(a[0],b[0],cin,sum[0]);
    carry_look_ahead_single D2(a[1],b[1],c[1],sum[1]);
    carry_look_ahead_single D3(a[2],b[2],c[2],sum[2]);
    carry_look_ahead_single D4(a[3],b[3],c[3],sum[3]);
    carry_look_ahead_single D5(a[4],b[4],c[4],sum[4]);
    carry_look_ahead_single D6(a[5],b[5],c[5],sum[5]);
    carry_look_ahead_single D7(a[6],b[6],c[6],sum[6]);
    carry_look_ahead_single D8(a[7],b[7],c[7],sum[7]);

endmodule