set theChain to "cd ~"
set a to do shell script "cd ~;ls"
set what to ":Applications:Utilities:Terminal.app:Contents:Resources:Terminal.icns"

repeat
	
	set theNumber to ""
	set dd to display dialog a buttons {"Cancel", "Queue", "Run"} default button 3 default answer theNumber with icon alias what with title (do shell script "(" & theChain & "; pwd) | tail -1")
	set theNumber to text returned of dd
	
	try
		set a to do shell script theChain & "; " & theNumber
		
		if "cd" is in theNumber then
			set theChain to theChain & "; " & theNumber
			set a to do shell script theChain & ";ls"
		end if
		
		if button returned of dd is "Queue" then
			set theChain to theChain & "; " & theNumber
			set a to do shell script theChain
		end if
		
	on error errMsg
		set a to "" & errMsg
	end try
	
end repeat

