#!/bin/bash

# Make the data directory, to store saved datasets
mkdir -p data
cd data/

# Code to download the ds003097 dataset, and all associated files in the examples
datalad clone https://github.com/OpenNeuroDatasets/ds003097.git
cd ds003097/

datalad get derivatives/freesurfer/sub-*/surf/*.area derivatives/freesurfer/sub-*/surf/*.thickness derivatives/fmriprep/sub-*/func/sub-*_task-moviewatching_space-MNI152NLin2009cAsym_desc-aseg_dseg.nii.gz derivatives/fmriprep/sub-*/func/sub-*_task-moviewatching_space-MNI152NLin2009cAsym_desc-preproc_bold.nii.gz derivatives/fmriprep/sub-0001/func/ derivatives/fmriprep/sub-*/func/sub-*_task-moviewatching_space-fsaverage5_hemi-*.func.gii derivatives/fmriprep/sub-*/func/sub-*_task-moviewatching_desc-confounds_regressors.tsv derivatives/fmriprep/sub-*/func/sub-*_task-moviewatching_space-T1w_desc-aseg_dseg.nii.gz derivatives/fmriprep/sub-*/func/sub-*_task-moviewatching_space-T1w_desc-preproc_bold.nii.gz derivatives/physiology/sub-*/physio/sub-*_task-moviewatching_recording-respcardiac_desc-retroicor_regressors.tsv derivatives/freesurfer/sub-*/label/*.aparc.a2009s.annot derivatives/freesurfer/sub-*/surf/*.thickness derivatives/fs_stats/data-*.tsv derivatives/fmriprep/sub-*/anat/sub-*_hemi-*_midthickness.surf.gii derivatives/freesurfer/sub-*/surf/*.sphere.reg


#datalad clone https://github.com/OpenNeuroDatasets/ds002785.git
#datalad clone https://github.com/OpenNeuroDatasets/ds002790.git

# derivatives/fs_stats/data-*.tsv
