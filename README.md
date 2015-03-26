# EDAS - Epileptic Driver Assistance System

1. Run one of 

<p> ppmat.py /* preictal */ </p>
<p> ipmat.py /* interictal */ </p>
<p> tmat.py /* test */ </p>

saves to /data/<segment type><segment number>.txt

2. In load.m edit fields segment and type

Run load.m in Ocatve

3. Run ep.m to calculate cross correlations and save to file.

4. Run savemovie.m to transpose and save as csv

5. Run ./convert svmdata/test.txt > svmdata/svmtext.txt


