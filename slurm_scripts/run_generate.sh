#!/bin/bash

#SBATCH -p gpu
#SBATCH --gres=gpu:1
#SBATCH --mem=225G
#SBATCH --ntasks=1

#SBATCH --mail-type=ALL
#SBATCH --mail-user=suraj.bhardwaj@student.uni-siegen.de
#SBATCH -o /work/ws-tmp/g051176-New_GIFS/gifs/output/out5/generate_2_out.out
#SBATCH -e /work/ws-tmp/g051176-New_GIFS/gifs/output/err5/generate_2_err.err
#SBATCH -t 1-00:00:00

#SBATCH --mail-type=ALL
#SBATCH --mail-user=suraj.bhardwaj@student.uni-siegen.de

module load GpuModules

eval "$(conda shell.bash hook)"
conda deactivate
conda activate New_Gifs

export PYTHONPATH=.
python /work/ws-tmp/g051176-New_GIFS/gifs/generate.py --config /work/ws-tmp/g051176-New_GIFS/gifs/configs/shapenet_cars.txt