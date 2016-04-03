<report>
	for $interview in fn:doc("interview.xml")//interview
	return <interview> 
			{
			for $resume in fn:doc("resume.xml")//resume
			where $resume/@rID = $interview/@rID
			return <who rID="{$interview/@rID}"
						forename="{$resume//forename}"
						surname="{$resume//surname}"/>
			}
			{
			let $degree_of_match := 0
			for $posting in fn:doc("posting.xml")//posting
			where $posting/@pID = $interview/@pID
			return $posting//postion, {
					for $skill in $posting//skill
					if $resume//skill[@what=$skill/@what] and 
					   $resume//skill[@what=$skill/@what]/@level >= $skill/@level
					then $degree_of_match = $degree_of_match + $skill/@importance
					else $degree_of_match = $degree_of_match - $skill/@importance		
					return <match>{$degree_of_match}</match>
			},
			<average>{avg($interview//assessment/*)}</average>
			}
	</interview>
</report>