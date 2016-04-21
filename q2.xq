<collegiality>
{
let $forgot_interviewer := fn:distinct-values(
for $assessment in fn:doc("interview.xml")//assessment[not(/collegiality)]
return $assessment/ancestor::interview/@sID)

for $interviewer_sID in $forgot_interviewer
return <forgot sID = "{$interviewer_sID}"/>
}
</collegiality>
