let $resume_doc := fn:doc("resume.xml")
let $resume_count := count($resume_doc//resume)

<rareskills numresumes="$resume_count">
{
for $req_skill in fn:doc("posting.xml")//reqSkill/@what
where count($resume_doc//skill/[@what = $req_skill and @level >3]) < ($resume_count / 2)
return <posting pID="{$req_skill/ancestor::posting/@pID}" skill="{$req_skill}"
		numwith="{count($resume_doc//skill/[@what = $req_skill]}" 
		numhigh="{count($resume_doc//skill/[@what = $req_skill and @level >3])}">

}
</rareskills>