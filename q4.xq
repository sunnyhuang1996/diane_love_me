<missingskills>
{
let $missing_skill :=
for $required_skill in fn:doc("posting.xml")//reqSkill
let $resume_skill := fn:doc("resume.doc")//skill[@what = $required_skill/@what]
where every $level in $resume_skill/@level satisfies $level < $required_skill/@level
return $required_skill

for $posting in fn:doc("posting.xml")//posting
where $posting//reqSkill = $missing_skill
return <problemposting pID = "{$posting/@pID}">
	{
	for $require_skill in $posting//reqSkill
	where $require_skill = $missing_skill
	return <skill what = "$require_skill/@what">
	}
	</problemposting>
}
</missingskills>