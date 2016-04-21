<missingskills>
{
let $problem_posting := fn:distinct-values(
for $required_skill in fn:doc("posting.xml")//reqSkill
let $resume_skill := fn:doc("resume.xml")//skill[@what = $required_skill/@what]
where every $level in $resume_skill/@level satisfies $level < $required_skill/@level
return $required_skill/ancestor::posting/@pID)

for $posting in fn:doc("posting.xml")//posting
where $posting/@pID = $problem_posting
return <problemposting pID = "{$posting/@pID}">
	{
	for $require_skill in $posting//reqSkill
	let $resume_skill := fn:doc("resume.xml")//skill[@what = $require_skill/@what]
	where every $level in $resume_skill/@level satisfies $level < $require_skill/@level
	return <skill what = "{$require_skill/@what}"/>
	}
	</problemposting>
}
</missingskills>
