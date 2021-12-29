String file_data[];
int file_size;

PFont fontForText;

void setup()
{
 size(400, 300);
 
 file_data = loadStrings("example.txt");
 
 if (file_data == null)
 {
   println("WARNING: the file with the given name does not exist. please load another file)");
   
   } else {
     
       file_size = file_data.length;  
       println("there are " + file_size + " lines in this file: ");
       
       for (int i = 0; i < file_data.length; i++)
       {
         println(file_data[i]);
       }
     
     }  
 
 }
 
 
