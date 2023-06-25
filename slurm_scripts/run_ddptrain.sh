#!/bin/bash

#SBATCH -p gpu
#SBATCH --gres=gpu:2
#SBATCH -o /work/ws-tmp/g051176-New_GIFS/gifs/train_output/train_6.out
#SBATCH -e /work/ws-tmp/g051176-New_GIFS/gifs/train_error/train_6.err
#SBATCH -t 02:00:00
#SBATCH --mem=225G
#SBATCH --ntasks=1

#SBATCH --mail-type=ALL
#SBATCH --mail-user=suraj.bhardwaj@student.uni-siegen.de

module load GpuModules

eval "$(conda shell.bash hook)"
conda deactivate
conda activate New_Gifs

export PYTHONPATH=.
python /work/ws-tmp/g051176-New_GIFS/gifs/ddp_train.py --config /work/ws-tmp/g051176-New_GIFS/gifs/configs/shapenet_cars.txt