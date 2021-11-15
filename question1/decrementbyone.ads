pragma SPARK_Mode;

package DecrementByOne is

   type Digit is new Integer range 0..9;

   type DigitRecord is
   record
         digit1 : Digit;
         digit2 : Digit;
         digit3 : Digit;
   end record;


   procedure subtractOne (numOne : in Digit;
                          numTwo : in Digit;
                          numThree : in Digit;
                          res1 : out Digit;
                          res2 : out Digit;
                          res3 : out Digit); --Old subtract procedure kept as backup

   procedure subtractOneNew (numRecord : in DigitRecord; outRecord : out DigitRecord) with
        Depends => (outRecord => numRecord),
        Post => ( if Integer(numRecord.digit1)*100 + Integer(numRecord.digit2)*10 + Integer(numRecord.digit3) > 0
                    then
                      Integer(outRecord.digit1)*100 + Integer(outRecord.digit2)*10 + Integer(outRecord.digit3) =
                       Integer(numRecord.digit1)*100 + Integer(numRecord.digit2)*10 + Integer(numRecord.digit3) - 1
                    else
                   Integer(outRecord.digit1)*100 + Integer(outRecord.digit2)*10 + Integer(outRecord.digit3) = 999);

   function subtractOneNewFunc (numRecord : DigitRecord) return DigitRecord;
end DecrementByOne;

