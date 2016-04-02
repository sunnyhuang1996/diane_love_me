<priorities>
{
for $posting in fn:doc('posting.xml')//posting
	return <posting pID="{$posting/@pID}" >{
		for $skill in $posting//reqSkill
		where $skill/@importance =  max($posting//reqSkill/@importance)
		return <skill importance="{$skill/@importance}">{data($skill/@what)}</skill>
	}</posting>
	
}
</priorities>