<histogram>
{
for $skill in fn:doc("posting.xml")//reqSkill
return <skill name = "{$skill/@what}">
}
</histogram>