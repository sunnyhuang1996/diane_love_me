<report>
{
		
        for $resume in fn:doc("resume.xml")//resume,
            $posting in fn:doc("posting.xml")//posting
        let $gain_pt := sum($resume//skill/@importance)
        let $deduct_pt := sum($resume//skill/@importance)
        where $resume//@what = $posting//@what
        return <match>{$gain_pt - $deduct_pt}</match>
}
</report>
