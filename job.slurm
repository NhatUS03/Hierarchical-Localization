#!/bin/bash
#SBATCH --job-name=demo_hloc         # create a short name for your job
#SBATCH --nodes=1                # node count
#SBATCH --ntasks=1               # total number of tasks across all nodes
#SBATCH --cpus-per-task=2        # cpu-cores per task (>1 if multi-threaded tasks)
#SBATCH --mem=12G                # memory per cpu-core (4G is default)
#SBATCH --gres=gpu:2             # number of gpus per node
#SBATCH --time=03:30:00          # total run time limit (HH:MM:SS)
#SBATCH --mail-type=begin        # send email when job begins
#SBATCH --mail-type=fail         # send email when job ends
#SBATCH --mail-type=end          # send email when job ends
#SBATCH --qos=short             
#SBATCH --output=/media02/lnthanh02/hoangnhat/hloc_run/Hierarchical-Localization/outputs/logs/%j-%x.out    
#SBATCH --error=/media02/lnthanh02/hoangnhat/hloc_run/Hierarchical-Localization/outputs/logs/%j-%x.err         
#SBATCH --qos=short             
#SBATCH --mail-user=21120516@student.hcmus.edu.vn

#j=job id 
#x = name of job 
spack load cuda@11.8.0

@Config conda 
eval "$(conda shell.bash hook)"

conda activate indoor_nv_env


#Change dir 
cd /media02/lnthanh02/hoangnhat/hloc_run/Hierarchical-Localization

chmod +x run.sh

./run.sh