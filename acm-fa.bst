%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Bib. style "acm-fa", Persian (farsi)  version of acm.bst
%%
%% by: Mahmood Amintoosi and Mostafa Vahedi, m.amintoosi@gmail.com
%% For XePersian, a Persian Typesetting Package in XeTeX
%% It may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License (version 1.3c), 
%% either this version of this license or (at your option) any later version.
%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 
%% Original Copyright of acm.bst


ENTRY
  { address
    author
    booktitle
    chapter
    edition
    editor
    howpublished
    institution
    journal
    key
    language
    month
    note
    number
    organization
    pages
    publisher
    school
    series
    title
    translator
    type
    volume
    year
  }
  {}
  { label }

INTEGERS { output.state before.all mid.sentence after.sentence after.block }
FUNCTION {is.print.banners.to.terminal} { #1 }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FILE VERSION AND BANNER %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION{bst.file.version} { "0.91" }
FUNCTION{bst.file.date} { "2016/10/13" }
FUNCTION{bst.file.website} { "http://www.parsilatex.com" }
FUNCTION{bst.file.authors} {"M.Amintoosi and M.Vahedi" }

FUNCTION {banner.message}
{ is.print.banners.to.terminal
     { "-- acm-fa.bst version" " " * bst.file.version *
       " (" * bst.file.date * ") " * %"by " * bst.file.authors *
       top$
       "-- This is a BibTeX style for XePersian: " bst.file.website *
       %top$
       %"-- See the " quote$ * "Persian-bib-userguide.pdf" * quote$ * " manual for usage information." *
       top$
     }
     { skip$ }
   if$
}

FUNCTION {completed.message}
{ is.print.banners.to.terminal
     { ""
       top$
       "Done."
       top$
     }
     { skip$ }
   if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Persian Functions    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


FUNCTION {fa.isPersianLanguage}
{
  language missing$
    {#0}
    {language "l" change.case$ "persian" =}
  if$
}

 % Here are the language-specific definitions for explicit words.
 % Each function has a name bbl.xxx where xxx is the English word.
 % The languages selected here is ENGLISH and Farsi
FUNCTION {bbl.and}
{ 
  fa.isPersianLanguage
    {" و "}
    {" and "}
  if$
}

FUNCTION {bbl.editors}
{ 
fa.isPersianLanguage
  { " ویراستاران "}
  {" eds. "}
if$
}

FUNCTION {bbl.editor}
{ 
fa.isPersianLanguage
  {  " ویراستار "}
  {" ed. " }
if$
}

FUNCTION {bbl.edby}
{
fa.isPersianLanguage
  {  " ویراسته‌ی "}
  { " edited by " }
if$
}

FUNCTION {bbl.edition}
{
fa.isPersianLanguage
  {" ویرایش "}
  {"~ed." }
if$
}

FUNCTION {bbl.volume}
{
fa.isPersianLanguage
  {" جلد "}
  { "Vol.~"}
if$
}

FUNCTION {bbl.of}
{
fa.isPersianLanguage
  { " از "}
  { " of " }
if$
}

FUNCTION {bbl.number}
{
fa.isPersianLanguage
  {" شماره " }
  { " no." }
if$
}

FUNCTION {bbl.nr}
{
fa.isPersianLanguage
  {" شماره "}
  { " no." }
if$
}

FUNCTION {bbl.in}
{
fa.isPersianLanguage
  {" در "}
  { " in " }
if$
}

FUNCTION {bbl.pages}
{
fa.isPersianLanguage
  {" صفحات "}
  { "pp.~" }
if$
}

FUNCTION {bbl.page}
{
fa.isPersianLanguage
  {" ص." }
  { "p.~" }
if$
}

FUNCTION {bbl.chapter}
{
fa.isPersianLanguage
  { " فصل " }
  {"ch.~" }
if$
}

FUNCTION {bbl.techrep}
{
fa.isPersianLanguage
  { " گزارش طرح تحقیقی"}
  { " Tech. Rep." }
if$
}

FUNCTION {bbl.mthesis}
{
fa.isPersianLanguage
  {" پایان‌نامه کارشناسی‌ارشد"}
  { " Master's thesis" }
if$
}

FUNCTION {bbl.phdthesis}
{
fa.isPersianLanguage
  {" پایان‌نامه دکترا" }
  { " Ph.D. thesis" }
if$
}

FUNCTION {bbl.etal}
{ 
  fa.isPersianLanguage
    {" و دیگران"}
    {" et~al."}
  if$
}

FUNCTION {bbl.translator}
{ 
  fa.isPersianLanguage
    {"ترجمه‌ی "}
    {"Translator "}
  if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% End of Persian Functions %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
}

STRINGS { s t }

FUNCTION {output.nonnull}
{ 's :=
  output.state mid.sentence =
    { ", " * write$ }
    { output.state after.block =
{ add.period$ write$
  newline$
  "\newblock " write$
}
{ output.state before.all =
    'write$
    { add.period$ " " * write$ }
  if$
}
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}

FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull
  if$
}

FUNCTION {output.bibitem}
{
  newline$
  fa.isPersianLanguage
    { skip$ }
    {
     "\begin{LTRbibitems}" write$
      newline$ 
     "\resetlatinfont " write$  
    }
  if$
  newline$
  "\bibitem{" write$
  cite$ write$
  "}" write$
  newline$
  ""
  before.all 'output.state :=
}

FUNCTION {fin.entry}
{ add.period$
  write$
  newline$
  fa.isPersianLanguage
    {skip$}
    { newline$
      "\end{LTRbibitems}" write$
      newline$
    }
  if$
}

FUNCTION {new.block}
{ output.state before.all =
    'skip$
    { after.block 'output.state := }
  if$
}

FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
'skip$
{ after.sentence 'output.state := }
      if$
    }
  if$
}

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}

FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}

FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}

