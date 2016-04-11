#takes floating-point 24 hour schedule, and turns to AM/PM
#This version is intended to handle "to 5 minute incremements", because that seemed right at the time
sub toTime
{
   my $t = $_[0];
   
   #all the tricky ones
   if($t < 0)
      {return "Error: negative number input.  Give a number 0-24";}
   elsif($t > 24)
      {return "Error: more than one day.  Give a number 0-24";}
   elsif($t == 0 || $t == 24)
      {return "midnight";}
   elsif($t == 12)
      {return "noon";}
   
   #real function
   my $AP = $h = $m = "";
   $AP = ($t<12)?"a.m.":"p.m";
   if(int($t)==0) {$h = "12";}
   else {$h = $t%12;}
   $m = 5*(decform($t*12, 0)%12);
   $m = ($m==0)?"00":$m;
return "$h:$m $AP";
}


#takes the normal of-the-clock time, and turns to floating-point 24h style
sub fromTime
{
   my @t = @_;
   if(lc($t[0]) eq "noon")
      {return 12;}
   if(lc($t[0]) eq "midnight")
      {return 0;}
   
   if(scalar(@t)==1)#it's like 5:30 p.m.
      {return ("I'll write this one when I have to");}
   
   if(scalar(@t)==3) #It's like "5, 30, pm"
   {
      my @forms = qw(a p am pm a.m. p.m.);
      my ($h, $m, $AP) = @_;
      #all the tricky ones
      if($h < 0 || $m < 0 || $h > 24 || $m > 60)
         {return "Error: hours = $h minutes = $m";}
      unless(lc($AP) ~~ @forms)
         {return "Error: am/pm = $AP";}
      
      #real function
      $t = $h + $m/60;
      if(index($AP, "p") != -1){$t += 12;}
      return decform($t, 2);
   }
   
   #if it gets this far, something has gone wrong
   return("error: please use a format like 5, 30, \"pm\"");
}

#gramatically correct "H hours and M minutes"
sub ansForm
{
   my $t = $_[0];
   my $h = int($t);
   my $m = decform(60*($t - int($t)),0);
   
   if ($m<0 || $h <0) {return "error: hours = $h minutes = $m";}
   elsif ($m == 0){return sing_plur($h, "hour");}
   elsif ($h == 0){return spell_number($m)." minutes";}
   else
   {
      my $words = sing_plur($h, "hour")." and ".sing_plur($m, "minute");
      return $words;
   }
}

#Yeah I can see using this on its own
sub sing_plur
{
   my $x = $_[0];
   my $word = $_[1];
   
   if($x != 1) {$word .= "s";}
   return spell_number($x)." $word";
}
