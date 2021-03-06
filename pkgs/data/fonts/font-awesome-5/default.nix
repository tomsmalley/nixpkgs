{ stdenv, fetchzip }:

let
  version = "5.5.0";
in fetchzip rec {
  name = "font-awesome-${version}";

  url = "https://github.com/FortAwesome/Font-Awesome/archive/${version}.zip";

  postFetch = ''
    mkdir -p $out/share/fonts
    unzip -j $downloadedFile "Font-Awesome-${version}/use-on-desktop/Font Awesome 5 Brands-Regular-400.otf" -d $out/share/fonts/opentype
    unzip -j $downloadedFile "Font-Awesome-${version}/use-on-desktop/Font Awesome 5 Free-Regular-400.otf" -d $out/share/fonts/opentype
    unzip -j $downloadedFile "Font-Awesome-${version}/use-on-desktop/Font Awesome 5 Free-Solid-900.otf" -d $out/share/fonts/opentype
  '';

  sha256 = "1drjc40glfqhwmfn3s4gz8hz1x0ncrwdr9n1i25m1l7pvsk26f5f";

  meta = with stdenv.lib; {
    description = "Font Awesome - OTF font";
    longDescription = ''
      Font Awesome gives you scalable vector icons that can instantly be customized.
      This package includes only the OTF font. For full CSS etc. see the project website.
    '';
    homepage = http://fortawesome.github.io/Font-Awesome/;
    license = licenses.ofl;
    platforms = platforms.all;
    maintainers = with maintainers; [ abaldeau ];
  };
}