FUNCTION {new.block.checka}
{ empty$
    'skip$
    'new.block
  if$
}

FUNCTION {new.block.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.block
  if$
}

FUNCTION {new.sentence.checka}
{ empty$
    'skip$
    'new.sentence
  if$
}

FUNCTION {new.sentence.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.sentence
  if$
}

FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}

FUNCTION {emphasize}
{ duplicate$ empty$
    { pop$ "" }
    { "{\em " swap$ * "}" * }
  if$
}

FUNCTION {emphasizeic}
{ duplicate$ empty$
    { pop$ "" }
    { "{\em " swap$ * "\/}" * }
  if$
}

FUNCTION {scapify}
{ duplicate$ empty$
    { pop$ "" }
    { "\textsc{" swap$ * "}" * }
  if$
}

INTEGERS { nameptr namesleft numnames }

FUNCTION {format.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    {fa.isPersianLanguage
        { s nameptr "{vv~}{ll}{, jj}{, ff}" format.name$ 't :=}
        { s nameptr "{vv~}{ll}{, jj}{, f.}" format.name$ 't :=}
      if$
     nameptr #1 >
{ namesleft #1 >
    { ", " * t * }
    { t "others" =
{ ","  bbl.etal * * }
{ ","  bbl.and  * * t * }
      if$
    }
  if$
}
't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {format.innames}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    {fa.isPersianLanguage
        {s nameptr "{ff}{vv~}{ll}{, jj}" format.name$ 't :=}
        {s nameptr "{f.~}{vv~}{ll}{, jj}" format.name$ 't :=}
      if$
       nameptr #1 >
{ namesleft #1 >
    { ", " * t * }
    { numnames #2 >
{ "," * }
'skip$
      if$
      t "others" =
{ bbl.etal * }
{ bbl.and * t * }
      if$
    }
  if$
}
't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {format.authors}
{ author empty$
    { "" }
    { author format.names  scapify}
  if$
}

FUNCTION {format.editors}
{ editor empty$
    { "" }
    { fa.isPersianLanguage
    {
editor num.names$ #1 >
{bbl.editors editor format.names * }
{bbl.editor editor format.names * }
if$
}
{
  editor format.names scapify
editor num.names$ #1 >
{ ", " bbl.editors * *}
{ ", " bbl.editor * *}
if$
}
  if$
    }
  if$
}

FUNCTION {format.ineditors}
{ editor empty$
    { "" }
    { editor format.innames
      editor num.names$ #1 >
{ ", " * bbl.editors *}
{ ", " * bbl.editor *}
      if$
    }
  if$
}

FUNCTION {format.translators}
{ translator empty$
    { "" }
    { fa.isPersianLanguage
    {
bbl.translator translator format.names *
}
{
  translator format.names
", " bbl.translator * *
}
  if$
    }
  if$
}

FUNCTION {format.title}
{ title empty$
    { "" }
    { title "t" change.case$ }
  if$
}

FUNCTION {n.dashify}
{ 't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "-" =
{ t #1 #2 substring$ "--" = not
    { "--" *
      t #2 global.max$ substring$ 't :=
    }
    {   { t #1 #1 substring$ "-" = }
{ "-" *
  t #2 global.max$ substring$ 't :=
}
      while$
    }
  if$
}
{ t #1 #1 substring$ *
  t #2 global.max$ substring$ 't :=
}
      if$
    }
  while$
}

FUNCTION {format.date}
{ year empty$
    { month empty$
{ "" }
{ "there's a month but no year in " cite$ * warning$
  month
}
      if$
    }
    { month empty$
'year
{ month " " * year * }
      if$
    }
  if$
}

FUNCTION {format.btitle}
{ title emphasize
}

FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$ * *
}

FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}

FUNCTION {format.bvolume}
{ volume empty$
    { "" }
    { "volume" volume tie.or.space.connect
      series empty$
'skip$
{ " of " * series emphasize * }
      if$
      "volume and number" number either.or.check
    }
  if$
}

FUNCTION {format.number.series}
{ volume empty$
    { number empty$
{ series field.or.null }
{ output.state mid.sentence =
    { bbl.number }
    { bbl.number "t" change.case$ }
  if$
  number tie.or.space.connect
  series empty$
    { "there's a number but no series in " cite$ * warning$ }
    { bbl.in * series * }
  if$
}
      if$
    }
    { "" }
  if$
}

FUNCTION {format.edition}
{ edition empty$
    { "" }
    { fa.isPersianLanguage
    {
   bbl.edition edition *
}
{
      output.state mid.sentence =
       { edition "l" change.case$ bbl.edition * }
       { edition "t" change.case$ bbl.edition * }
          if$
}
  if$
    }
  if$
}

FUNCTION {format.pages}
{ pages empty$
    { "" }
    { pages n.dashify }
  if$
}

INTEGERS { multiresult }

FUNCTION {multi.page.check}
{ 't :=
  #0 'multiresult :=
    { multiresult not
      t empty$ not
      and
    }
    { t #1 #1 substring$
      duplicate$ "-" =
      swap$ duplicate$ "," =
      swap$ "+" =
      or or
{ #1 'multiresult := }
{ t #2 global.max$ substring$ 't := }
      if$
    }
  while$
  multiresult
}

FUNCTION {format.pp.pages}
{ pages empty$
    { "" }
    { pages multi.page.check
   { bbl.pages pages n.dashify tie.or.space.connect }
   { bbl.page pages tie.or.space.connect }
      if$
    }
  if$
}

FUNCTION {format.journal.vol.num.date}
{ journal empty$
    { "empty journal in " cite$ * warning$
      ""
    }
    { journal
      volume empty$
'skip$
{ " " * volume * }
      if$
      number empty$
'emphasizeic
{ emphasize ", " * number * }
      if$
      year empty$
{ "empty year in " cite$ * warning$ }
{ " (" * format.date * ")" * }
      if$
    }
  if$
}

FUNCTION {format.chapter.pages}
{ chapter empty$
    'format.pp.pages
    { type empty$
{ bbl.chapter }
{ type "l" change.case$ }
      if$
      chapter tie.or.space.connect
      pages empty$
'skip$
{ ", " * format.pp.pages * }
      if$
    }
  if$
}

FUNCTION {format.in.ed.booktitle}
{
  booktitle empty$
    { "" }
    {bbl.in booktitle emphasize *
      editor empty$
'skip$
{ ", " * format.ineditors * }
      if$
    }
  if$
}

FUNCTION {format.proc.date}
{ duplicate$ empty$
    { pop$ "" }
    { year empty$
{ "empty year in " cite$ * warning$
  address empty$
    'emphasize
    { emphasizeic
      " (" * address * ")" *
    }
  if$
}
{ emphasizeic
  " (" *
  address empty$
    'skip$
    { address * ", " * }
  if$
  format.date *
  ")" *
}
      if$
    }
  if$
}

FUNCTION {format.in.proc.date}
{ booktitle empty$
    { "" }
    { bbl.in booktitle format.proc.date * }
  if$
}
FUNCTION {empty.misc.check}
{ author empty$ title empty$ howpublished empty$
  month empty$ year empty$ note empty$
  and and and and and
  key empty$ not and
    { "all relevant fields are empty in " cite$ * warning$ }
    'skip$
  if$
}

FUNCTION {format.thesis.type}
{ type empty$
    'skip$
    { pop$
      type "t" change.case$
    }
  if$
}

FUNCTION {format.tr.number}
{ type empty$
    { bbl.techrep }
    'type
  if$
  number empty$
    { "t" change.case$ }
    { number tie.or.space.connect }
  if$
}

FUNCTION {format.article.crossref}
{ key empty$
    { journal empty$
{ "need key or journal for " cite$ * " to crossref " * crossref *
  warning$
  ""
}
{ bbl.in "{\em "  * journal * "\/}" * }
      if$
    }
    { bbl.in key * }
  if$
  " \cite{" * crossref * "}" *
}

FUNCTION {format.crossref.editor}
{ editor #1 "{vv~}{ll}" format.name$
  editor num.names$ duplicate$  #2 >
    { pop$ bbl.etal * }
    { #2 < 'skip$
    { editor #2 "{ff }{vv }{ll}{ jj}" format.name$ "others" =
      { bbl.etal * }
      { bbl.and * editor #2 "{vv~}{ll}" format.name$ * }
    if$
    }
    if$
    }
  if$
}

FUNCTION {format.book.crossref}
{ volume empty$
    { "empty volume in " cite$ * "'s crossref of " * crossref * warning$
      bbl.in
    }
    { bbl.volume volume tie.or.space.connect
      bbl.of *
    }
  if$
  editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
{ series empty$
    { "need editor, key, or series for " cite$ * " to crossref " *
      crossref * warning$
      "" *
    }
    { "{\em " * series * "\/}" * }
  if$
}
{ key * }
      if$
    }
    { format.crossref.editor * }
  if$
  " \cite{" * crossref * "}" *
}

FUNCTION {format.incoll.inproc.crossref}
{ editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
{ booktitle empty$
    { "need editor, key, or booktitle for " cite$ * " to crossref " *
      crossref * warning$
      ""
    }
    { bbl.in " {\em " * booktitle * "\/}" * }
  if$
}
{ bbl.in key * }
      if$
    }
    { bbl.in format.crossref.editor * }
  if$
  " \cite{" * crossref * "}" *
}

FUNCTION {article}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  crossref missing$
    { format.journal.vol.num.date output
      format.pages output
    }
    { format.article.crossref output.nonnull
      format.pp.pages output
    }
  if$
  new.block
  note output
  fin.entry
}

FUNCTION {book}
{ output.bibitem
  fa.isPersianLanguage
  {
    format.authors  output
    new.block
    format.btitle "title" output.check
    format.edition output
    new.block
    format.translators output
   format.editors  output
  }
  { author empty$
      { format.editors "author and editor" output.check }
      { format.authors output.nonnull
        crossref missing$
      { "author and editor" editor either.or.check }
      'skip$
        if$
    }
    if$
    new.block
    format.btitle "title" output.check
    format.edition output
  }
  if$
  crossref missing$
    { format.bvolume output
      new.block
      format.number.series output
      new.sentence
      publisher "publisher" output.check
      address output
    }
    { new.block
      format.book.crossref output.nonnull
    }
  if$
  format.date "year" output.check
  new.block
  note output
  fin.entry
}

FUNCTION {booklet}
{ output.bibitem
  format.authors output
  new.block
  format.title "title" output.check
  howpublished address new.block.checkb
  howpublished output
  address output
  format.date output
  new.block
  note output
  fin.entry
}

FUNCTION {inbook}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check }
    { format.authors output.nonnull
      crossref missing$
{ "author and editor" editor either.or.check }
'skip$
      if$
    }
  if$
  new.block
  format.btitle "title" output.check
  format.edition output
  crossref missing$
    { format.bvolume output
      new.block
      format.number.series output
      new.sentence
      publisher "publisher" output.check
      address output
    }
    {
      new.block
      format.book.crossref output.nonnull
    }
  if$
  format.date "year" output.check
  format.chapter.pages "chapter and pages" output.check
  new.block
  note output
  fin.entry
}

FUNCTION {incollection}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  crossref missing$
    { format.in.ed.booktitle "booktitle" output.check
      format.edition output
      format.bvolume output
      format.number.series output
      new.sentence
      publisher "publisher" output.check
      address output
      format.date "year" output.check
    }
    { format.incoll.inproc.crossref output.nonnull
    }
  if$
  format.chapter.pages output
  new.block
  note output
  fin.entry
}

FUNCTION {inproceedings}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  crossref missing$
    { format.in.proc.date "booktitle" output.check
      format.ineditors output
      format.bvolume output
      format.number.series output
  organization output
  publisher output
}
    { format.incoll.inproc.crossref output.nonnull  }
  if$
  format.pp.pages output
  new.block
  note output
  fin.entry
}

