2014/02/09
This is the git repository for my Kicad libraries.

The library files are kept in the right way to be used out of the box with Kicad.

There are 2 versions of the pcb libraries, the "legacy" ones and the new "pretty" ones. In order to use the "pretty" libraries you can simply
put the libraries in the base path (usually /usr/local/kicad/modules on linux, c:\program files\kicad\share\modules on windows) and place the
fp-lib-table in your home directory.
You should then have all the pcb libraries loaded by default as global libraries.

You can find more detailed informations about the libraries on the library web page:
http://www.smisioto.eu/elettronica/kicad

Walter Lain - kcswalter@tiscali.it

Note 1: the GIT repository is accessible either with "git clone git://smisioto.eu/kicad_libs.git" or at http://www.smisioto.eu/gitweb.cgi
Note 2: there is also an SVN repository with the compressed libraries, if you have bandwith problems. You can access it either with 
        "svn --username guest co svn://smisioto.eu/kicad_libs" or at http://www.smisioto.eu/kicad_libs/
