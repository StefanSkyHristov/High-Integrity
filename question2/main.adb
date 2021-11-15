pragma SPARK_Mode;

with Division, AS_Io_Wrapper;
use  Division, AS_Io_Wrapper;

procedure Main is
     userInput : String(1..20);
     userInputInt : Integer;
     last : Integer;

     dividend : Integer;
     divisor : Integer;
     quotient, remainder : Integer;
begin

   loop

      loop

         AS_Put("Enter dividend: ");
         AS_Get(userInputInt);

         exit when userInputInt in 0..Integer'Last;

      end loop;
      dividend := userInputInt;

      loop

         AS_Put("Enter divisor: ");
         AS_Get(userInputInt);

         exit when userInputInt in 1..Integer'Last;

      end loop;
      divisor := userInputInt;

      AS_Put_Line;

      AS_Put("Result is: ");
      divide(dividend, divisor, quotient, remainder);


      AS_Put(quotient);
      AS_Put(remainder);

      AS_Put_Line;

      loop

         AS_Put("Do you want to try again? y/n: ");
         AS_Get_Line(userInput, last);
         exit when last > 0;
      end loop;
      exit when userInput(1..1) = "n";
   end loop;

end Main;