FUNCTION {conference} { inproceedings }

FUNCTION {manual}
{ output.bibitem
  author empty$
    { organization scapify output }
    { format.authors output.nonnull }
  if$
  new.block
  format.btitle "title" output.check
  format.edition output
  author empty$
{ address new.block.checka }
    { organization address new.block.checkb
      organization output
    }
  if$
  address output
  format.date output
  new.block
  note output
  fin.entry
}

FUNCTION {mastersthesis}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  bbl.mthesis
  format.thesis.type output.nonnull
  school "school" output.check
  address output
  format.date "year" output.check
  new.block
  note output
  fin.entry
}

FUNCTION {misc}
{ output.bibitem
  format.authors output
  title howpublished new.block.checkb
  format.title output
  howpublished new.block.checka
  howpublished output
  format.date output
  new.block
  note output
  fin.entry
  empty.misc.check
}

FUNCTION {phdthesis}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.btitle "title" output.check
  new.block
  bbl.phdthesis
  format.thesis.type output.nonnull
  school "school" output.check
  address output
  format.date "year" output.check
  new.block
  note output
  fin.entry
}

FUNCTION {proceedings}
{ output.bibitem
  editor empty$
    { organization scapify output }
    { format.editors output.nonnull }
  if$
  new.block
  title format.proc.date "title" output.check
  format.bvolume output
  format.number.series output
  editor empty$
'skip$
{ organization output }
  if$
  publisher output
  new.block
  note output
  fin.entry
}

