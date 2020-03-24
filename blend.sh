#!/bin/bash

#SBATCH --time=02:00:00   # walltime
#SBATCH --ntasks=12   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=100MB   # memory per CPU core

# Compatibility variables for PBS. Delete if not needed.
export PBS_NODEFILE=`/fslapps/fslutils/generate_pbs_nodefile`
export PBS_JOBID=$SLURM_JOB_ID
export PBS_O_WORKDIR="$SLURM_SUBMIT_DIR"
export PBS_QUEUE=batch

# Blender specific variables
export EXECUTABLE=/fslhome/kastnerd/blender/blender-2.82-linux64/blender
export JOB=/fslhome/kastnerd/blender/jobs/balling2.blend
export OUTPUT=/fslhome/kastnerd/blender/jobs/balling2

# Set the max number of threads to use for programs using OpenMP. Should be <= ppn. Does nothing if the program doesn't use OpenMP.
export OMP_NUM_THREADS=$SLURM_CPUS_ON_NODE

# Execute and run Blender code
$EXECUTABLE -b $JOB -o $OUTPUT -E CYCLES -F PNG -x 1 -f 1 
#-t 48