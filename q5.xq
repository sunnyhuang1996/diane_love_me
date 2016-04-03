let $resume_doc := fn:doc("resume.xml")
let $resume_count := count($resume_doc//resume)

return <rareskills numresumes="{$resume_count}">
{
for $posting in fn:doc("posting.xml")
let $req_skill := $posting//reqSkill/@what 
let $half_resume := $resume_count div 2
where count($resume_doc//skill[@what = $req_skill and @level>"3"]) < $half_resume
return <posting pID="{$req_skill/ancestor::posting/@pID}" skill="{$req_skill}"
                numwith="{count($resume_doc//skill[@what = $req_skill])}"
                numhigh="{count($resume_doc//skill[@what = $req_skill and @level >"3"])}"/>
}
</rareskills>

