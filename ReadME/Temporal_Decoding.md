The First preprocessing is done for all 19 subjects (05 - 08 - 09 - 10 - 11 - 13- 14 - 15 - 18 - 19 - 20 - 21 - 22 - 23 - 24 - 25 - 26 - 28 - 29 ) as follows:
- Concatenate all sections for every subject and remove two ref. channels (63 , 64), and select the correct trial based on onset flag, and make two data.mat (containing 126 channel * x samples ) and
  events.mat (containing latency and type ) files.
- Load data.mat , events.txt , location_xyz.txt in EEGLAB
- Resample the data  : 1200 to 200 (Hz)
- Filter the data, a bandpass FIR filter : 0.5 to 45 (Hz) for removing the DC offset, Line noise, and other high frequency noise
- The signal was trimmed at both ends to remove unnecessary data : About one second before the first trial and about two second after the last trial.
- Applying the ICA for artifacts rejection (if any muscle artifact, eye blink, eye movement,  ECG , ....). As we have 126 ICA components, at this time we just do it without direct using.
- Extract Epochs based on category study : (1) HSF vs LSF (now), (2) Animate vs Inanimate , ...
- ERP Analysis
- Export Data for the next analysis : SVM(now), Temporal SVM(now), RDM, RSA, ....
- Applying Temporal Decoding (SVM) for subject 09.
Raw EEG
      │
      ▼
Preprocessing
      │
      ▼
Epoching
      │
      ▼
Sliding Window
      │
      ▼
Metadata Generation
      │
      ▼
Group Cross Validation
      │
      ▼
Normalization
      │
      ▼
Linear SVM
      │
      ▼
Temporal Decoding Curve
