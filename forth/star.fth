( large letter f )
: star   42 emit ;
: margin   cr 30 spaces ;
: blip   margin star  ;
: stars   0 do star loop ;
: bar   margin 5 stars ;
: F   bar blip bar blip blip cr ;
