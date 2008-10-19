Minifier - Plugin for minifying CSS and JavaScript

= Overview =

Minifier plugin provides mt:CSSMinifier and mt:JSMinifier block tags.

= Installation =

 * Download and extract Minifier-<version>.zip file.

 * Upload or copy the contents of "plugins" directory into your
   "plugins" directory.

 * After proper installation, you will find "Minifier" plugin listed
   on the "System Plugin Settings" screen.

= Tags =

== mt:CSSMinifier ==

A block tag which minifies a CSS template.

Example:

    <mt:CSSMinify>
    (contents of CSS template)
    </mt:CSSMinify>

== mt:JSMinifier ==

A block tag which minifies a JavaScript template.

Example:

    <mt:JSMinify>
    (contents of JavaScript template)
    </mt:JSMinify>

--
$Id$
