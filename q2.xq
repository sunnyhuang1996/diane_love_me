<collegiality>
{
for $assessment in fn:doc("interview.xml")//assessment
where not $assessment/collegiality
return <forgot sID = "{assessment/ancestor::interview/@sID}"/>
}
</collegiality>