FUNCTION {techreport}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  format.tr.number output.nonnull
  institution "institution" output.check
  address output
  format.date "year" output.check
  new.block
  note output
  fin.entry
}

FUNCTION {unpublished}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  note "note" output.check
  format.date output
  fin.entry
}

FUNCTION {default.type} { misc }

MACRO {jan} {"Jan."}

MACRO {feb} {"Feb."}

MACRO {mar} {"Mar."}

MACRO {apr} {"Apr."}

MACRO {may} {"May"}

MACRO {jun} {"June"}

MACRO {jul} {"July"}

MACRO {aug} {"Aug."}

MACRO {sep} {"Sept."}

MACRO {oct} {"Oct."}

MACRO {nov} {"Nov."}

MACRO {dec} {"Dec."}

MACRO {acmcs} {"ACM Comput. Surv."}

MACRO {acta} {"Acta Inf."}

MACRO {cacm} {"Commun. ACM"}

MACRO {ibmjrd} {"IBM J. Res. Dev."}

MACRO {ibmsj} {"IBM Syst.~J."}

MACRO {ieeese} {"IEEE Trans. Softw. Eng."}

MACRO {ieeetc} {"IEEE Trans. Comput."}

MACRO {ieeetcad}
 {"IEEE Trans. Comput.-Aided Design Integrated Circuits"}

