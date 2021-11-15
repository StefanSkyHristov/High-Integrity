pragma SPARK_Mode;

package body Division is

   procedure divide
     (dividend, divisor : in Integer; quotient, remainder : out Integer)
   is

   begin

      quotient  := 0;
      remainder := dividend;

      loop
         exit when remainder < divisor;
         pragma Loop_Invariant
           (dividend = quotient * divisor + remainder and
              (remainder >= 0 and remainder >= divisor));

         remainder := remainder - divisor;
         quotient  := quotient + 1;

      end loop;

   end divide;

end Division;
