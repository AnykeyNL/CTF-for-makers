// IMPORTANT; Required openScad 2019.5!!!!
// https://www.openscad.org/downloads.html

// ETH0 - CTF - 2020
// Puzzle created by Anykey & Espardemee


// complete the variables and render :-)

// ALL ANSWERS in lower case!
eth0_2019_location = "xxxxx"; 
fusion360_maker = "xxxxx";
dutch_3d_printer_manufacturer = "xxxxx";
CPU_chip_model_raspberryPi4 = "xxxxx";
Arduino_language_based_on = "xxxxx";
Ladyada_last_name = "xxxxx";

// Show the FLAG
stringtovalue(1, eth0_2019_location, 1897);
stringtovalue(2, fusion360_maker, -295);
stringtovalue(3, dutch_3d_printer_manufacturer, -511);
stringtovalue(4, CPU_chip_model_raspberryPi4, -446);
stringtovalue(5, Arduino_language_based_on, -593);
stringtovalue(6, Ladyada_last_name, -201);

$fn=10;
segments = [ 
  [ 0,200, 100,200],
  [ 100,100, 100,200],
  [ 100,0, 100,100],
  [ 0,0, 100,0],
  [ 0,0 , 0,100],
  [ 0,100,0,200],
  [ 50,200,50,100],
  [ 50, 100, 100,100],
  [ 50,0, 50, 100],
  [ 0,100, 50,100],
  [ 50,100, 100,200],
  [ 50,100, 100,0],
  [ 50,100, 0,0],
  [ 50,100, 0, 200]
  ];
  

module toBin(number){
    for (b =[14:-1:0]) {
     bit = floor(number / pow(2, b)) % 2;
     if (bit == 1) {
         hull(){
        translate([segments[b][0], segments[b][1]])
          cylinder (r=10, h = 25);
        translate([segments[b][2], segments[b][3]])
          cylinder (r=10, h = 25);
         }
     }
    }
}

function sum(list, idx = 0, result = 0) = idx >= len(list) ? result : sum(list, idx + 1, result + list[idx]);

module  stringtovalue(p, answer, special) {
 v = [for (c = answer) ord(c)];
 echo(sum(v));
 translate( [(p*130)-130,0,0])
    toBin(sum(v) + special);
    
}





    

