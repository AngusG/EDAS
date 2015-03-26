# EDAS - Epileptic Driver Assistance System

<ol>

Run one of 

<ul>

<li> ppmat.py /* preictal */ </li>
<li>  ipmat.py /* interictal */ </li>
<li>  tmat.py /* test */ </li>

</ul>

saves to '/data/<segment_type><segment_number>.txt'

In load.m edit fields segment and type

<li> Run load.m in Ocatve </li>

<li> Run ep.m to calculate cross correlations and save to file. </li>

<li> Run savemovie.m to transpose and save as csv </li>

<li> Run ./convert svmdata/test.txt > svmdata/svmtext.txt </li>

</ol>

