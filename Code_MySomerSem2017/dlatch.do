view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/dlatch/Clock 
wave create -driver freeze -pattern random -initialvalue U -period 100ps -random_type Uniform -seed 5 -starttime 0ps -endtime 1000ps sim:/dlatch/D 
wave modify -driver freeze -pattern random -initialvalue 0 -period 100ps -random_type Normal -seed 0 -starttime 0ps -endtime 1000ps Edit:/dlatch/D 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 266ps -dutycycle 50 -starttime 0ps -endtime 1000ps Edit:/dlatch/D 
WaveCollapseAll -1
wave clipboard restore
