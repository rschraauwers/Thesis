%% load data

  pp3= importdata('pp3_MinMax_Markers.MRK');
  
  pp4_1= importdata('pp4deel1oefenenhabituatie_MinMax_Markers.MRK');
  pp4_2= importdata('pp4deel2echtetaak_MinMax_Markers.MRK');
 
  pp5= importdata('pp5_MinMax_Markers.MRK');
  pp6= importdata('pp6_MinMax_Markers.MRK');
  pp8= importdata('pp8_MinMax_Markers.MRK');
  pp9= importdata('pp9_MinMax_Markers.MRK');
  pp10= importdata('pp10_MinMax_Markers.MRK');
  pp11= importdata('pp11_MinMax_Markers.MRK');
  pp12= importdata('pp12_MinMax_Markers.MRK');
  pp13= importdata('pp13_MinMax_Markers.MRK');
  pp14= importdata('pp14_MinMax_Markers.MRK');
  pp15= importdata('pp15_MinMax_Markers.MRK');
  pp16= importdata('pp16_MinMax_Markers.MRK');
  pp17= importdata('pp17_MinMax_Markers.MRK');
  pp18= importdata('pp18_MinMax_Markers.MRK');
  pp19= importdata('pp19_MinMax_Markers.MRK');
  pp20= importdata('pp20_MinMax_Markers.MRK');
  pp21= importdata('pp21_MinMax_Markers.MRK');
  trialnumber= importdata('trialnumber_stimuli.txt');
  header= importdata('header.txt');


%%making headers for all data. 
 %first number is arbitrary. 
 %second and third number are the participant's number,
 %fourth number stands for data column. column 1 is amplitude position. 
 %column 2 is peak-amplitude
 pp3_header=    [1031 1032];
 pp4_header=    [1041 1042];
 pp5_header=    [1051 1052];
 pp6_header=    [1061 1062];
 pp8_header=    [1081 1082];
 pp9_header=    [1091 1092];
 pp10_header=   [1101 1102];
 pp11_header=   [1111 1112];
 pp12_header=   [1121 1122];
 pp13_header=   [1131 1132];
 pp14_header=   [1141 1142];
 pp15_header=   [1151 1152];
 pp16_header=   [1161 1162];
 pp17_header=   [1171 1172];
 pp18_header=   [1181 1182];
 pp19_header=   [1191 1192];
 pp20_header=   [1201 1202];
 pp21_header=   [1211 1212];
 
 
%% putting headers above raw data
 pp3=   [pp3_header;pp3.data];
 pp4=   [pp4_header;pp4.data];
 pp5=   [pp5_header; pp5.data];
 pp6=   [pp6_header;pp6.data];  
 pp8=   [pp8_header; pp8.data];
 pp9=   [pp9_header;pp9.data];
 pp10=  [pp10_header;pp10.data];
 %%pp11=  [pp11_header; pp11.data];
 pp12=  [pp12_header;pp12.data];
 pp13=  [pp13_header;pp13.data];
 pp14=  [pp14_header; pp14.data];
 pp15=  [pp15_header;pp15.data];
 pp16=  [pp16_header;pp16.data];
 pp17=  [pp17_header; pp17.data];
 pp18=  [pp18_header;pp18.data];
 pp19=  [pp19_header;pp19.data];
 pp20=  [pp20_header; pp20.data];
 pp21=  [pp21_header; pp21.data];
 
 
%% small error in datafile for pp12. row 18 was be deleted.
pp12 = pp12(setdiff(1:size(pp12,1),[18]),:);


 %% placing trialnumber and conditions before all data.
%first row contains trialnumbers. Trial 1-12 are habituation-trials, 13-84 are test-trials.
% second row contains number of stimulus stimulusmarkers
%999 stands for non-defined stimulus. Stimulusmarker is random for the
%first 12 trials, but consistent for all test trials
 

%%Merging all data together
%pp11 and 7 are missing, misses test-data
datatotal = [trialnumber pp3 pp4 pp5 pp6 pp8 pp9 pp10 pp12 pp13 pp14 pp15 pp16 pp17 pp18 pp19 pp20 pp21];

%%Writing only  peak-amplitude data of the test-trials to excel file
filename='CSET_data.xlsx';
A= datatotal;
b= datatotal([1 14:85],:)
c=b(:,[1 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36]); 
xlswrite(filename,c);

