<report>
{
	for $interview in fn:doc("interview.xml")//interview,
	    $resume in fn:doc("resume.xml")//resume,
	    $posting in fn:doc("posting.xml")//posting
	where $resume/@rID = $interview/@rID and
	      $posting/@pID = $interview/@pID
	return <interview> 
	           <who rID="{$interview/@rID}"
		   	forename="{$resume//forename}"
			surname="{$resume//surname}"/>
		   <position>{data($posting//position)}</position>
		   {
	
		   let $gain_pt := 
                                    for $own_skill in $resume//skill,
					$req_skill in $posting//reqSkill[@what = $own_skill/@what]
				    where $own_skill/@level >= $req_skill/@level
			            return $req_skill/@importance
                   let $lose_pt := $posting//reqSkill/@importance except $gain_pt
		   let $degree_of_match := sum($gain_pt) - sum($lose_pt)
		   return <match>{$degree_of_match}</match>               
		    }
		   <average>{avg($interview//assessment/*)}</average>
		</interview>
}
</report>
