pragma SPARK_Mode;

package Division is


   procedure divide (dividend, divisor : in Integer;
                     quotient, remainder : out Integer) with
     Depends => ((quotient, remainder) => (dividend, divisor)),
     Pre => (dividend in 0..Integer'Last and divisor in 1..Integer'Last),
     Post => ((dividend = quotient * divisor + remainder) and
                (remainder >= 0 and remainder < divisor));

end Division;
