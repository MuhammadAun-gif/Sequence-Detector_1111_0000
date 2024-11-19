module seq_detect_1(input logic clk,reset,w,
                    output logic z);
    
    //typedef enum logic[3:0] {A,B,C,D,E,F,G,H,I} statetype;
    typedef enum logic [8:0] {A = 9'b000000001, 
                              B = 9'b000000010, 
                              C = 9'b000000100, 
                              D = 9'b000001000, 
                              E = 9'b000010000, 
                              F = 9'b000100000, 
                              G = 9'b001000000, 
                              H = 9'b010000000, 
                              I = 9'b100000000} statetype;
    statetype state,nextstate;

    always_ff @(posedge clk) begin
        if(reset)   state <= A;
        else        state <= nextstate;
    end

    always_comb begin
        case (state) 
            A: nextstate = (w) ? F : B;
            B: nextstate = (w) ? F : C;
            C: nextstate = (w) ? F : D;
            D: nextstate = (w) ? F : E;
            E: nextstate = (w) ? F : E;
            F: nextstate = (w) ? G : B;
            G: nextstate = (w) ? H : B;
            H: nextstate = (w) ? I : B;
            I: nextstate = (w) ? I : B;
            default: nextstate = A; // Default state
        endcase
    end

    // Output Logic
    assign z = (state == E || state == I);
    
endmodule
