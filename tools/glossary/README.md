Script in Perl per l'aggiunta automatica del pedice sulle parole in Glossario.<br />

FUNZIONAMENTO:<br />

Glossario:<br />
-Utilizzare questo comando, all'interno di Glossario.tex:<br />


\newcommand{\glossaryElement}[1]{<br />
  \textbf{#1}<br />
}<br />
<br />
-Creare un Glossario.tex seguendo il seguente template: <br />
\newglossaryentry{VOCE DEL GLOSSARIO}<br />
{<br />
name=nome,<br />
description=Descrizione, nonumberlist<br />
}
<br />
Script:<br />
-Inserire nella stessa cartella lo script glossaryAdd.pl, il file di Glossario.tex e tutti gli altri file .tex da modificare (non devono avere lo stesso nome).<br />
-Avviare lo script tramite il comando perl glossaryAdd.pl <br />
