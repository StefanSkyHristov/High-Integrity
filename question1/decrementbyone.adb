pragma SPARK_Mode;

package body DecrementByOne is
--This is the old procedure before creating the one with Records
   procedure subtractOne (numOne, numTwo, numThree : in Digit;
                          res1, res2, res3 : out Digit) is
   begin
      if numThree > 0 then
         res1 := numOne;
         res2 := numTwo;
         res3 := numThree - 1;
      else
         if numTwo > 0 then
            res3 := 9;
            res2 := numTwo - 1;
            res1 := numOne;
         else
            if numOne > 0 then
               res1 := numOne - 1;
               res2 := 9;
               res3 := res2;
            else
               res1 := 9;
               res2 := res1;
               res3 := res2;
            end if;
         end if;
      end if;
   end subtractOne;

   function subtractOneNewFunc (numRecord : DigitRecord) return DigitRecord is
   begin
      if numRecord.digit3 > 0 then return DigitRecord'(digit1 => numRecord.digit1,
                                                       digit2 => numRecord.digit2,
                                                       digit3 => numRecord.digit3 - 1);
      else
         if numRecord.digit2 > 0 then return DigitRecord'(digit3 => 9,
                                                          digit2 => numRecord.digit2 - 1,
                                                          digit1 => numRecord.digit1);
         else
            if numRecord.digit1 > 0 then return DigitRecord'(digit1 => numRecord.digit1 - 1,
                                                             digit2 => 9,
                                                             digit3 => 9);
            else return DigitRecord'(digit1 => 9,
                                     digit2 => 9,
                                     digit3 => 9);
            end if;
         end if;
      end if;

end subtractOneNewFunc;

   --This is the same procedure as above but with Record types
   procedure subtractOneNew(numRecord : in DigitRecord; outRecord : out DigitRecord) is
      begin

      if numRecord.digit3 > 0 then
         outRecord.digit1 := numRecord.digit1;
         outRecord.digit2 := numRecord.digit2;
         outRecord.digit3 := numRecord.digit3 - 1;
      else
         if numRecord.digit2 > 0 then
            outRecord.digit3 := 9;
            outRecord.digit2 := numRecord.digit2 - 1;
            outRecord.digit1 := numRecord.digit1;
         else
            if numRecord.digit1 > 0 then
               outRecord.digit1 := numRecord.digit1 - 1;
               outRecord.digit2 := 9;
               outRecord.digit3 := 9;
            else
               outRecord.digit1 := 9;
               outRecord.digit2 := 9;
               outRecord.digit3 := 9;
            end if;
         end if;
      end if;

      end;

end DecrementByOne;
