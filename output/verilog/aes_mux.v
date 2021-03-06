// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2015.3
// Copyright (C) 2015 Xilinx Inc. All rights reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="aes_mux,hls_ip_2015_3,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xc7vx485tffg1761-2,HLS_INPUT_CLOCK=4.000000,HLS_INPUT_ARCH=pipeline,HLS_SYN_CLOCK=2.792000,HLS_SYN_LAT=1,HLS_SYN_TPT=1,HLS_SYN_MEM=8,HLS_SYN_DSP=0,HLS_SYN_FF=551,HLS_SYN_LUT=211}" *)

module aes_mux (
        ap_clk,
        ap_rst,
        in_V_V_dout,
        in_V_V_empty_n,
        in_V_V_read,
        out_V_V_din,
        out_V_V_full_n,
        out_V_V_write,
        text_V_V_din,
        text_V_V_full_n,
        text_V_V_write,
        key_V_V_din,
        key_V_V_full_n,
        key_V_V_write,
        enc_V,
        enc_valid_V
);

parameter    ap_const_logic_1 = 1'b1;
parameter    ap_const_logic_0 = 1'b0;
parameter    ap_ST_st1_fsm0_0 = 1'b0;
parameter    ap_ST_st2_fsm1_1 = 1'b0;
parameter    ap_ST_st0_fsm1_0 = 1'b1;
parameter    ap_const_lv2_0 = 2'b00;
parameter    ap_const_lv128_lc_1 = 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter    ap_const_lv1_0 = 1'b0;
parameter    ap_const_lv2_2 = 2'b10;
parameter    ap_const_lv2_1 = 2'b1;
parameter    ap_const_lv1_1 = 1'b1;
parameter    ap_true = 1'b1;

input   ap_clk;
input   ap_rst;
input  [127:0] in_V_V_dout;
input   in_V_V_empty_n;
output   in_V_V_read;
output  [127:0] out_V_V_din;
input   out_V_V_full_n;
output   out_V_V_write;
output  [127:0] text_V_V_din;
input   text_V_V_full_n;
output   text_V_V_write;
output  [127:0] key_V_V_din;
input   key_V_V_full_n;
output   key_V_V_write;
input  [127:0] enc_V;
input  [0:0] enc_valid_V;

reg in_V_V_read;
reg out_V_V_write;
reg text_V_V_write;
reg key_V_V_write;
wire   [127:0] encFIFO_V_V_dout;
wire    encFIFO_V_V_empty_n;
reg    encFIFO_V_V_read;
wire   [127:0] encFIFO_V_V_din;
wire    encFIFO_V_V_full_n;
reg    encFIFO_V_V_write;
reg   [1:0] inState = 2'b00;
reg   [127:0] kv_V = 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
reg   [127:0] tv_V = 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
reg   [0:0] outState = 1'b0;
reg   [127:0] ev_V = 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
wire   [0:0] enc_valid_V_read_read_fu_78_p2;
reg   [0:0] ap_CS_fsm0 = 1'b0;
reg   [0:0] ap_CS_fsm1 = 1'b1;
wire   [0:0] tmp_nbwritereq_fu_98_p3;
wire   [1:0] inState_load_load_fu_173_p1;
wire   [0:0] full_n_nbwrite_fu_106_p3;
wire   [0:0] outState_load_load_fu_213_p1;
wire   [0:0] full_n_1_nbwrite_fu_132_p3;
wire   [0:0] grp_nbread_fu_126_p2_0;
wire   [1:0] storemerge_fu_187_p3;
wire   [0:0] grp_fu_145_p1;
wire   [0:0] grp_fu_159_p1;
wire   [0:0] storemerge_fu_187_p0;
reg   [0:0] ap_NS_fsm0;
reg   [0:0] ap_NS_fsm1;
wire    encFIFO_V_V_encFIFO_V_V_fifo_U_ap_dummy_ce;
reg    ap_sig_bdd_146;
reg    ap_sig_bdd_111;


