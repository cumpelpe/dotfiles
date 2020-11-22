<!-- this is text/markdown -->
<meta charset=utf8>
<style>
:root {
    --background: #272822; 
    --foreground: #F8F8F2; 
    --comment: #75715E; 
    --red: #F92672; 
    --orange: #FD971F;
    --orange: #E69F66; 
    --yellow: #E6DB74; 
    --green: #A6E22E; 
    --blue: #66D9EF; 
    --purple: #AE81FF; 
}
body{
    overflow-y:scroll;
    background-color: var(--background);
    color: var(--foreground);
}
a{
    color:var(--blue); 
    margin:1px; 
    padding:.35em; 
    text-decoration:none; 
    display:inline-block;
    position: relative;
}
a:hover{
}
a::after {
    content: '';
    transition: .5s all;
    position: absolute;
    width: 100%;
    height: 100%;
    left:   0;
    top:    0;
    /*bottom: 0;*/
    border-left: 1px solid var(--blue);
    border-top: 1px solid var(--green);
}
a::before {
    content: '';
    transition: .5s all;
    height: 100%;
    position: absolute;
    width:  0%;
    height: 0%;
    left:   0;
    top:    0;
    /*bottom: 0;*/
    border-right: 1px solid var(--green);
    border-bottom: 1px solid var(--blue);
}
a:hover::after {
    content: '';
    position: absolute;
    right:  0;
    bottom: 0;
    width:  0;
    height: 0;
}
a:hover::before {
    content: '';
    position: absolute;
    left:   0;
    right:  0;
    top:    0;
    bottom: 0;
    width: 100%;
    height: 100%;
}
img{
    height:1em; 
    width:1em; 
    margin:-.1em;
}
code{
    color: var(--red);
}
strong > code{
    font-size:1.4em;
}
strong {
    color: var(--orange);
}
</style>

## Specific Keys:
- **`e`** : Edit this page
- **`E`** : Edit main config file
- **`c`** : Open config directory
- **`m`** : Show this page
- **`M`** : Show **[history](wyeb:history)**
- **`b`** : Add title and URI of a page opened to this page

If **e,E,c** don't work, edit values '`mimeopen -n %s`' of ~/.config/wyeb./main.conf<br>
or change mimeopen's database by running '<code>mimeopen <i>file/directory</i></code>' in terminals.

For other keys, see **[help](wyeb:help)** assigned '**`:`**'.
Since wyeb is inspired by **[dwb](https://wiki.archlinux.org/index.php/dwb)**
and luakit, usage is similar to them.

---
<!--
wyeb:i/iconname returns an icon image of current icon theme of gtk.
wyeb:f/uri returns a favicon of the uri loaded before.
wyeb:F converted to the wyeb:f with a parent tag's href.
-->
[![](wyeb:i/wyeb) wyeb](https://github.com/jun7/wyeb)
[Wiki](https://github.com/jun7/wyeb/wiki)
[![](wyeb:F) Adblock](https://github.com/jun7/wyebadblock)
[![](https://www.archlinux.org/static/logos/legacy/arch-legacy-aqua.5d03b6ac5b5b.svg)Arch Linux](https://www.archlinux.org/)

<!--
(wyeb:f/https://www.archlinux.org/) 
-->
<script>
</script>
