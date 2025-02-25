class hellfire {
	color[] = common_black;
	condition = "missile";
	BOXEDTEXT(LASERL,0.93,(BEZEL_Y1-0.02),0.11,0.04,"PRI CHAN","1")
	BOXEDTEXT(LASERV,0.93,(BEZEL_Y1+0.02),0.04,0.04,"A",COND_ISNUMPYLON(42,0))
	BOXEDTEXT(LASERB,0.93,(BEZEL_Y1+0.02),0.04,0.04,"B",COND_ISNUMPYLON(42,1))
	BOXEDTEXT(LASERC,0.93,(BEZEL_Y1+0.02),0.04,0.04,"C",COND_ISNUMPYLON(42,2))
	BOXEDTEXT(LASERD,0.93,(BEZEL_Y1+0.02),0.04,0.04,"D",COND_ISNUMPYLON(42,3))
	BOXEDTEXT(LASERE,0.93,(BEZEL_Y1+0.02),0.04,0.04,"E",COND_ISNUMPYLON(42,4))
	BOXEDTEXT(LASERF,0.93,(BEZEL_Y1+0.02),0.04,0.04,"F",COND_ISNUMPYLON(42,5))
	
	BOXEDTEXT(ALTL,0.93,(BEZEL_Y2-0.02),0.11,0.04,"ALT CHAN","1")
	BOXEDTEXT(ALTV,0.93,(BEZEL_Y2+0.02),0.04,0.04,"A",COND_ISNUMPYLON(43,0))
	BOXEDTEXT(ALTB,0.93,(BEZEL_Y2+0.02),0.04,0.04,"B",COND_ISNUMPYLON(43,1))
	BOXEDTEXT(ALTC,0.93,(BEZEL_Y2+0.02),0.04,0.04,"C",COND_ISNUMPYLON(43,2))
	BOXEDTEXT(ALTD,0.93,(BEZEL_Y2+0.02),0.04,0.04,"D",COND_ISNUMPYLON(43,3))
	BOXEDTEXT(ALTE,0.93,(BEZEL_Y2+0.02),0.04,0.04,"E",COND_ISNUMPYLON(43,4))
	BOXEDTEXT(ALTF,0.93,(BEZEL_Y2+0.02),0.04,0.04,"F",COND_ISNUMPYLON(43,5))

	BOXEDTEXT(TRAJL,0.93,(BEZEL_Y3-0.02),0.09,0.04,"TRAJ","1")
	BOXEDTEXT(TRAJ_LO,0.93,(BEZEL_Y3+0.02),0.07,0.04,"LO",COND_ISNUMPYLON(41,0))
	BOXEDTEXT(TRAJV,0.93,(BEZEL_Y3+0.02),0.07,0.04,"DIR",COND_ISNUMPYLON(41,1))
	BOXEDTEXT(TRAJ_HI,0.93,(BEZEL_Y3+0.02),0.07,0.04,"HI",COND_ISNUMPYLON(41,2))

	BOXEDTEXT(ACQL,0.93,(BEZEL_Y4-0.02),0.07,0.04,"ACQ","1")
	BOXEDTEXT(ACQV,0.93,(BEZEL_Y4+0.02),0.07,0.04,"FLIR","1")
	class white {
		color[] = common_white;
		#include "hellfireBoxes.hpp"
	}; // white
};