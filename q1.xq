<skilled>	
{
for $resume in fn:doc("resume.xml")//skills[count(skill) >= 3]/ancestor::resume
return <candidate rid="{$resume/@rID}" numskills="{count($resume//skill)}"> 
	       <name>{data($resume//forename)}</name>
	   </candidate>
}
</skilled>