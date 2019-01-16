library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bcd_arith is
   port
   (
      c_in                    :  in std_logic;
      sign_op1, sign_op2      :  in std_logic;
      op1_ten, op1_one        :  in std_logic_vector(3 downto 0);
      op2_ten, op2_one        :  in std_logic_vector(3 downto 0);

      c_out                   : out std_logic;
      sign_result             : out std_logic;
      result_ten, result_one  : out std_logic_vector(3 downto 0)
   );
end bcd_arith;

architecture behave of bcd_arith is
   -------------------------------------------------------------------- COMPONENT LIST
   component bcd_add_corr 
      port
      (
         c_in        :  in std_logic;                       -- carry in
         op1, op2    :  in std_logic_vector(3 downto 0);    -- Operand 1 and 2 for addition

         c_out       : out std_logic;                       -- carry out
         sum         : out std_logic_vector(3 downto 0)     -- sum
      );
   end component;

   component bcd_sub_corr 
      port
      (
         c_in        :  in std_logic;                       -- borrow / carry in
         op1, op2    :  in std_logic_vector(3 downto 0);    -- minuend, subtrahend

         c_out       : out std_logic;                       -- borrow / carry out
         diff        : out std_logic_vector(3 downto 0)     -- difference
      );
   end component;
   -------------------------------------------------------------------- END COMPONENT LIST
   signal add_cor_ten : std_logic_vector(3 downto 0);
   signal add_cor_one : std_logic_vector(3 downto 0);
   signal c_add_cor_ten, c_add_cor_one : std_logic;

   signal c_sub_cor_pm_one, c_sub_cor_mp_one : std_logic;
   signal c_sub_cor_pm_ten, c_sub_cor_mp_ten : std_logic;
   signal sub_cor_pm_one , sub_cor_mp_one  : std_logic_vector(3 downto 0);
   signal sub_cor_pm_ten, sub_cor_mp_ten : std_logic_vector(3 downto 0);

   signal sign_dump : std_logic;
   signal one_to_ten_carry : std_logic;
begin
   -------------------------------------------------------------------- UNITS
   u_a_c_one   : bcd_add_corr
               port map ( c_in, op1_one, op2_one, c_add_cor_one, add_cor_one );

   u_s_pm_one  : bcd_sub_corr
               port map ( c_in, op1_one, op2_one, c_sub_cor_pm_one, sub_cor_pm_one );

   u_s_mp_one  : bcd_sub_corr
               port map ( c_in, op2_one, op1_one, c_sub_cor_mp_one, sub_cor_mp_one );

   u_a_c_ten   : bcd_add_corr
               port map ( c_add_cor_one, op1_ten, op2_ten, c_add_cor_ten, add_cor_ten );

   u_s_pm_ten  : bcd_sub_corr
               port map ( c_sub_cor_pm_one, op1_ten, op2_ten, c_sub_cor_pm_ten, sub_cor_pm_ten );

   u_s_mp_ten  : bcd_sub_corr
               port map ( c_sub_cor_mp_one, op2_ten, op1_ten, c_sub_cor_mp_ten, sub_cor_mp_ten );
   -------------------------------------------------------------------- END UNITS

   process ( sign_op1, sign_op2, add_cor_ten, sub_cor_pm_ten, sub_cor_mp_ten )
   begin
      if ( sign_op1 = sign_op2  ) then                               -- same sign
         sign_result <= sign_op1;
         c_out       <= c_add_cor_ten;
         result_one  <= add_cor_one;
         result_ten  <= add_cor_ten;
      elsif ( sign_op1 /= sign_op2 ) then                            -- different sign
         if ( (op1_ten = op2_ten) and (op1_one = op2_one) ) then     -- when abs equal = 0000 0000
            sign_result <= '0';
            c_out       <= '0';
            result_one  <= "0000";
            result_ten  <= "0000";
         elsif ( (unsigned(op1_ten) > unsigned(op2_ten)) ) then      -- op1 > op2 -> op1 - op2
            sign_result <= sign_op1;
            c_out       <= c_sub_cor_pm_ten;
            result_one  <= sub_cor_pm_one;
            result_ten  <= sub_cor_pm_ten;
         elsif ( unsigned(op1_ten) < unsigned(op2_ten) ) then        -- op2 > op1 -> op2 - op1
            sign_result <= sign_op2;
            c_out       <= c_sub_cor_mp_ten;
            result_one  <= sub_cor_mp_one;
            result_ten  <= sub_cor_mp_ten;
         elsif ( op1_ten = op2_ten ) then                            -- if op1 = XY, op2 = XZ, tens equal
            if ( (unsigned(op1_one) > unsigned(op2_one)) ) then      -- op1 > op2 -> op1 - op2
               sign_result <= sign_op1;
               c_out       <= c_sub_cor_pm_ten;
               result_one  <= sub_cor_pm_one;
               result_ten  <= sub_cor_pm_ten;
            elsif ( unsigned(op1_one) < unsigned(op2_one) ) then     -- op2 > op1 -> op2 - op1
               sign_result <= sign_op2;
               c_out       <= c_sub_cor_mp_ten;
               result_one  <= sub_cor_mp_one;
               result_ten  <= sub_cor_mp_ten;
            end if;
         end if;
      end if;
   end process;

end behave;
