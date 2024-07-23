#!/bin/bash

#SBATCH --job-name=ect
#SBATCH --mem=128GB
#SBATCH --account=mi2lab-normal
#SBATCH --gpus=8
#SBATCH --mail-user=tymoteusz.kwiecinski.stud@pw.edu.pl
#SBATCH --nodes=1
#SBATCH --partition=long
#SBATCH --time=5-00:00:00
echo "loading conda"
source /mnt/evafs/groups/mi2lab/tkwiecinski/scripts/conda/import.sh

cload /mnt/evafs/groups/mi2lab/tkwiecinski/conda.tar


conda activate ect
echo "running script"

python --version
which python
#python -c "import torch; print('gpus: ' + str(torch.cuda.device_count()))"
bash /mnt/evafs/groups/mi2lab/tkwiecinski/ect/run_song_celeba_1hour.sh 8 7777
