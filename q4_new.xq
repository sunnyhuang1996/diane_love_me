<missingskills>
{

for $posting in fn:doc("posting.xml")//posting
let $problem_skill := 
	for $required_skill in $posting//reqSkill
	let $resume_skill := fn:doc("resume.xml")//skill[@what = $required_skill/@what]
	where every $level in $resume_skill/@level satisfies $level < $required_skill/@level
	return <skill what="{$required_skill/@what}"/>
where not(empty($problem_skill))
return <problemposting pID = "{$posting/@pID}">
       {$problem_skill}
        </problemposting>
}
</missingskills>
