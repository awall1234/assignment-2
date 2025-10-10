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

*2 Custom Histograms

hist fhn_fotnsc , name(hist1, replace) bins(5) freq
hist fhp_score5 , name(hist2, replace) bins(10) freq

*3 Scatter Plot

scatter fhn_fotnsc fhp_score5

*It is difficult to determine causal relationships from a scatter plot. Depending on the variables you could make an intuitive guess but it would be really easy to be wrong and make an error of logical reasoning. The two variables defintely seem to be correlated but I cannot say is their is a causal relationship. For example it could be spurious.


*PART 3

*1 
sum pei_peii qs_proff
describe pei_peii qs_proff
* qs_proff also know as ofessional Public Administration is a measure of how professional rather than politicized a states administration is. It is based off of other measures such as how closed or open and administration is. 

*pei_peii also know as perception of Electoral Integrity Index is an index that determines how a states electoral process matches up to international norms and standards. It is based off experts' answers to a series of questions.

*Sescribing the variables gives us technical info regarding how they are stored in stata. While summarizing them gives us some info regarding the actual data. "Obs" tells us home any states are represented. We also get the average score, the min/max scores for each and the std deviation, a measure of spread, giving us an idea of how far from the mean most data lies. For qs_proff higher values mean more profresional and for pei_peii higher values mean higher perceived integrity

*2 
sc pei_peii qs_proff , name(graph1)

*In the scatterplot we can see that states that have higher perceptions of electoral integrity tend to have more professional administrations. I am making this obeservation based on looking that the top right and the bottom left sections of the plot. The middle section there is more variance and it's much harder to see a correclation. 

*3
* The scatterplot shows a weak degree of corellation given the weak correlation and that fact that scatterplots don't show causal relationships it is difficult to say. If I were forced to guess I would say that as more public facing admin causes greater degree of electoral integrity becuase assuming the election is run by a part of the admin it would be more open if the admin is more professional. where a political admin would be running a politcalized election. 

