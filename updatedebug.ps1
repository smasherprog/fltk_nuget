param(
    [string]$path,
	[string]$runtimelib
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

foreach($node in  $xml.Project.ItemDefinitionGroup)
{
    if ($node.ClCompile -ne $null) {
        if ($node.ClCompile.RuntimeLibrary -ne $null) {
            $node.ClCompile.RuntimeLibrary = $runtimelib
        } else {
            $newnode = $node.ClCompile.AppendChild($xml.CreateElement($runtimelib,$xml.DocumentElement.NamespaceURI))
            $newnode.AppendChild($xml.CreateTextNode($runtimelib))
        }
    }
}
$xml.Save($path)