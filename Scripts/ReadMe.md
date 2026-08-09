##  Data_Preprocess_01.m
- File name has changed from s1_cleaner to Data_Preprocess_01.m
- (1) Concatenate all sessions  ---> 
- (2) Removing the References , Selecting the EEG Channels  --->
- (3) Extracting the onset Trials. 
- Extract 126 EEG Channels from all sessions as data.mat
- Extract onset events from trigger and TRL_Success as events.mat

- The code is executed on EEG Data Folder containing (22 Subjects): 
- sub02-t1, sub03-t1, sub04-t1, sub05-t1, sub08-t1, sub09-t1, sub10-t1,
- sub11-t1, sub13-t1, sub14-t1, sub15-t1, sub18-t1, sub19-t1, sub20-t1, 
- sub21-t1, sub22-t1, sub23-t1, sub24-t1, sub25-t1, sub26-t1, sub28-t1, sub29-t1

- Subjects with full Trials (155 events and 10 iteration for each = 1550 or 1549) are (15 Subjects): 
- sub08-t1, sub09-t1, sub10-t1, sub11-t1, sub14-t1, sub15-t1, sub18-t1,
- sub19-t1, sub20-t1, sub21-t1, sub24-t1, sub25-t1, sub26-t1, sub28-t1, sub29-t1

- Subjects with imperfect Trials are (4 Subjects):
- sub05-t1, sub13-t1, sub22-t1, sub23-t1


- Subjects with empty nevent are (3 Subjects):
- sub02-t1, sub03-t1, sub04-t1

- No Subject Folder with name : 
- sub01-t1, sub06-t1, sub07-t1, sub12-t1, sub16-t1, sub17-t1, sub27-t1,
