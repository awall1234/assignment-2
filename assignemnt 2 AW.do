** Part 1

* 1 - Name
*Adam Walker
*POL S 411
*Oct 7, 2025
*Dr. Snagovsky

*2 Data
*Opens the data set after clearing Stata
clear all
use "C:\Users\ajwalke1\Downloads\qog_bas_cs_jan20.dta"

*3 Research
*a) Does the amount of students in secondary school relate to the level of participation in a democracy?

*b) There is no relationship between students in secondary school and levels of participation in democracy.

*c) States that have higher levels of students in secondary school will have higher levels of political engaement. 

*4 Describe/codebook
describe wdi_ners vdem_partipdem
codebook wdi_ners vdem_partipdem
sum  wdi_ners vdem_partipdem

*5 Variable info
sum  wdi_ners vdem_partipdem, detail

*wdi_ners  School enrollment, secondary (% net):
*Mean=71.38, Median=82.13, Min=5.48, Max=99.53, SD=24.29, Skew=-0.82

*vdem_partipdem Participatory democracy index:
*Mean=0.34, Median=0.33, Min=0.01, Max=0.79, SD=0.20, Skew=-0.15

*6 Table
*a)
gen students_in_secondary =.

replace students_in_secondary = 1 if wdi_ners <=33.33
replace students_in_secondary = 2 if wdi_ners >33.33 & wdi_ners <=66.66
replace students_in_secondary = 3 if wdi_ners >66.66


label define students_in_secondary_labels 1 "Low Education" 2 "Medium Education" 3 "High Education"
label values students_in_secondary students_in_secondary_labels
label variable students_in_secondary "Students in Secondary School"


gen public_participation =.

replace public_participation = 1 if vdem_partipdem >=0 & vdem_partipdem <=0.33
replace public_participation = 2 if vdem_partipdem >0.33 & vdem_partipdem <=0.66
replace public_participation = 3 if vdem_partipdem >0.66 & vdem_partipdem <=1


label define public_participation_labels 1 "Low" 2 "Medium" 3 "High"
label values public_participation public_participation_labels
label variable public_participation "Public Participation"

*b)
tab students_in_secondary public_participation
*we can see that there are 14 states that have low levels of secondary education and low levels of democratic participation. We can see that there are 6 countires with high levels of democratic participation and all of them have high levels of secondary education. 

*7 I think that looking at the table indicates that as the level of education increases the level of participation in democarcy does aswell. You can see that the distrobution between levels of participation shifts to the right as you move higher in education axis. This would support my alternative hypothesis. In the interest of being a good scientist I wouldn't make this claim without doing further statistical analysis. I'd like to do a Chi test but I don't have the minimum of 10 in each category to do so. 


** Part 2
*1 Schema
ssc install blindschemes
set scheme plottig

*2 

hist fhn_fotnsc 
hist fhp_score5