MACRO {ipl} {"Inf. Process. Lett."}

MACRO {jacm} {"J.~ACM"}

MACRO {jcss} {"J.~Comput. Syst. Sci."}

MACRO {scp} {"Sci. Comput. Programming"}

MACRO {sicomp} {"SIAM J. Comput."}

MACRO {tocs} {"ACM Trans. Comput. Syst."}

MACRO {tods} {"ACM Trans. Database Syst."}

MACRO {tog} {"ACM Trans. Gr."}

MACRO {toms} {"ACM Trans. Math. Softw."}

MACRO {toois} {"ACM Trans. Office Inf. Syst."}

MACRO {toplas} {"ACM Trans. Program. Lang. Syst."}

MACRO {tcs} {"Theoretical Comput. Sci."}

READ

FUNCTION {sortify}
{
  fa.isPersianLanguage
    { "l" change.case$}
    {purify$ "l" change.case$}
  if$
  %duplicate$ write$
}

INTEGERS { len }

FUNCTION {chop.word}
{ 's :=
  'len :=
  s #1 len substring$ =
    { s len #1 + global.max$ substring$ }
    's
  if$
}

FUNCTION {sort.format.names}
{ 's :=
  #1 'nameptr :=
  ""
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
      { nameptr #1 >
    { "   " * }
    'skip$
      if$
      s nameptr "{vv{ } }{ll{ }}{  ff{ }}{  jj{ }}" format.name$ 't :=
      nameptr numnames = t "others" = and
   { bbl.etal * }
   { t sortify * }
      if$
  nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {sort.format.title}
{ 't :=
  "A " #2
    "An " #3
      "The " #4 t chop.word
    chop.word
  chop.word
  sortify
  #1 global.max$ substring$
}

FUNCTION {author.sort}
{ author empty$
    { key empty$
    { "to sort, need author or key in " cite$ * warning$
     ""
    }
    { key sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {author.editor.sort}
{ author empty$
    { editor empty$
{ key empty$
    { "to sort, need author, editor, or key in " cite$ * warning$
      ""
    }
    { key sortify }
  if$
}
{ editor sort.format.names }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {author.organization.sort}
{ author empty$
    { organization empty$
{ key empty$
    { "to sort, need author, organization, or key in " cite$ * warning$
      ""
    }
    { key sortify }
  if$
}
{ "The " #4 organization chop.word sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {editor.organization.sort}
{ editor empty$
    { organization empty$
{ key empty$
    { "to sort, need editor, organization, or key in " cite$ * warning$
      ""
    }
    { key sortify }
  if$
}
{ "The " #4 organization chop.word sortify }
      if$
    }
    { editor sort.format.names }
  if$
}

FUNCTION {presort}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.sort
    { type$ "proceedings" =
'editor.organization.sort
{ type$ "manual" =
    'author.organization.sort
    'author.sort
  if$
}
      if$
    }
  if$
  "    "
  *
  year field.or.null sortify
  *
  "    "
  *
  title field.or.null
  sort.format.title
  *
  #1 entry.max$ substring$
  'sort.key$ :=
}

ITERATE {presort}

SORT

STRINGS { longest.label }

INTEGERS { number.label longest.label.width }

FUNCTION {initialize.longest.label}
{ "" 'longest.label :=
  #1 'number.label :=
  #0 'longest.label.width :=
}

FUNCTION {longest.label.pass}
{ number.label int.to.str$ 'label :=
  number.label #1 + 'number.label :=
  label width$ longest.label.width >
    { label 'longest.label :=
      label width$ 'longest.label.width :=
    }
    'skip$
  if$
}

EXECUTE {banner.message}
EXECUTE {initialize.longest.label}

ITERATE {longest.label.pass}

FUNCTION {begin.bib}
{
  "% Generated by acm-fa.bst,  version: " bst.file.version * " (" * bst.file.date * "), for XePersian Package" *
  write$ newline$
  "% Authors: " bst.file.authors *
  write$ newline$
  "\providecommand{\noopsort}[1]{}"
  write$ newline$
  preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
  "\begin{thebibliography}{"  longest.label  * "}" * write$ newline$
}

EXECUTE {begin.bib}

EXECUTE {init.state.consts}

ITERATE {call.type$}

FUNCTION {end.bib}
{ newline$
  "\end{thebibliography}" write$ newline$
}

EXECUTE {end.bib}
EXECUTE{completed.message}
