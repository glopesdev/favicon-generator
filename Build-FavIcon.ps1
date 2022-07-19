# Builds ICO files
# Dependencies (must be in current PATH): Inkscape 1.1+, ImageMagick
mkdir -Force build | Out-Null
ForEach ($icon in $args)
{
	$output = [System.IO.Path]::ChangeExtension($icon,".ico")
    &inkscape $icon --export-filename=build/16.png --export-dpi=2.40 --export-background-opacity=0 | Out-Default
	&inkscape $icon --export-filename=build/32.png --export-dpi=4.80 --export-background-opacity=0 | Out-Default
	&inkscape $icon --export-filename=build/48.png --export-dpi=7.20 --export-background-opacity=0 | Out-Default
	&inkscape $icon --export-filename=build/64.png --export-dpi=9.60 --export-background-opacity=0 | Out-Default
	&inkscape $icon --export-filename=build/256.png --export-dpi=38.40 --export-background-opacity=0 | Out-Default
	&magick build/16.png build/32.png build/48.png build/64.png build/256.png $output
	$output | Out-Default; ""
}
Remove-Item -Recurse -Force build