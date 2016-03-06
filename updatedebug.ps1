param(
    [string]$path ='C:\Users\scott\Documents\GitHub\fltk_nuget\fltk-src-32-VS2013\src\fltk_forms.vcxproj'
)

$xml = [xml](Get-Content $path)
foreach($node in  $xml.Project.ItemDefinitionGroup | where {$_.Condition -like '*debug*'})
{
    if ($node.ClCompile -ne $null) {
        if ($node.ClCompile.ProgramDataBaseFileName -ne $null) {
            $node.ClCompile.ProgramDataBaseFileName = '$(OutDir)$(ProjectName).pdb'
        } else {
            $newnode = $node.ClCompile.AppendChild($xml.CreateElement('ProgramDataBaseFileName',$xml.DocumentElement.NamespaceURI))
            $newnode.AppendChild($xml.CreateTextNode('$(OutDir)$(ProjectName).pdb'))
        }
    }
}
foreach($node in  $xml.Project.PropertyGroup)
{
    foreach($subnode in  $node.TargetName)
    {
        $subnode.InnerXml = '$(ProjectName)'                  
    }
   
}
$xml.Save($path)