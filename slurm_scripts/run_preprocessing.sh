#!/bin/bash

#SBATCH -p medium
#SBATCH -o /work/ws-tmp/g051176-New_GIFS/gifs/output/out3/%j.out
#SBATCH -e /work/ws-tmp/g051176-New_GIFS/gifs/output/err3/%j.err
#SBATCH -t 1-00:00:00
#SBATCH -a 0-199%30
#SBATCH -c 32

#SBATCH --mail-type=ALL
#SBATCH --mail-user=suraj.bhardwaj@student.uni-siegen.de


export PYTHONPATH=.
python /work/ws-tmp/g051176-New_GIFS/gifs/dataprocessing/preprocess.py --config /work/ws-tmp/g051176-New_GIFS/gifs/configs/shapenet_cars.txt --num_cpus 32 --num_chunks 200 --current_chunk $SLURM_ARRAY_TASK_ID