FIFO_aes_mux_encFIFO_V_V encFIFO_V_V_encFIFO_V_V_fifo_U(
    .clk( ap_clk ),
    .reset( ap_rst ),
    .if_read_ce( encFIFO_V_V_encFIFO_V_V_fifo_U_ap_dummy_ce ),
    .if_write_ce( encFIFO_V_V_encFIFO_V_V_fifo_U_ap_dummy_ce ),
    .if_din( encFIFO_V_V_din ),
    .if_full_n( encFIFO_V_V_full_n ),
    .if_write( encFIFO_V_V_write ),
    .if_dout( encFIFO_V_V_dout ),
    .if_empty_n( encFIFO_V_V_empty_n ),
    .if_read( encFIFO_V_V_read )
);



/// the current state (ap_CS_fsm0) of the state machine. ///
always @ (posedge ap_clk) begin : ap_ret_ap_CS_fsm0
    if (ap_rst == 1'b1) begin
        ap_CS_fsm0 <= ap_ST_st1_fsm0_0;
    end else begin
        ap_CS_fsm0 <= ap_NS_fsm0;
    end
end

/// the current state (ap_CS_fsm1) of the state machine. ///
always @ (posedge ap_clk) begin : ap_ret_ap_CS_fsm1
    if (ap_rst == 1'b1) begin
        ap_CS_fsm1 <= ap_ST_st0_fsm1_0;
    end else begin
        ap_CS_fsm1 <= ap_NS_fsm1;
    end
end

/// ev_V assign process. ///
always @ (posedge ap_clk) begin : ap_ret_ev_V
    if (ap_rst == 1'b1) begin
        ev_V <= ap_const_lv128_lc_1;
    end else begin
        if ((((ap_ST_st2_fsm1_1 == ap_CS_fsm1) & (ap_const_lv1_0 == outState_load_load_fu_213_p1)) | ((ap_ST_st2_fsm1_1 == ap_CS_fsm1) & ~(ap_const_lv1_0 == outState_load_load_fu_213_p1) & ~(ap_const_lv1_0 == full_n_1_nbwrite_fu_132_p3)))) begin
            ev_V <= encFIFO_V_V_dout;
        end
    end
end

/// inState assign process. ///
always @ (posedge ap_clk) begin : ap_ret_inState
    if (ap_rst == 1'b1) begin
        inState <= ap_const_lv2_0;
    end else begin
        if (((ap_ST_st2_fsm1_1 == ap_CS_fsm1) & (ap_const_lv2_0 == inState_load_load_fu_173_p1) & ~(ap_const_lv1_0 == grp_fu_145_p1))) begin
            inState <= ap_const_lv2_1;
        end else if (((ap_ST_st2_fsm1_1 == ap_CS_fsm1) & (inState_load_load_fu_173_p1 == ap_const_lv2_2) & ~(ap_const_lv1_0 == tmp_nbwritereq_fu_98_p3) & ~(ap_const_lv1_0 == full_n_nbwrite_fu_106_p3))) begin
            inState <= storemerge_fu_187_p3;
        end else if ((((ap_ST_st2_fsm1_1 == ap_CS_fsm1) & (inState_load_load_fu_173_p1 == ap_const_lv2_2) & (ap_const_lv1_0 == tmp_nbwritereq_fu_98_p3)) | ((ap_ST_st2_fsm1_1 == ap_CS_fsm1) & (inState_load_load_fu_173_p1 == ap_const_lv2_1) & ~(ap_const_lv1_0 == grp_fu_145_p1)))) begin
            inState <= ap_const_lv2_2;
        end
    end
end

/// kv_V assign process. ///
always @ (posedge ap_clk) begin : ap_ret_kv_V
    if (ap_rst == 1'b1) begin
        kv_V <= ap_const_lv128_lc_1;
    end else begin
        if (((ap_ST_st2_fsm1_1 == ap_CS_fsm1) & (ap_const_lv2_0 == inState_load_load_fu_173_p1))) begin
            kv_V <= in_V_V_dout;
        end
    end
end

/// outState assign process. ///
always @ (posedge ap_clk) begin : ap_ret_outState
    if (ap_rst == 1'b1) begin
        outState <= ap_const_lv1_0;
    end else begin
        if ((ap_ST_st2_fsm1_1 == ap_CS_fsm1)) begin
            if (ap_sig_bdd_111) begin
                outState <= grp_nbread_fu_126_p2_0;
            end else if (ap_sig_bdd_146) begin
                outState <= ap_const_lv1_1;
            end
        end
    end
end

/// tv_V assign process. ///
always @ (posedge ap_clk) begin : ap_ret_tv_V
    if (ap_rst == 1'b1) begin
        tv_V <= ap_const_lv128_lc_1;
    end else begin
        if ((((ap_ST_st2_fsm1_1 == ap_CS_fsm1) & (inState_load_load_fu_173_p1 == ap_const_lv2_2) & ~(ap_const_lv1_0 == tmp_nbwritereq_fu_98_p3) & ~(ap_const_lv1_0 == full_n_nbwrite_fu_106_p3)) | ((ap_ST_st2_fsm1_1 == ap_CS_fsm1) & (inState_load_load_fu_173_p1 == ap_const_lv2_1)))) begin
            tv_V <= in_V_V_dout;
        end
    end
end

/// encFIFO_V_V_read assign process. ///
always @ (encFIFO_V_V_empty_n or ap_CS_fsm1 or outState_load_load_fu_213_p1 or full_n_1_nbwrite_fu_132_p3) begin
    if (((ap_const_logic_1 == encFIFO_V_V_empty_n) & (((ap_ST_st2_fsm1_1 == ap_CS_fsm1) & ~(ap_const_lv1_0 == outState_load_load_fu_213_p1) & ~(ap_const_lv1_0 == full_n_1_nbwrite_fu_132_p3)) | ((ap_ST_st2_fsm1_1 == ap_CS_fsm1) & (ap_const_lv1_0 == outState_load_load_fu_213_p1) & (ap_const_logic_1 == encFIFO_V_V_empty_n))))) begin
        encFIFO_V_V_read = ap_const_logic_1;
    end else begin
        encFIFO_V_V_read = ap_const_logic_0;
    end
end

/// encFIFO_V_V_write assign process. ///
always @ (encFIFO_V_V_full_n or enc_valid_V_read_read_fu_78_p2 or ap_CS_fsm0) begin
    if (((ap_ST_st1_fsm0_0 == ap_CS_fsm0) & ~(ap_const_lv1_0 == enc_valid_V_read_read_fu_78_p2) & (ap_const_logic_1 == encFIFO_V_V_full_n))) begin
        encFIFO_V_V_write = ap_const_logic_1;
    end else begin
        encFIFO_V_V_write = ap_const_logic_0;
    end
end

/// in_V_V_read assign process. ///
always @ (in_V_V_empty_n or ap_CS_fsm1 or tmp_nbwritereq_fu_98_p3 or inState_load_load_fu_173_p1 or full_n_nbwrite_fu_106_p3) begin
    if (((ap_const_logic_1 == in_V_V_empty_n) & (((ap_ST_st2_fsm1_1 == ap_CS_fsm1) & (ap_const_lv2_0 == inState_load_load_fu_173_p1)) | ((ap_const_logic_1 == in_V_V_empty_n) & (((ap_ST_st2_fsm1_1 == ap_CS_fsm1) & (inState_load_load_fu_173_p1 == ap_const_lv2_1)) | ((ap_ST_st2_fsm1_1 == ap_CS_fsm1) & (inState_load_load_fu_173_p1 == ap_const_lv2_2) & ~(ap_const_lv1_0 == tmp_nbwritereq_fu_98_p3) & ~(ap_const_lv1_0 == full_n_nbwrite_fu_106_p3) & (ap_const_logic_1 == in_V_V_empty_n))))))) begin
        in_V_V_read = ap_const_logic_1;
    end else begin
        in_V_V_read = ap_const_logic_0;
    end
end

/// key_V_V_write assign process. ///
always @ (key_V_V_full_n or ap_CS_fsm1 or tmp_nbwritereq_fu_98_p3 or inState_load_load_fu_173_p1 or full_n_nbwrite_fu_106_p3) begin
    if (((ap_ST_st2_fsm1_1 == ap_CS_fsm1) & (inState_load_load_fu_173_p1 == ap_const_lv2_2) & ~(ap_const_lv1_0 == tmp_nbwritereq_fu_98_p3) & ~(ap_const_lv1_0 == full_n_nbwrite_fu_106_p3) & (ap_const_logic_1 == key_V_V_full_n))) begin
        key_V_V_write = ap_const_logic_1;
    end else begin
        key_V_V_write = ap_const_logic_0;
    end
end

/// out_V_V_write assign process. ///
always @ (out_V_V_full_n or ap_CS_fsm1 or outState_load_load_fu_213_p1) begin
    if (((ap_ST_st2_fsm1_1 == ap_CS_fsm1) & ~(ap_const_lv1_0 == outState_load_load_fu_213_p1) & (ap_const_logic_1 == out_V_V_full_n))) begin
        out_V_V_write = ap_const_logic_1;
    end else begin
        out_V_V_write = ap_const_logic_0;
    end
end

/// text_V_V_write assign process. ///
always @ (text_V_V_full_n or ap_CS_fsm1 or tmp_nbwritereq_fu_98_p3 or inState_load_load_fu_173_p1) begin
    if (((ap_ST_st2_fsm1_1 == ap_CS_fsm1) & (inState_load_load_fu_173_p1 == ap_const_lv2_2) & ~(ap_const_lv1_0 == tmp_nbwritereq_fu_98_p3) & (ap_const_logic_1 == text_V_V_full_n))) begin
        text_V_V_write = ap_const_logic_1;
    end else begin
        text_V_V_write = ap_const_logic_0;
    end
end
/// the next state (ap_NS_fsm1) of the state machine. ///
always @ (ap_CS_fsm0 or ap_CS_fsm1) begin
    case (ap_CS_fsm1)
        ap_ST_st2_fsm1_1 : 
        begin
            if ((ap_ST_st1_fsm0_0 == ap_CS_fsm0)) begin
                ap_NS_fsm1 = ap_ST_st2_fsm1_1;
            end else if (~(ap_ST_st1_fsm0_0 == ap_CS_fsm0)) begin
                ap_NS_fsm1 = ap_ST_st0_fsm1_0;
            end else begin
                ap_NS_fsm1 = ap_ST_st2_fsm1_1;
            end
        end
        ap_ST_st0_fsm1_0 : 
        begin
            if ((ap_ST_st1_fsm0_0 == ap_CS_fsm0)) begin
                ap_NS_fsm1 = ap_ST_st2_fsm1_1;
            end else begin
                ap_NS_fsm1 = ap_ST_st0_fsm1_0;
            end
        end
        default : 
        begin
            ap_NS_fsm1 = 'bx;
        end
    endcase
end

/// the next state (ap_NS_fsm0) of the state machine. ///
always @ (ap_CS_fsm0) begin
    case (ap_CS_fsm0)
        ap_ST_st1_fsm0_0 : 
        begin
            ap_NS_fsm0 = ap_ST_st1_fsm0_0;
        end
        default : 
        begin
            ap_NS_fsm0 = 'bx;
        end
    endcase
end


/// ap_sig_bdd_111 assign process. ///
always @ (outState_load_load_fu_213_p1 or full_n_1_nbwrite_fu_132_p3) begin
    ap_sig_bdd_111 = (~(ap_const_lv1_0 == outState_load_load_fu_213_p1) & ~(ap_const_lv1_0 == full_n_1_nbwrite_fu_132_p3));
end

/// ap_sig_bdd_146 assign process. ///
always @ (outState_load_load_fu_213_p1 or grp_fu_159_p1) begin
    ap_sig_bdd_146 = ((ap_const_lv1_0 == outState_load_load_fu_213_p1) & ~(ap_const_lv1_0 == grp_fu_159_p1));
end
assign encFIFO_V_V_din = enc_V;
assign encFIFO_V_V_encFIFO_V_V_fifo_U_ap_dummy_ce = ap_const_logic_1;
assign enc_valid_V_read_read_fu_78_p2 = enc_valid_V;
assign full_n_1_nbwrite_fu_132_p3 = out_V_V_full_n;
assign full_n_nbwrite_fu_106_p3 = text_V_V_full_n;
assign grp_fu_145_p1 = in_V_V_empty_n;
assign grp_fu_159_p1 = encFIFO_V_V_empty_n;
assign grp_nbread_fu_126_p2_0 = encFIFO_V_V_empty_n;
assign inState_load_load_fu_173_p1 = inState;
assign key_V_V_din = kv_V;
assign outState_load_load_fu_213_p1 = outState;
assign out_V_V_din = ev_V;
assign storemerge_fu_187_p0 = in_V_V_empty_n;
assign storemerge_fu_187_p3 = ((storemerge_fu_187_p0[0:0] === 1'b1) ? ap_const_lv2_2 : ap_const_lv2_1);
assign text_V_V_din = tv_V;
assign tmp_nbwritereq_fu_98_p3 = out_V_V_full_n;


endmodule //aes_mux

