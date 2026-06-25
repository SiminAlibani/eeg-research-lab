# EEG Dataset (30 Subjects)

## Overview
This dataset contains multichannel EEG recordings from 30 human subjects.

Each recording includes:
- 130 channels total
- Channel 1: time index
- Channel 130: event trigger signals
- Channels 63–64: reference electrodes (left/right ear)
- 126 scalp EEG channels with spatial labeling

## Structure
- subject_XX_t1/: raw recordings per subject
- sample/: small subset for GitHub preview
- metadata/: channel mappings and dataset description

## Usage
This dataset is designed for:
- Event-related EEG analysis
- Signal decoding tasks
- Machine learning classification
- Spatial EEG analysis

## Notes
Only a sample subject is included in this repository.
Full dataset is stored separately due to size constraints.
