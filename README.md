# Docker container for STAR aligner

In this repo, you will make your Docker container to run STAR 2.7.11f.
To run your alignments, create a new folder, similar to "johnson_alignments".

In there create 2 folders:
- scripts: you can reuse the scripts in here to make the genome index and run alignments.
- data: all of your fastq.gz files. It is assumed that the files are paired end.

Running the docker container will make 2 results folders:
- alignments: alignment results
- genome: genome index for hg38, gencode v48

To run the docker container:
- install Docker desktop
- make sure it is running
- run launch_star_docker.sh