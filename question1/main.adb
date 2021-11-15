pragma SPARK_Mode;
with DecrementByOne, AS_Io_Wrapper;
use  DecrementByOne, AS_Io_Wrapper;

procedure Main is
     numRecord : DigitRecord;
     functionRecord : DigitRecord;
     outputRecord : DigitRecord;
     userInput : String(1..20);
     userInputInt : Integer;
     last : Integer;

begin
     loop
        loop
           AS_Put("Pick 1st number: ");
           AS_Get(userInputInt, "Please type in an Integer; Try again");
           exit when userInputInt in 0..9;
        end loop;
        numRecord.digit1 := Digit(userInputInt);
        loop
           AS_Put("Pick 2nd number: ");
           AS_Get(userInputInt, "Please type in an Integer; Try again");
           exit when userInputInt in 0..9;
        end loop;
        numRecord.digit2 := Digit(userInputInt);
        loop
           AS_Put("Pick 3rd number: ");
           AS_Get(userInputInt, "Please type in an Integer; Try again");
           exit when userInputInt in 0..9;
        end loop;
        numRecord.digit3 := Digit(userInputInt);

        AS_Put_Line;

        --subtractOne(numOne, numTwo, numThree, res1, res2, res3); digit procedure

        --subtractOneNew(numRecord, res1, res2, res3); -- old record procedure
        subtractOneNew(numRecord, outputRecord);

        functionRecord := subtractOneNewFunc(numRecord); -- record function

        AS_Put("And the result of the function is: ");

        AS_Put(Integer(functionRecord.digit1));
        AS_Put(Integer(functionRecord.digit2));
        AS_Put(Integer(functionRecord.digit3));

        AS_Put_Line;

        AS_Put("The result of the procedure is: ");

        AS_Put(Integer(outputRecord.digit1));
        AS_Put(Integer(outputRecord.digit2));
        AS_Put(Integer(outputRecord.digit3));
        AS_Put_Line;

         loop
            AS_Put("Do you want to try again? y/n ");
            AS_Get_Line(userInput, last);
         exit when last > 0;
         end loop;
        exit when userInput(1..1) = "n";
        end loop;

end Main;
