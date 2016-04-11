# sub get_names {
	# return  cubes(help) 		. "<br /><br />" .
			# cube_mult(help) 	. "<br /><br />" .
			# constructor(help) 	. "<br /><br />" .
			# add_ones(help) 		. "<br /><br />" .
			# add_tens(help) 		. "<br /><br />" .
			# add_hundreds(help) 		. "<br /><br />" .
# }

#sub cubes (INT cubes, STR color) puts together a list of cubes (1 to 999)
#ex: "cubes(75, "blue")
sub cubes
{

   if($_[0] eq "help")
  {return 'cubes(int n, int color)<br />
   Puts together 1-999 cubes, colored blue (positive) or red (negative).'};
  
   my $n = $_[0];
   my $col = $_[1];
   my $hun = $ten = $one = 0;
   
#check that $n>0 && $n==int($n), and color eq "red" || color eq "blue"
   if ($n != int($n) || $n <= 0)
   {return "Enter a positive integer number of cubes.";}
   if ($n > 999)
   {return "I didn't design this to handle more than 999 cubes.";}
   #if($col !~ "red" && $col !~ "blue")
   #{return "Please use either \"red\" or \"blue\" for the color.";}

   $one = $n%10;
   $ten = int($n/10)%10;
   $hun = int($n/100)%10;
   
   my @elem = ();
   if($hun)
     {push(@elem, add_hundreds($hun, $col));}
   if($ten)
      {push(@elem, add_tens($ten, $col));}
   if($one)
      {push(@elem, add_ones($one, $col));}
   
return constructor(@elem);
}

sub cube_mult
{
   my $n1 = $_[0];
   my $n2 = $_[1];
   my $col = $_[2];
   my $hun = $ten = $one = 0;
   
#check that $n>0 && $n==int($n), and color eq "red" || color eq "blue"
   if ($n1 != int($n1) || $n2 != int($n2))
   {return "Enter a positive integer number of cubes.";}
   if ($n2 > 9)
   {return "I didn't design this to handle more than 9 columns.";}
   #if($col !~ "red" && $col !~ "blue")
   #{return "Please use either \"red\" or \"blue\" for the color.";}
   
    my $Str = "";
    
    for(my $I=0; $I< $n1; $I++)
    {
      $Str = $Str."<img src='/devmath/$col-cube1.png' style='padding:3px'> "x$n2;
      $Str = $Str."<br />";
   }
   return substr($Str, 0, -7);
}

sub add_ones
{
my $ones = $_[0];
my $color = $_[1];
my $Str = "";

for(my $I=0; $I< $ones; $I++)
         {$Str = $Str."<img src='/devmath/$color-cube1.png' style='padding:3px'> ";}
         return substr($Str, 0, -1);
}

sub add_tens
{
my $tens = $_[0];
my $color = $_[1];
my $Str = "";
my @toRet = ();

if($tens > 5)
{
   $n = $tens-5;
   $Str = "<img src='/devmath/$color-cube".$n."x10.png' style='padding:3px'>";
   push @toRet, $Str;
   $Str = "<img src='/devmath/$color-cube5x10.png' style='padding:3px'>";
}
else
{
   $Str = "<img src='/devmath/$color-cube".$tens."x10.png' style='padding:3px'>";
   push @toRet, $Str;
}
   return (@toRet)
}

sub add_hundreds
{
my $huns = $_[0];
my $color = $_[1];
my $cell = "<img src='/devmath/$color-cube10x10.png' style='padding:3px'>";
my @toRet = ();

   for(my $I=0; $I< $huns; $I++)
   {
      push @toRet, $cell;
   }
   return @toRet;
}

sub constructor
{
  my @cells = @_;
  my $size = scalar(@cells);

   if($size==1)
      {return($cells[0]);}
   else
   { 
      my $table = "";
      foreach $cell (@cells)
      {
         $table .= " <span class='nobr'>$cell</span>  ";
      }

   return $table;
   }
}

#sub ones (INT cubes, STR color) puts together a list of cubes (1 to 9)
#ex: <eqn cubes(7, "blue")>
sub ones
{
   my $n = $_[0];
   my $col = $_[1];
      
#check that $n>0 && $n==int($n), and color eq "red" || color eq "blue"
   if ($n != int($n) || $n <= 0)
   {return "Enter a positive integer number of cubes.";}
   if ($n > 9)
   {return "You want to use the 'cubes' subroutine, not 'ones'";}
   #if($col ne "red" && $col ne "blue")
   #{return "Please use either \"red\" or \"blue\" for the color.";}

   my $Str = "";
   $Str = "<img src='/devmath/$col-cube1.png' style='padding:3px'> "x$n;
   return substr($Str, 0, -1);
}
