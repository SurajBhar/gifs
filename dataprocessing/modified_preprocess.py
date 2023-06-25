import multiprocessing as mp
from glob import glob
from multiprocessing import Pool

import numpy as np
from tqdm.contrib.concurrent import process_map

import configs.config_loader as cfg_loader
import dataprocessing.voxelized_pointcloud_sampling as voxelized_pointcloud_sampling
from dataprocessing.boundary_sampling import generate_labels
from dataprocessing.convert_to_scaled_off import to_off

cfg = cfg_loader.get_config()


print("Finding raw files for preprocessing.")
paths = glob(cfg.data_dir + cfg.input_data_glob)
paths = sorted(paths)

chunks = np.array_split(paths, cfg.num_chunks)
paths = chunks[cfg.current_chunk]


#if cfg.num_cpus == -1:
#    num_cpus = mp.cpu_count()
#else:
#    num_cpus = cfg.num_cpus


#def multiprocess(func):
#    p = Pool(num_cpus)
#    p.map(func, paths)
#    p.close()
#    p.join()

def to_off_wrapper(path):
    to_off(path)

def generate_labels_wrapper(path):
    generate_labels(path)

def voxelized_pointcloud_sampling_wrapper(path):
    voxelized_pointcloud_sampling.voxelized_pointcloud_sampling(path)

def main():
    function_order = cfg.function_order.split(',')
    for func_name in function_order:
        if func_name == 'to_off':
            print("Start scaling.")
            multiprocess(to_off_wrapper)
        elif func_name == 'generate_labels':
            print("Binary flags generation.")
            process_map(generate_labels_wrapper, paths, max_workers=3, chunksize=1)
        elif func_name == 'voxelized_pointcloud_sampling':
            print("Start voxelized pointcloud sampling.")
            voxelized_pointcloud_sampling.init(cfg)
            multiprocess(voxelized_pointcloud_sampling_wrapper)

if __name__ == '__main__':
    main()
