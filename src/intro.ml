open Lwt
open Cow
open Printf
open Slides

let rt = ">>" (* required to embed it in html p4 as cant put that token directly there *)
let dl = "$"
let pres = "background-color:#ddddff"
let activity = "background-color:#ffdddd"
let rest = "background-color:#ddffdd"

let slides = [
{
  styles=[];
  content= <:html<
    <h3>Your Tutorial Teachers Are...</h3>
    <ul>
     <li><b>Dr. Yaron Minsky</b>,<br />
       <div style="font-size: 80%">
       Head of Technology,<br />
       Jane Street<br />
       www: <a href="http://ocaml.janestreet.com/">http://ocaml.janestreet.com</a>&nbsp; &nbsp; twitter: <a href="http://twitter.com/yminsky">yminsky</a>
       </div>
     </li>

     <li>
       <b>Dr. Anil Madhavapeddy</b>,<br />
       <div style="font-size: 80%">
       Senior Research Fellow,<br />
       Computer Laboratory, University of Cambridge.<br />
       www: <a href="http://anil.recoil.org/">http://anil.recoil.org</a>&nbsp; &nbsp; twitter: <a href="http://twitter.com/avsm">avsm</a>
       </div>
     </li>

    </ul>
    <p>With thanks to OCamlPro for the OPAM package manager.</p>
  >>
};
{
  styles=[];
  content= <:html<
    <h3>Prior Knowledge</h3>
    <ul>
      <li>Basic programming, but not necessarily OCaml</li>
      <li>Day-to-day UNIX operation, preferably Linux or MacOS X.</li>
      <li>Version control (git)</li>
    </ul>
    <p>Local VM available: <tt>ssh -Y cufpXX@tutorial{1,2,3}.icfp</tt> (<i>pass:</i> cufp2012)</p>
    <h3>Software Required</h3>
    <ul>
     <li>A UNIX-like OS (Linux or MacOS X)</li>
     <li>OCaml 3.12.1 or OCaml 4.00.0.</li>
    </ul>
  >>
};
{ styles=[];
  content= <:html<
    <h3>Installation</h3>
    <p>For OCaml, use your package manager, or from source:</p>
<pre class="noprettyprint">
$str:dl$ cd ocaml-3.12.1
$str:dl$ make world opt opt.opt
$str:dl$ make install
$str:dl$ curl -OL https://github.com/OCamlPro/opam/tarball/0.6.0
$str:dl$ tar -zxvf 0.6.0
</pre>
    <p>On MacOS X, install <a href="http://github.com/mxcl/bootstrap">Bootstrap</a> and:</p>
<pre class="noprettyprint">
$str:dl$ brew install ocaml
$str:dl$ brew install rlwrap  # interactive line edit
$str:dl$ brew tap mirage/ocaml
$str:dl$ brew install opam
</pre>
>>
};
{ styles=[];
  content= <:html<
    <h3>OPAM: Installation</h3>
    <p>OPAM is a package manager for OCaml libraries.  To initialise it:</p>
<pre class="noprettyprint">
$str:dl$ opam init
$str:dl$ eval `opam config -env`
$str:dl$ opam install ssl lwt async core_extended
</pre>
    <p>You should now have an OCaml environment with Core/Async/Lwt. Next, create an <b>.ocamlinit</b> file:</p>
<pre class="noprettyprint">
$str:dl$ cat > ~/.ocamlinit 
#use "topfind"
#thread
#require "lwt";;
#require "core.top";;
#require "async";;
^D
$str:dl$ rlwrap ocaml -I $OCAML_TOPLEVEL_PATH
        OCaml version 4.00.0
</pre>
>>
};
{ styles=[];
  content= <:html<
    <h3>Utop</h3>
    <p>A more interactive toplevel is available via the <tt>utop</tt> utility.</p>
<pre class="noprettyprint">
$str:dl$ opam install utop
$str:dl$ utop
Welcome to utop version 1.2.1 (using OCaml version 4.00.0)
# #utop_help ;;
</pre>
    <p><tt>utop</tt> features tab-completion for modules and functions, command history, and many key bindings.</p>
    <p>It also executes the Lwt thread loop automatically, by examining the function's return type!</p>

<pre class="noprettyprint">
utop $str:dl$ Lwt_unix.sleep 2.0;;
utop $str:dl$ open Lwt;;
utop $str:dl$ Lwt_unix.sleep 2.0 >|= fun () -> print_endline "foo";;
- : unit = () 
</pre>
>>
};
{ styles=[];
  content= <:html<
   <h3>Run This Tutorial</h3>
<p>The tutorial is itself written in OCaml, so build it using OPAM:</p>
<pre class="noprettyprint">
$str:dl$ opam install mirage-net mirage-fs ssl cohttp cow
$str:dl$ git clone http://github.com/avsm/ocaml-tutorial
$str:dl$ cd ocaml-tutorial
$str:dl$ make &amp;&amp; make run
</pre>
<p>There should now be an HTTP server running on local port 8080. If this port is
already used, change it in <code>src/server.ml</code> and recompile.</p>
  >>
};
]
