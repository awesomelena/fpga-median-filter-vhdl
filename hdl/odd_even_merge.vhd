library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity odd_even_merge is
    port(clk: in std_logic;
         a0: in std_logic_vector(7 downto 0);
         a1: in std_logic_vector(7 downto 0);
         a2: in std_logic_vector(7 downto 0);
         a3: in std_logic_vector(7 downto 0);
         a4: in std_logic_vector(7 downto 0);
         a5: in std_logic_vector(7 downto 0);
         a6: in std_logic_vector(7 downto 0);
         a7: in std_logic_vector(7 downto 0);
         a8: in std_logic_vector(7 downto 0);
         med: out std_logic_vector(7 downto 0));
end odd_even_merge;

architecture Behavioral of odd_even_merge is
component min_max is
    port(a: in std_logic_vector(7 downto 0);
         b: in std_logic_vector(7 downto 0);
         min: out std_logic_vector(7 downto 0);
         max: out std_logic_vector(7 downto 0));
         
end component;
component reg8b is
    port(clk : in std_logic;
         data_in: in std_logic_vector(7 downto 0);
         data_out: out std_logic_vector(7 downto 0));
end component;
signal t0, t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23, t24, t25, t26, t27, t28, t29, t30, t31, t32, t33, t34, t35, t36, t37, t38, t39, t40, t41, t42, t43, t44, t45, t46, t47: std_logic_vector(7 downto 0);
signal r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18, r19, r20, r21, r22, r23, r24, r25, r26, r27, r28, r29, r30, r31, r32, r33, r34, r35, r36, r37, r38, r39, r40, r41, r42, r43, r44, r45, r46, r47, r48, r49, r50, r51, r52, r53, r54, r55, r56, r57, r58, r59, r60, r61, r62, r63, r64, r65, r66, r67, r68, r69, r70, r71, r72, r73, r74, r75, r76, r77, r78, r79, r80: std_logic_vector(7 downto 0);
begin
    reg0 : reg8b port map(clk => clk, data_in => a0, data_out => r0);
    reg1 : reg8b port map(clk => clk, data_in => a1, data_out => r1);
    reg2 : reg8b port map(clk => clk, data_in => a2, data_out => r2);
    reg3 : reg8b port map(clk => clk, data_in => a3, data_out => r3);
    reg4 : reg8b port map(clk => clk, data_in => a4, data_out => r4);
    reg5 : reg8b port map(clk => clk, data_in => a5, data_out => r5);
    reg6 : reg8b port map(clk => clk, data_in => a6, data_out => r6);
    reg7 : reg8b port map(clk => clk, data_in => a7, data_out => r7);
    reg8 : reg8b port map(clk => clk, data_in => a8, data_out => r8);
    mm1: min_max port map(a => r0, b => r1, min => t0, max => t1); -- 0 i 1
    mm2: min_max port map(a => r2, b => r3, min => t2, max => t3); -- 2 i 3
    mm3: min_max port map(a => r4, b => r5, min => t4, max => t5); -- 4 i 5
    mm4: min_max port map(a => r6, b => r7, min => t6, max => t7); -- 6 i 7
    reg0st1: reg8b port map( clk => clk, data_in => t0, data_out => r45); -- 0
    reg1st1: reg8b port map( clk => clk, data_in => t1, data_out => r46); -- 1
    reg2st1: reg8b port map( clk => clk, data_in => t2, data_out => r47); -- 2
    reg3st1: reg8b port map( clk => clk, data_in => t3, data_out => r48); -- 3
    reg4st1: reg8b port map( clk => clk, data_in => t4, data_out => r49); -- 4
    reg5st1: reg8b port map( clk => clk, data_in => t5, data_out => r50); -- 5
    reg6st1: reg8b port map( clk => clk, data_in => t6, data_out => r51); -- 6
    reg7st1: reg8b port map( clk => clk, data_in => t7, data_out => r52); -- 7
    reg8st1: reg8b port map( clk => clk, data_in => r8, data_out => r53); --8
    mm5: min_max port map(a => r45, b => r47, min => t8, max => t9); -- 0 i 2
    mm6: min_max port map(a => r46, b => r48, min => t10, max => t11); -- 1 i 3
    mm7: min_max port map(a => r49, b => r51, min => t12, max => t13); -- 4 i 6
    mm8: min_max port map(a => r50, b => r52, min => t14, max => t15); -- 5 i 7
    reg0st2: reg8b port map( clk => clk, data_in => t8, data_out => r9); -- 0
    reg1st2: reg8b port map( clk => clk, data_in => t10, data_out => r10); -- 1
    reg2st2: reg8b port map( clk => clk, data_in => t9, data_out => r11); -- 2
    reg3st2: reg8b port map( clk => clk, data_in => t11, data_out => r12); -- 3
    reg4st2: reg8b port map( clk => clk, data_in => t12, data_out => r13); -- 4
    reg5st2: reg8b port map( clk => clk, data_in => t14, data_out => r14); -- 5
    reg6st2: reg8b port map( clk => clk, data_in => t13, data_out => r15); -- 6
    reg7st2: reg8b port map( clk => clk, data_in => t15, data_out => r16); -- 7
    reg8st2: reg8b port map( clk => clk, data_in => r53, data_out => r17); --8
    mm9: min_max port map(a => r10, b => r11, min => t16, max => t17); -- 1 i 2
    mm10: min_max port map(a => r14, b => r15, min => t18, max => t19); -- 5 i 6
    reg0st3: reg8b port map( clk => clk, data_in => r9, data_out => r54); -- 0
    reg1st3: reg8b port map( clk => clk, data_in => t16, data_out => r55); -- 1
    reg2st3: reg8b port map( clk => clk, data_in => t17, data_out => r56); -- 2
    reg3st3: reg8b port map( clk => clk, data_in => r12, data_out => r57); -- 3
    reg4st3: reg8b port map( clk => clk, data_in => r13, data_out => r58); -- 4
    reg5st3: reg8b port map( clk => clk, data_in => t18, data_out => r59); -- 5
    reg6st3: reg8b port map( clk => clk, data_in => t19, data_out => r60); -- 6
    reg7st3: reg8b port map( clk => clk, data_in => r16, data_out => r61); -- 7
    reg8st3: reg8b port map( clk => clk, data_in => r17, data_out => r62); --8
    mm11: min_max port map(a => r54, b => r58, min => t20, max => t21); -- 0 i 4
    mm12: min_max port map(a => r55, b => r59, min => t22, max => t23); -- 1 i 5
    mm13: min_max port map(a => r56, b => r60, min => t24, max => t25); -- 2 i 6
    mm14: min_max port map(a => r57, b => r61, min => t26, max => t27); -- 3 i 7
    reg0st4: reg8b port map( clk => clk, data_in => t20, data_out => r27); -- 0
    reg1st4: reg8b port map( clk => clk, data_in => t22, data_out => r28); -- 1
    reg2st4: reg8b port map( clk => clk, data_in => t24, data_out => r29); -- 2
    reg3st4: reg8b port map( clk => clk, data_in => t26, data_out => r30); -- 3
    reg4st4: reg8b port map( clk => clk, data_in => t21, data_out => r31); -- 4
    reg5st4: reg8b port map( clk => clk, data_in => t23, data_out => r32); -- 5
    reg6st4: reg8b port map( clk => clk, data_in => t25, data_out => r33); -- 6
    reg7st4: reg8b port map( clk => clk, data_in => t27, data_out => r34); -- 7
    reg8st4: reg8b port map( clk => clk, data_in => r62, data_out => r35); --8
    mm15: min_max port map(a => r29, b => r31, min => t28, max => t29); -- 2 i 4
    mm16: min_max port map(a => r30, b => r32, min => t30, max => t31); -- 3 i 5
    reg0st5: reg8b port map( clk => clk, data_in => r27, data_out => r63); -- 0
    reg1st5: reg8b port map( clk => clk, data_in => r28, data_out => r64); -- 1
    reg2st5: reg8b port map( clk => clk, data_in => t28, data_out => r65); -- 2
    reg3st5: reg8b port map( clk => clk, data_in => t30, data_out => r66); -- 3
    reg4st5: reg8b port map( clk => clk, data_in => t29, data_out => r67); -- 4
    reg5st5: reg8b port map( clk => clk, data_in => t31, data_out => r68); -- 5
    reg6st5: reg8b port map( clk => clk, data_in => r33, data_out => r69); -- 6
    reg7st5: reg8b port map( clk => clk, data_in => r34, data_out => r70); -- 7
    reg8st5: reg8b port map( clk => clk, data_in => r35, data_out => r71); --8
    mm17: min_max port map(a => r64, b => r65, min => t32, max => t33); -- 1 i 2
    mm18: min_max port map(a => r66, b => r67, min => t34, max => t35); -- 3 i 4
    mm19: min_max port map(a => r68, b => r69, min => t36, max => t37); -- 5 i 6
    mm20: min_max port map(a => r63, b => r71, min => t38, max => t39); -- 0 i 8
    reg0st6: reg8b port map( clk => clk, data_in => t38, data_out => r18); -- 0
    reg1st6: reg8b port map( clk => clk, data_in => t32, data_out => r19); -- 1
    reg2st6: reg8b port map( clk => clk, data_in => t33, data_out => r20); -- 2
    reg3st6: reg8b port map( clk => clk, data_in => t34, data_out => r21); -- 3
    reg4st6: reg8b port map( clk => clk, data_in => t35, data_out => r22); -- 4
    reg5st6: reg8b port map( clk => clk, data_in => t36, data_out => r23); -- 5
    reg6st6: reg8b port map( clk => clk, data_in => t37, data_out => r24); -- 6
    reg7st6: reg8b port map( clk => clk, data_in => r70, data_out => r25); -- 7
    reg8st6: reg8b port map( clk => clk, data_in => t39 , data_out => r26); -- 8 
    mm21: min_max port map(a => r22, b => r26, min => t40, max => t41); -- 4 i 8
    reg0st7: reg8b port map( clk => clk, data_in => r18, data_out => r72); -- 0
    reg1st7: reg8b port map( clk => clk, data_in => r19, data_out => r73); -- 1
    reg2st7: reg8b port map( clk => clk, data_in => r20, data_out => r74); -- 2
    reg3st7: reg8b port map( clk => clk, data_in => r21, data_out => r75); -- 3
    reg4st7: reg8b port map( clk => clk, data_in => t40, data_out => r76); -- 4
    reg5st7: reg8b port map( clk => clk, data_in => r23, data_out => r77); -- 5
    reg6st7: reg8b port map( clk => clk, data_in => r24, data_out => r78); -- 6
    reg7st7: reg8b port map( clk => clk, data_in => r25, data_out => r79); -- 7
    reg8st7: reg8b port map( clk => clk, data_in => t41, data_out => r80); --8
    mm22: min_max port map(a => r74, b => r76, min => t42, max => t43); -- 2 i 4
    mm23: min_max port map(a => r75, b => r77, min => t44, max => t45); -- 3 i 5
    reg0st8: reg8b port map( clk => clk, data_in => r72, data_out => r36); -- 0
    reg1st8: reg8b port map( clk => clk, data_in => r73, data_out => r37); -- 1
    reg2st8: reg8b port map( clk => clk, data_in => t42, data_out => r38); -- 2
    reg3st8: reg8b port map( clk => clk, data_in => t44, data_out => r39); -- 3
    reg4st8: reg8b port map( clk => clk, data_in => t43, data_out => r40); -- 4
    reg5st8: reg8b port map( clk => clk, data_in => t45, data_out => r41); -- 5
    reg6st8: reg8b port map( clk => clk, data_in => r78, data_out => r42); -- 6
    reg7st8: reg8b port map( clk => clk, data_in => r79, data_out => r43); -- 7
    reg8st8: reg8b port map( clk => clk, data_in => r80 , data_out => r44); -- 8 
    mm24: min_max port map(a => r39, b => r40, min => t46, max => t47); -- 3 i 4
    reg_out: reg8b port map(clk => clk, data_in => t47, data_out => med);
    --izracunavanje medijane traje 10 taktova
    
    
 
end Behavioral;
-- maksimalna ucestanost pre pipelinea: 36MHz
-- maksimalna ucestanost nakon pipeliena: 285MHz