view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/paritybitodd3bits/X0 
wave create -driver freeze -pattern clock -initialvalue 0 -period 150ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/paritybitodd3bits/X1 
wave create -driver freeze -pattern clock -initialvalue 0 -period 200ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/paritybitodd3bits/X2 
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/paritybiteven3bits/X0 
wave create -driver freeze -pattern clock -initialvalue 0 -period 200ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/paritybiteven3bits/X1 
wave create -driver freeze -pattern clock -initialvalue 0 -period 130ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/paritybiteven3bits/X2 
WaveCollapseAll -1
wave clipboard restore
