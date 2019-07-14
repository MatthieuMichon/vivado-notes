library ieee;
use ieee.std_logic_1164.all;
library unisim;
use unisim.vcomponents.all;

entity arty_a7_sample_top is port (
    gclk100: in std_ulogic;
    rstn: in std_ulogic;
    led4: out std_ulogic
); end entity;
architecture a_arty_a7_sample_top_pll of arty_a7_sample_top is
    signal reset: std_ulogic;
    signal mmcm_fb: std_ulogic;
    signal mmcm_clk: std_ulogic;
begin
    reset <= not rstn;
    i_mmcme2_base: mmcme2_base
        generic map (
            CLKIN1_PERIOD => 10.0, -- 10 ns input clock
            CLKFBOUT_MULT_F => 12.0,
            CLKOUT1_DIVIDE => 6
        ) port map (
            clkin1 => gclk100,
            clkfbin => mmcm_fb,
            clkfbout => mmcm_fb,
            clkout1 => mmcm_clk,
            locked => led4,
            rst => reset,
            pwrdwn => '0'
        );
end architecture;
