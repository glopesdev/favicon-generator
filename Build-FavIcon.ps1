# Builds ICO files
# Dependencies (must be in current PATH): Inkscape 1.1+, ImageMagick
mkdir -Force build | Out-Null
ForEach ($icon in $args)
{
	$output = [System.IO.Path]::ChangeExtension($icon,".ico")
	if ($icon -like "*.svg")
	{
		&inkscape $icon --export-filename=build/16.png --export-width=16 --export-background-opacity=0 | Out-Default
		&inkscape $icon --export-filename=build/32.png --export-width=32 --export-background-opacity=0 | Out-Default
		&inkscape $icon --export-filename=build/48.png --export-width=48 --export-background-opacity=0 | Out-Default
		&inkscape $icon --export-filename=build/64.png --export-width=64 --export-background-opacity=0 | Out-Default
		&inkscape $icon --export-filename=build/256.png --export-width=256 --export-background-opacity=0 | Out-Default
	}
	else
	{
		&magick $icon -resize 16x16 build/16.png | Out-Default
		&magick $icon -resize 32x32 build/32.png | Out-Default
		&magick $icon -resize 48x48 build/48.png | Out-Default
		&magick $icon -resize 64x64 build/64.png | Out-Default
		&magick $icon -resize 256x256 build/256.png | Out-Default
	}
	&magick build/16.png build/32.png build/48.png build/64.png build/256.png $output
	$output | Out-Default; ""
}
Remove-Item -Recurse -Force build