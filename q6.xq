<histogram>
{
let $all_skills := fn:distinct-values(
	for $skill in fn:doc("posting.xml")//reqSkill
	return $skill/@what)
let $resume_doc := fn:doc("resume.xml")

for $skill in $all_skills
return <skill name = "{$skill}">
	{
	for $i in 1 to 5
	return <count level = "{$i}" n = "{count($resume_doc//skill[@what=$skill and @level=$i])}"/> 
	}
	</skill>
}
</histogram>
