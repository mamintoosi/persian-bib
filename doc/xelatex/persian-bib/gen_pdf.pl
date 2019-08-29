##########################################################
#  Author:      Mahmood Amintoosi           		     #
#  Date:        10 Feb 2011         		             #
#  Version:     .10         		                     # 
#  Application: Produce pdf files of Persian-bib styles  #
##########################################################

use File::Copy;

open(INFILE,"bibtex-example.tex");

@styleList = ("acm-fa","plain-fa","unsrt-fa","ieeetr-fa","asa-fa","chicago-fa","plainnat-fa");
@natbibStyles = ("asa-fa","chicago-fa","plainnat-fa");	

@lines = <INFILE>;
foreach $style (@styleList)
{
	$fileName = $style.".pdf";
	$tmpFile = "tmp";
	open(OUTFILE,">".$tmpFile.".tex");
	print $fileName;
	foreach $line(@lines)
	{
		
		$a = $line;
		#Checking wether natbib package is required or not
		$natbibRequired = 0;
		foreach $natbibStyle(@natbibStyles)
		{
			if($style eq $natbibStyle)
			{ 
				$natbibRequired = 1;
				#last;
			}
		}
#		print $natbibRequired;
		if ($natbibRequired==1 && $a =~ /usepackage{xepersian}/)
		{
			print OUTFILE "\\usepackage{natbib}\n";
		}
		$a =~ s/acm-fa/$style/;
		print OUTFILE $a;
	}
	
	close (OUTFILE);
	system("xelatex",$tmpFile);
	system("bibtex8","-W","-c","cp1256fa",$tmpFile);
	system("xelatex",$tmpFile);
	system("xelatex",$tmpFile);
	copy($tmpFile.".pdf",$fileName) or die "Copy failed: $!";
	unlink <tmp.*>;
	#seek(INFILE,0,SEEK_SET);
 }
 close (INFILE);
 
