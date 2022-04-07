import pandas as pd
import os

def load_rois(loc):
    
    # Load as dataframe
    data = pd.read_csv(loc, sep='\t')
    name = list(data)[0]
    
    # Set to correct index
    data = data.set_index(list(data)[0])
    
    # Change index name
    data.index.name = 'participant_id'

    # Drop last 3 cols
    data = data.drop(columns=list(data)[-3:])
    
    return data

# Get location of the saved dataset
data_dr = os.path.join(os.path.dirname(os.getcwd()), 'data')
dataset_dr = os.path.join(data_dr, 'ds002790')
deriv_dr = os.path.join(dataset_dr, 'derivatives')
fs_stats_dr = os.path.join(deriv_dr, 'fs_stats')

# Load the participents file as a bp Dataset
targets_loc = os.path.join(dataset_dr, 'participants.tsv')
targets = pd.read_csv(targets_loc, sep='\t', index_col='participant_id')

# Just use age
target = targets[['age', 'sex']]
target.head()

lh = load_rois(os.path.join(fs_stats_dr,
          'data-cortical_type-aparc.a2009s_measure-thickness_hemi-lh.tsv'))
rh = load_rois(os.path.join(fs_stats_dr,
          'data-cortical_type-aparc.a2009s_measure-thickness_hemi-rh.tsv'))

# Concat
data = pd.concat([lh, rh, target], axis=1)

# Drop missing
data = data.dropna()

# Save
data.to_csv('quick_start.csv', index=True)